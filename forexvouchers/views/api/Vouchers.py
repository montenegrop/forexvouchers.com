import json

from cms.models import Discount, PromoCode, Offer, Voucher

from django.views import View
from django.http import HttpResponse
from django.db.models import Q, Count, Case, When
import datetime


class VouchersView(View):
    response = {'data': []}

    def getCategoryCounts(self):

        category_counts = Voucher.objects.select_related('service', 'service__category') \
            .filter(Q(expires__gte=datetime.date.today()) | Q(never_expires=True)) \
            .values('service__category__name', 'service__category') \
            .annotate(total=Count('service__category'))
        return list(
            map(lambda x: {'name': x['service__category__name'],
                           'id': x['service__category'],
                           'total': x['total']},
                category_counts))

    def getServiceCounts(self):

        service_counts = Voucher.objects.select_related('service') \
            .filter(Q(expires__gte=datetime.date.today()) | Q(never_expires=True)) \
            .values('service__name', 'service_id') \
            .annotate(total=Count('service_id'))

        return list(
            map(lambda x: {'name': x['service__name'],
                           'id': x['service_id'],
                           'total': x['total']},
                service_counts))

    def getTypeCounts(self):
        discount_counts = Discount.objects.filter(Discount.not_expired_condition()).count()
        promocodes_counts = PromoCode.objects.filter(PromoCode.not_expired_condition()).count()
        offers_counts = Offer.objects.filter(Offer.not_expired_condition()).count()

        return {'discount': discount_counts, 'promocode': promocodes_counts, 'offer': offers_counts}

    def getSorting(self, sort):
        if sort == 'premium':
            return Case(When(Q(service__premium=True), then=0), default=1), '-created_at'
        elif sort == 'mostviewed':
            return 'service__affiliate__clicks', '-created_at'
        elif sort == 'toprated':
            return '-service__avg_rate', '-created_at'
        elif sort == 'voucher_mostviewed':
            return 'affiliate__clicks', '-created_at'
        else:
            return '-created_at',

    def get(self, request):
        voucherTypes = request.GET.get('voucher_types', '')
        services = list(filter(lambda item: item, request.GET.get('services', '').split(',')))
        categories = list(filter(lambda item: item, request.GET.get('categories', '').split(',')))
        limit = int(request.GET.get('limit', 10))
        sort = request.GET.get('sort', 'newest')
        voucherId = request.GET.get('voucher_id', '')
        if len(voucherId):
            voucher = Voucher.objects.get(id=int(voucherId))

        if voucherTypes == '':
            voucherTypes = ['discount', 'promocode', 'offer']
        else:
            voucherTypes = voucherTypes.split(',')

        response = {'data': [],
                    'categories': self.getCategoryCounts(),
                    'services': self.getServiceCounts(),
                    'types': self.getTypeCounts(),
                    }

        typeConditions = None
        for voucherType in voucherTypes:
            typeConditions = Q(**{voucherType + '__isnull': False}) if typeConditions is None else typeConditions | Q(
                **{voucherType + '__isnull': False})
        serviceConditions = Q()
        categoryConditions = Q(service__category__in=categories) if len(categories) else Q()
        voucherConditions = ~Q(id=voucherId) & Q(service__category__in=voucher.service.getCategoriesIDs()) if len(
            voucherId) else Q()

        vouchers = Voucher.objects.filter(typeConditions,
                                          serviceConditions,
                                          categoryConditions,
                                          voucherConditions,
                                          Q(expires__gte=datetime.date.today()) | Q(
                                              never_expires=True)).distinct().order_by(
            *self.getSorting(sort))[:limit]

        vouchers = list(map(lambda vouch: vouch.get_subobject(), vouchers))

        [response['data'].append(vouch.toDict()) for vouch in vouchers]

        return HttpResponse(json.dumps(response), content_type="application/json")
