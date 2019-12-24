import json
from django.http import HttpResponse
from django.views import View

from cms.helpers.ServiceHelper import ServiceHelper, BROKERS, TRAINING, VPS, TRADING_SYSTEM, SIGNALS, TOOLS
from django.db.models import Q, Count, Case, When
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

    def getTradingTypes(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .values('trading_type__name', 'trading_type') \
            .annotate(total=Count('trading_type'))

        return list(
            map(lambda x: {'name': x['trading_type__name'],
                           'id': x['trading_type'],
                           'total': x['total']},
                services))

    def getTradingSoftwares(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .values('trading_software__name', 'trading_software') \
            .annotate(total=Count('trading_software'))

        return list(
            map(lambda x: {'name': x['trading_software__name'],
                           'id': x['trading_software'],
                           'total': x['total']},
                services))

    def getSystemTypes(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .values('system_type__name', 'system_type') \
            .annotate(total=Count('system_type'))

        return list(
            map(lambda x: {'name': x['system_type__name'],
                           'id': x['system_type'],
                           'total': x['total']},
                services))

    def getTradingTools(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .values('trading_tools__name', 'trading_tools') \
            .annotate(total=Count('trading_tools'))

        return list(
            map(lambda x: {'name': x['trading_tools__name'],
                           'id': x['trading_tools'],
                           'total': x['total']},
                services))

    def getPricingModels(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .values('pricing_model__name', 'pricing_model') \
            .annotate(total=Count('pricing_model'))

        return list(
            map(lambda x: {'name': x['pricing_model__name'],
                           'id': x['pricing_model'],
                           'total': x['total']},
                services))

    # def getSorting(self, sort):
    #     if sort == 'premium':
    #         return Case(When(Q(service__premium=True), then=0), default=1), 'created_at'
    #     elif sort == 'mostviewed':
    #         return 'service__affiliate__clicks', 'created_at'
    #     elif sort == 'toprated':
    #         return '-service__avg_rate',
    #     else:
    #         return 'created_at',



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
                    'categories': self.getCategoryCounts(),
                    'trading_types': self.getTradingTypes(),
                    'trading_softwares': self.getTradingSoftwares(),
                    'system_types': self.getSystemTypes(),
                    'trading_tools': self.getTradingTools(),
                    'pricing_models': self.getPricingModels(),
                    'limit': limit
                    }

        [response['data'].append(ser.toDict()) for ser in services]

        return HttpResponse(json.dumps(response), content_type="application/json")
