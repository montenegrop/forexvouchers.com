import json
from django.http import HttpResponse

from cms.helpers.ServiceHelper import ServiceHelper, BROKERS
from cms.models import Service, Voucher
from django.db.models import Q, Count
from django.views import View

class ServicesView(View):
    response = {'data': []}

    def get(self, request):
        categories = list(filter(lambda item: item, request.GET.get('categories', '').split(',')))
        limit = int(request.GET.get('limit', 10))

        response = {'data': []}

        # filtering conditions
        categoryConditions = Q(category_id__in=categories) if len(categories) else Q()
        #

        services = Service.objects.filter(categoryConditions)

        response['data'] = [ServiceHelper(service).to_dict() for service in services]

        return HttpResponse(json.dumps(response), content_type="application/json")
