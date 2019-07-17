from django.http import HttpResponseRedirect
from geoip2.errors import AddressNotFoundError

from cms.models.business_models import Comment, Service

from django.contrib.gis.geoip2 import GeoIP2


def savecomments(request):
    comment = Comment(service=Service.objects.get(slug=request.POST['slug']),
                      review=request.POST['review'],
                      stars=request.POST['rate'],
                      name=request.POST['name'],
                      active=True)

    g = GeoIP2()
    try:
        ip = request.META.get('REMOTE_ADDR')
        # ip = '45.116.232.20'
        comment.country = g.city(ip)['country_name']
        comment.country_code = g.city(ip)['country_code']
        print(comment.country_code)
    except AddressNotFoundError:
        pass

    comment.save()

    return HttpResponseRedirect('/services/' + request.POST['slug'])
