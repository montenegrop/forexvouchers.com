import json

from django.http import HttpResponseRedirect, HttpResponse
from geoip2.errors import AddressNotFoundError
import logging
from cms.models.business_models import Comment, Service
from django.contrib.gis.geoip2 import GeoIP2
from django.views import View


logger = logging.getLogger(__name__)


class CommentsView(View):
    def get(self, request):
        serviceId = int(request.GET.get('service_id'))
        page = int(request.GET.get('page', 0))
        limit = int(request.GET.get('limit', 10))
        sortby = request.GET.get('sort_by', 'relevance')
        sortType = request.GET.get('sort_type', 'asc')
        response = {'data': []}

        if serviceId is None:
            raise Exception('serviceId not given in the url')

        comments = Comment.objects.filter(service_id=serviceId).order_by('-created_at')
        parents = list(filter(lambda comment: comment.parent_comment is None, comments))
        slicedParents = parents[page * limit: page * limit + limit]
        response['total'] = len(parents)

        for parent in slicedParents:
            item = parent.toDict()
            children = list(filter(lambda comment: comment.parent_comment_id == parent.id, comments))
            item['children'] = [child.toDict() for child in children]
            response['data'].append(item)

        return HttpResponse(json.dumps(response))

    def post(self, request):
        comment = Comment(service=Service.objects.get(slug=request.POST['slug']),
                          review=request.POST['review'],
                          stars=request.POST['rate'],
                          name=request.POST['name'],
                          active=True)

        g = GeoIP2()
        try:
            ip2 = request.META.get('HTTP_X_FORWARDED_FOR')
            ip = request.META.get('REMOTE_ADDR')

            logger.info(f"current ip {ip}")
            logger.info(f"current ip2 {ip2}")

            comment.country = g.city(ip2)['country_name']
            comment.country_code = g.city(ip2)['country_code']
        except AddressNotFoundError:
            logger.error(f"This ip {ip2} is not valid")
        except TypeError:
            logger.error(f"This ip {ip2} is not valid")
        finally:
            comment.save()

        return HttpResponseRedirect('/services/' + request.POST['slug'])