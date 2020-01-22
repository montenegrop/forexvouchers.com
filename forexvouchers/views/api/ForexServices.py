import json
from django.http import HttpResponse
from django.views import View

from cms.helpers.ServiceHelper import ServiceHelper, BROKERS, TRAINING, VPS, TRADING_SYSTEM, SIGNALS, TOOLS
from django.db.models import Q, Count, Case, When
from cms.models import Service
from django.db.models.functions import Cast
from django.db.models.fields import IntegerField


class ForexServicesView(View):
    response = {'data': []}

    def getCategoryCounts(self):
        category_counts = Service.objects.select_related('category') \
            .filter(~Q(category=BROKERS)) \
            .values('category__name', 'category__short_name', 'category') \
            .annotate(total=Count('category'))

        return list(
            map(lambda x: {'name': x['category__name'],
                           'short_name': x['category__short_name'],
                           'id': x['category'],
                           'total': x['total']},
                category_counts))

    def getTradingTypes(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .filter(trading_type__isnull=False) \
            .values('trading_type__name', 'trading_type') \
            .annotate(total=Count('trading_type'))

        return list(
            map(lambda x: {'name': x['trading_type__name'],
                           'id': x['trading_type'],
                           'total': x['total']},
                services))

    def getTradingSoftwares(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .filter(trading_software__isnull=False) \
            .values('trading_software__name', 'trading_software') \
            .annotate(total=Count('trading_software'))

        return list(
            map(lambda x: {'name': x['trading_software__name'],
                           'id': x['trading_software'],
                           'total': x['total']},
                services))

    def getTradingSoftwaresBrokers(self):
        services = Service.objects.filter(Q(category=BROKERS)) \
            .filter(trading_software__isnull=False) \
            .values('trading_software__name', 'trading_software') \
            .annotate(total=Count('trading_software'))

        return list(
            map(lambda x: {'name': x['trading_software__name'],
                           'id': x['trading_software'],
                           'total': x['total']},
                services))

    def getSystemTypes(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .filter(system_type__isnull=False) \
            .values('system_type__name', 'system_type') \
            .annotate(total=Count('system_type'))

        return list(
            map(lambda x: {'name': x['system_type__name'],
                           'id': x['system_type'],
                           'total': x['total']},
                services))

    def getTradingTools(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .filter(trading_tools__isnull=False) \
            .values('trading_tools__name', 'trading_tools') \
            .annotate(total=Count('trading_tools'))

        return list(
            map(lambda x: {'name': x['trading_tools__name'],
                           'id': x['trading_tools'],
                           'total': x['total']},
                services))

    def getPricingModels(self):
        services = Service.objects.filter(~Q(category=BROKERS)) \
            .filter(pricing_model__isnull=False) \
            .values('pricing_model__name', 'pricing_model') \
            .annotate(total=Count('pricing_model'))

        return list(
            map(lambda x: {'name': x['pricing_model__name'],
                           'id': x['pricing_model'],
                           'total': x['total']},
                services))

    # # # for Brokers:
    def getRegulations(self):
        services = Service.objects.filter(Q(category=BROKERS)) \
            .filter(regulation__isnull=False) \
            .values('regulation__code', 'regulation') \
            .annotate(total=Count('regulation'))

        return list(
            map(lambda x: {'name': x['regulation__code'],
                           'id': x['regulation'],
                           'total': x['total']},
                services))

    def getBrokerTypes(self):
        services = Service.objects.filter(Q(category=BROKERS)) \
            .filter(broker_type__isnull=False) \
            .values('broker_type__name', 'broker_type') \
            .annotate(total=Count('broker_type'))

        return list(
            map(lambda x: {'name': x['broker_type__name'],
                           'id': x['broker_type'],
                           'total': x['total']},
                services))

    def getTradingInstruments(self):
        services = Service.objects.filter(Q(category=BROKERS)) \
            .filter(trading_instrument__isnull=False) \
            .values('trading_instrument__name', 'trading_instrument') \
            .annotate(total=Count('trading_instrument'))

        return list(
            map(lambda x: {'name': x['trading_instrument__name'],
                           'id': x['trading_instrument'],
                           'total': x['total']},
                services))

    def getDepositMethods(self):
        services = Service.objects.filter(Q(category=BROKERS)) \
            .filter(deposit_method__isnull=False) \
            .values('deposit_method__name', 'deposit_method') \
            .annotate(total=Count('deposit_method'))

        return list(
            map(lambda x: {'name': x['deposit_method__name'],
                           'id': x['deposit_method'],
                           'total': x['total']},
                services))

    def getWithdrawMethods(self):
        services = Service.objects.filter(Q(category=BROKERS)) \
            .filter(withdraw_method__isnull=False) \
            .values('withdraw_method__name', 'withdraw_method') \
            .annotate(total=Count('withdraw_method'))

        return list(
            map(lambda x: {'name': x['withdraw_method__name'],
                           'id': x['withdraw_method'],
                           'total': x['total']},
                services))

    def getOperatingSystems(self):
        services = Service.objects.filter(Q(category=BROKERS)) \
            .filter(operating_system__isnull=False) \
            .values('operating_system__name', 'operating_system') \
            .annotate(total=Count('operating_system'))

        return list(
            map(lambda x: {'name': x['operating_system__name'],
                           'id': x['operating_system'],
                           'total': x['total']},
                services))

    def getServicesSorting(self, sort):
        if sort == 'premium':
            return Case(When(Q(premium=True), then=0), default=1), '-avg_rate',
        elif sort == 'toprated':
            return '-avg_rate',
        else:
            return '-avg_rate',

    def getBrokersSorting(self, sort):
        if sort == 'premium':
            return Case(When(Q(premium=True), then=0), default=1), '-avg_rate',
        elif sort == 'mostviewed':
            return '-affiliate__clicks', '-avg_rate',
        elif sort == 'toprated':
            return '-avg_rate',
        else:
            return '-created_at', '-avg_rate',

    def get(self, request):
        brokerness = request.GET.get('brokerness')
        limit = int(request.GET.get('limit', 10))
        sort = request.GET.get('sort', '')

        # # # Services filters:
        typed = request.GET.get('typed', '')
        categories = list(filter(lambda item: item, request.GET.get('categories', '').split(',')))
        trading_types = list(filter(lambda item: item, request.GET.get('trading_types', '').split(',')))
        trading_softwares = list(filter(lambda item: item, request.GET.get('trading_softwares', '').split(',')))
        system_types = list(filter(lambda item: item, request.GET.get('system_types', '').split(',')))
        trading_tools = list(filter(lambda item: item, request.GET.get('trading_tools', '').split(',')))
        pricings = list(filter(lambda item: item, request.GET.get('pricings', '').split(',')))

        # # # Brokers filters:
        regulations = list(filter(lambda item: item, request.GET.get('regulations', '').split(',')))
        broker_types = list(filter(lambda item: item, request.GET.get('broker_types', '').split(',')))
        # features:
        min_lot_size = request.GET.get('min_lot_size', '')
        min_deposit = request.GET.get('min_deposit', '')
        max_deposit = request.GET.get('max_deposit', '')
        spread = request.GET.get('spread', '')
        commission = request.GET.get('commission', '')
        min_leverage = request.GET.get('min_leverage', '')
        max_leverage = request.GET.get('max_leverage', '')

        trading_instruments = list(filter(lambda item: item, request.GET.get('trading_instruments', '').split(',')))
        deposit_methods = list(filter(lambda item: item, request.GET.get('deposit_methods', '').split(',')))
        withdraw_methods = list(filter(lambda item: item, request.GET.get('withdraw_methods', '').split(',')))
        operating_systems = list(filter(lambda item: item, request.GET.get('operating_systems', '').split(',')))

        # # # Services Conditions:
        categoryConditions = Q(category__in=categories) if len(categories) else ~Q(category=BROKERS)
        tradingTypeConditions = Q(trading_type__in=trading_types) if len(trading_types) else Q()
        tradingToolConditions = Q(trading_tools__in=trading_tools) if len(trading_tools) else Q()
        pricingModelConditions = Q(pricing_model__in=pricings) if len(pricings) else Q()
        systemTypeConditions = Q(system_type__in=system_types) if len(system_types) else Q()

        # # # Brokers Conditions:
        brokerCondition = Q(category=BROKERS)
        regulationConditions = Q(regulation__in=regulations) if len(regulations) else Q()
        brokerTypeConditions = Q(broker_type__in=broker_types) if len(broker_types) else Q()
        # features:
        minLotSizeConditions = Q(min_lot_size__gte=min_lot_size) if len(min_lot_size) else Q()
        minDepositConditions = Q(minimum_deposit__gte=min_deposit) if len(min_deposit) else Q()
        maxDepositConditions = Q(minimum_deposit__lte=max_deposit) if len(max_deposit) else Q()
        spreadConditions = Q(spread__gte=spread) if len(spread) else Q()
        commissionConditions = Q(commission__gte=commission) if len(commission) else Q()
        minLeverageConditions = Q(leverage__gte=min_leverage) if len(min_leverage) else Q()
        maxLeverageConditions = Q(leverage__lte=max_leverage) if len(max_leverage) else Q()

        tradingInstrumentConditions = Q(trading_instrument__in=trading_instruments) if len(trading_instruments) else Q()
        depositMethodConditions = Q(deposit_method__in=deposit_methods) if len(deposit_methods) else Q()
        withdrawMethodsConditions = Q(withdraw_method__in=withdraw_methods) if len(withdraw_methods) else Q()
        # trading_softwares
        operatingSystemConditions = Q(operating_system__in=operating_systems) if len(operating_systems) else Q()

        # applies to both:
        typedConditions = Q(name__icontains=typed) if len(typed) else Q()
        tradingSoftwareConditions = Q(trading_software__in=trading_softwares) if len(trading_softwares) else Q()

        if brokerness == 'false':
            services = Service.objects.filter(typedConditions,
                                              categoryConditions,
                                              tradingTypeConditions,
                                              tradingSoftwareConditions,
                                              systemTypeConditions,
                                              tradingToolConditions,
                                              pricingModelConditions).distinct().order_by(
                *self.getServicesSorting(sort))[:limit]

            response = {'data': [],
                        'categories': self.getCategoryCounts(),
                        'trading_types': self.getTradingTypes(),
                        'trading_softwares': self.getTradingSoftwares(),
                        'system_types': self.getSystemTypes(),
                        'trading_tools': self.getTradingTools(),
                        'pricing_models': self.getPricingModels(),
                        'limit': limit
                        }
            [response['data'].append(service.toDict()) for service in services]
        else:
            services = Service.objects.filter(typedConditions,
                                              brokerCondition,
                                              regulationConditions,
                                              brokerTypeConditions,
                                              tradingInstrumentConditions,
                                              depositMethodConditions,
                                              withdrawMethodsConditions,
                                              tradingSoftwareConditions,
                                              operatingSystemConditions,
                                              minLotSizeConditions,
                                              minDepositConditions,
                                              maxDepositConditions,
                                              spreadConditions,
                                              commissionConditions,
                                              minLeverageConditions,
                                              maxLeverageConditions
                                              ).distinct().order_by(
                *self.getBrokersSorting(sort))[:limit]

            response = {'data': [],
                        'regulations': self.getRegulations(),
                        'broker_types': self.getBrokerTypes(),
                        'trading_instruments': self.getTradingInstruments(),
                        'deposit_methods': self.getDepositMethods(),
                        'withdraw_methods': self.getWithdrawMethods(),
                        'trading_softwares': self.getTradingSoftwaresBrokers(),
                        'operating_systems': self.getOperatingSystems(),
                        'limit': limit
                        }
            [response['data'].append(ServiceHelper(service).to_dict()) for service in services]
        return HttpResponse(json.dumps(response), content_type="application/json")
