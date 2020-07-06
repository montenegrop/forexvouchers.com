import json

from django.http import HttpResponseRedirect, HttpResponse
from geoip2.errors import AddressNotFoundError
import logging
from cms.models.business_models import Comment, Service, Affiliate, Discount, PromoCode, Offer
from django.contrib.gis.geoip2 import GeoIP2
from django.views import View

from cms.models import GeneralSettings
from mailchimp3 import MailChimp
from mailchimp3.mailchimpclient import MailChimpError


logger = logging.getLogger(__name__)


class CommentsView(View):

    def calc_service_rate(self, newComment, serviceId):
        comments = Comment.objects.filter(service_id=serviceId, active=True)
        sum = newComment.stars
        count = 1
        for comment in comments:
            count += 1
            sum += comment.stars

        return (count, sum / count if sum else 0,)

    def get(self, request):
        serviceId = int(request.GET.get('service_id'))
        page = int(request.GET.get('page', 0))
        limit = int(request.GET.get('limit', 10))
        sortby = request.GET.get('sort_by', 'relevance')
        starsFilter = int(request.GET.get('stars', -1))
        sortType = request.GET.get('sort_type', 'asc')
        permalink = request.GET.get('permalink', '')
        response = {'data': [], 'page': page}

        comment_id = None
        if len(permalink.split('-')) > 1:
            comment_id = int(permalink.split('-')[1])

        if serviceId is None:
            raise Exception('serviceId not given in the url')

        comments = Comment.objects.filter(service_id=serviceId, active=True).order_by('-created_at')
        parents = list(filter(lambda comment: comment.parent_comment is None, comments))
        filteredParents = list(filter(lambda comment: starsFilter == -1 or comment.stars == starsFilter, parents))
        if comment_id:
            permacomment = None
            pos = 0
            while permacomment == None and pos < len(parents):
                if parents[pos].id == comment_id:
                    permacomment = parents[pos].id
                pos += 1
            page = int((pos - 1) / limit) if permacomment else page
        slicedParents = filteredParents[page * limit: page * limit + limit]
        response['page'] = page

        response['total'] = len(parents)
        response['filteredTotal'] = len(filteredParents)
        response['stars1'] = len(list(filter(lambda comment: comment.stars == 1, parents)))
        response['stars2'] = len(list(filter(lambda comment: comment.stars == 2, parents)))
        response['stars3'] = len(list(filter(lambda comment: comment.stars == 3, parents)))
        response['stars4'] = len(list(filter(lambda comment: comment.stars == 4, parents)))
        response['stars5'] = len(list(filter(lambda comment: comment.stars == 5, parents)))

        for parent in slicedParents:
            item = parent.toDict()
            children = list(filter(lambda comment: comment.parent_comment_id == parent.id, comments))
            item['children'] = [child.toDict() for child in children]
            response['data'].append(item)

        return HttpResponse(json.dumps(response), content_type="application/json")

    def subscribe(self, email, request):
        social_media_settings = GeneralSettings.for_site(request.site)

        try:
            client = MailChimp(social_media_settings.mailchimp_api_key)
            user_data = client.lists.members.create(social_media_settings.mailchimp_list_id, {
                'email_address': email,
                'status': 'subscribed',
            })
            return (True, '')
        except MailChimpError as e:
            try:
                if e.args[0]['title'] == 'Member Exists':
                    return (False, 'You are already subscribed')
            except:
                return (False, 'We could not register this email')
        except:
            return (False, 'We could not register this email')

    def post(self, request):
        data = json.loads(request.body)
        service = Service.objects.get(pk=data['service_id'])
        comment = Comment(service=service,
                          review=data['review'],
                          stars=data['rate'],
                          name=data['name'],
                          active=True)

        g = GeoIP2()
        try:
            count, avg_rate = self.calc_service_rate(comment, serviceId=data['service_id'])
            service.avg_rate = avg_rate
            service.count_rate = count
            ip = request.META.get('HTTP_X_FORWARDED_FOR') if request.META.get(
                'HTTP_X_FORWARDED_FOR') else request.META.get('REMOTE_ADDR')

            logger.info(f"current ip {ip}")

            comment.country = g.city(ip)['country_name']
            comment.country_code = g.city(ip)['country_code']

        except AddressNotFoundError:
            logger.error(f"This ip {ip} is not valid AddressNotFoundError")
        except TypeError:
            logger.error(f"This ip {ip} is not valid TypeError")
        finally:
            comment.save()
            service.save()

        if 'email' in data and data['email']:
            self.subscribe(data['email'], request)

        response = {'data': comment.toDict()}
        return HttpResponse(json.dumps(response), content_type="application/json")


def cloakedlinks(request, slug):
    affiliate = Affiliate.objects.get(slug=slug)
    affiliate.clicks += 1
    affiliate.save()
    return HttpResponseRedirect(affiliate.cloakedLink)
