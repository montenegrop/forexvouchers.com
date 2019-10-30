import json

from cms.models import Discount, PromoCode, Offer, Voucher, Category, Service

from django.views import View
from django.http import HttpResponse
from django.db.models import Q, Count


class VouchersView(View):
    response = {'data': []}

    def getCategoryCounts(self):

        category_counts = Voucher.objects.select_related('service', 'service__category') \
            .values('service__category__name', 'service__category_id') \
            .annotate(total=Count('service__category_id'))

        return list(
            map(lambda x: {'name': x['service__category__name'],
                           'id': x['service__category_id'],
                           'total': x['total']},
                category_counts))

    def getServiceCounts(self):

        service_counts = Voucher.objects.select_related('service') \
            .values('service__name', 'service_id') \
            .annotate(total=Count('service_id'))

        return list(
            map(lambda x: {'name': x['service__name'],
                           'id': x['service_id'],
                           'total': x['total']},
                service_counts))

    def getTypeCounts(self):
        discount_counts = Discount.objects.all().count()
        promocodes_counts = PromoCode.objects.all().count()
        offers_counts = Offer.objects.all().count()

        return {'discount': discount_counts, 'promocode': promocodes_counts, 'offer': offers_counts}

    def get(self, request):
        voucherTypes = request.GET.get('voucher_types', '')
        services = list(filter(lambda item: item, request.GET.get('services', '').split(',')))
        categories = list(filter(lambda item: item, request.GET.get('categories', '').split(',')))
        limit = int(request.GET.get('limit', 10))

        if voucherTypes == '':
            voucherTypes = ['discount', 'promocode', 'offer']
        else:
            voucherTypes = voucherTypes.split(',')

        response = {'data': [],
                    'categories': self.getCategoryCounts(),
                    'services': self.getServiceCounts(),
                    'types': self.getTypeCounts()}

        typeConditions = None
        for type in voucherTypes:
            typeConditions = Q(**{type + '__isnull': False}) if typeConditions is None else typeConditions | Q(
                **{type + '__isnull': False})
        serviceConditions = Q(service_id__in=services) if len(services) else Q()
        categoryConditions = Q(service__category_id__in=categories) if len(categories) else Q()


        vouchers = Voucher.objects.filter(typeConditions, serviceConditions, categoryConditions)
        vouchers = list(map(lambda voucher: voucher.get_subobject(), vouchers))

        [response['data'].append(vouch.toDict()) for vouch in vouchers]

        return HttpResponse(json.dumps(response), content_type="application/json")
