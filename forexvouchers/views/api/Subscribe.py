import json
from mailchimp3 import MailChimp


from django.http import HttpResponse
from django.views import View
from mailchimp3.mailchimpclient import MailChimpError

from cms.models import GeneralSettings


class SubscribeView(View):
    def post(self, request):
        social_media_settings = GeneralSettings.for_site(request.site)

        email = request.POST['email']
        response = { 'message': '' }
        status=400

        try:
            client = MailChimp(social_media_settings.mailchimp_api_key)
            user_data = client.lists.members.create(social_media_settings.mailchimp_list_id, {
                'email_address': email,
                'status': 'subscribed',
            })
            status = 200
            response['message'] = 'Your email was correctly subscribed'
        except MailChimpError as e:
            try:
                if e.args[0]['title'] == 'Member Exists':
                    response['message'] = 'You are already subscribed'
            except:
                response['message'] = 'We could not register this email'
        except:
            response['message'] = 'We could not register this email'

        return HttpResponse(json.dumps(response), content_type="application/json", status=status)