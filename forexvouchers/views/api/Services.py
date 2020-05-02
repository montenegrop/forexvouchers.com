import json
from django.http import HttpResponse

from cms.helpers.ServiceHelper import ServiceHelper, BROKERS
from cms.models import Service


def get_services(request):
    limit = int(request.GET.get('limit', 10))
    category = int(request.GET.get('category', BROKERS))

    response = {'data': []}

    services = Service.objects.filter(category=category).order_by('name')[0:limit].filter()
    response['data'] = [ServiceHelper(service).to_dict() for service in services]

    return HttpResponse(json.dumps(response), content_type="application/json")


def get_partners(request):
    limit = int(request.GET.get('limit', 8))

    response = {'data': []}

    partners = Service.objects.filter(premium=True)[:limit]
    response['data'] = [ServiceHelper(partner).to_dict() for partner in partners]

    return HttpResponse(json.dumps(response), content_type="application/json")
