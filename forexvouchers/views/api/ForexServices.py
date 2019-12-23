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

        categories = list(filter(lambda item: item, request.GET.get('categories', '').split(',')))
        trading_types = list(filter(lambda item: item, request.GET.get('trading_types', '').split(',')))
        trading_softwares = list(filter(lambda item: item, request.GET.get('trading_softwares', '').split(',')))
        system_types = list(filter(lambda item: item, request.GET.get('system_types', '').split(',')))
        trading_tools = list(filter(lambda item: item, request.GET.get('trading_tools', '').split(',')))
        pricings = list(filter(lambda item: item, request.GET.get('pricings', '').split(',')))

        categoryConditions = Q(category__in=categories) if len(categories) else Q()
        tradingTypeConditions = Q(trading_type__in=trading_types) if len(trading_types) else Q()
        tradingSoftwareConditions = Q(trading_software__in=trading_softwares) if len(trading_softwares) else Q()
        systemTypeConditions = Q(system_type__in=system_types) if len(system_types) else Q()
        tradingToolsConditions = Q(trading_tools__in=trading_tools) if len(trading_tools) else Q()
        pricingModelConditions = Q(pricing_model__in=pricings) if len(pricings) else Q()

        services = Service.objects.filter(categoryConditions, tradingTypeConditions, tradingSoftwareConditions,
                                          systemTypeConditions, tradingToolsConditions, pricingModelConditions)

        response = {'data': [],
                    'categories': self.getCategoryCounts()}

        [response['data'].append(ser.toDict()) for ser in services]

        return HttpResponse(json.dumps(response), content_type="application/json")
