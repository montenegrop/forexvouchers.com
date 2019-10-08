import json

from cms.models import Discount, PromoCode, Offer, Voucher

from django.views import View
from django.http import HttpResponse
from django.db.models import Q


class VouchersView(View):
    response = {'data': []}

    def get(self, request):
        voucherTypes = request.GET.get('voucher_types', 'discount,promocode,offer').split(',')
        limit = int(request.GET.get('limit', 10))
        response = {'data': []}

        conditions = None
        for type in voucherTypes:
            conditions = Q(**{type + '__isnull': False}) if conditions is None else conditions | Q(**{type + '__isnull': False})

        vouchers = Voucher.objects.filter(conditions)
        vouchers = list(map(lambda voucher: voucher.get_subobject(), vouchers))

        [response['data'].append(vouch.toDict()) for vouch in vouchers]

        return HttpResponse(json.dumps(response), content_type="application/json")
