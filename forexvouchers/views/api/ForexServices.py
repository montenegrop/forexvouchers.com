import json
from django.http import HttpResponse
from django.views import View

from cms.helpers.ServiceHelper import ServiceHelper, BROKERS, TRAINING, VPS, TRADING_SYSTEM, SIGNALS, TOOLS
from django.db.models import Q, Count
from cms.models import Service


class ForexServicesView(View):
    response = {'data': []}

    def getCategoryCounts(self):
        category_counts = Service.objects.select_related('category') \
            .filter(~Q(category=BROKERS)) \
            .values('category__name', 'category') \
            .annotate(total=Count('category'))

        return list(
            map(lambda x: {'name': x['category__name'],
                           'id': x['category'],
                           'total': x['total']},
                category_counts))

    def get(self, request):
        limit = int(request.GET.get('limit', 10))
        category = int(request.GET.get('category', BROKERS))

        response = {'data': [],
                    'categories': self.getCategoryCounts()}

        # services = Service.objects.filter(category=category).order_by('name')[0:limit].filter()
        # response['data'] = [ServiceHelper(service).to_dict() for service in services]

        return HttpResponse(json.dumps(response), content_type="application/json")
