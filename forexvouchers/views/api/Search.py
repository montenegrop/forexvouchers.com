import datetime
import json
from itertools import chain, islice

from django.db.models import Q
from django.http import HttpResponse
from django.views import View
from wagtail.search.backends import get_search_backend

from cms.models import Service, Voucher, Product


class SearchView(View):

    def vouchers_query(self):
        return Voucher.objects.filter(Q(expires__gte=datetime.date.today()) | Q(never_expires=True)).distinct()

    def get(self, request):
        query = request.GET.get('query')
        limit = int(request.GET.get('limit', 10))
        response = { 'data': [] }

        s = get_search_backend()

        results = chain(
            s.search(query, Service),
            s.search(query, self.vouchers_query()),
        )

        for result in islice(results, limit):
            try:
                if isinstance(result, Voucher):
                    data = result.get_subobject().toDict()
                else:
                    data = result.toDict()
                response['data'].append({ 'type': result.__class__.__name__.lower(), 'data': data })
            except:
                pass

        return HttpResponse(json.dumps(response), content_type="application/json")