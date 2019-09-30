import json
from django.http import HttpResponse

from cms.helpers.ServiceHelper import ServiceHelper
from cms.models import Service


def get_services(request):
    limit=10
    response = { 'data': [] }

    services = Service.objects.order_by('name')[0:limit].filter()
    response['data'] = [ServiceHelper(service).to_dict() for service in services]

    return HttpResponse(json.dumps(response), content_type="application/json")
