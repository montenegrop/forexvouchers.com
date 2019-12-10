import json
from django.http import HttpResponse

from cms.helpers.ServiceHelper import ServiceHelper, BROKERS
from cms.models import Service, Voucher


def get_services(request):
    limit = int(request.GET.get('limit', 10))
    category = int(request.GET.get('category', BROKERS))

    response = { 'data': [] }

    services = Service.objects.filter(category=category).order_by('name')[0:limit].filter()
    response['data'] = [ServiceHelper(service).to_dict() for service in services]

    return HttpResponse(json.dumps(response), content_type="application/json")
