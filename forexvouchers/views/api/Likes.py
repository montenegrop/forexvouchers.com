import json

from django.http import HttpResponse
from django.views import View


from cms.models import Voucher


class LikesView(View):

    def post(self, request):
        response = {'data': []}

        id = request.POST['id']
        like = request.POST['like']

        voucher = Voucher.objects.get(pk=id)
        voucher_specific = voucher.get_subobject()
        if like:
            voucher_specific.likes += 1
        else:
            voucher_specific.dislikes += 1
        voucher_specific.save()

        return HttpResponse(json.dumps(response), content_type="application/json")

