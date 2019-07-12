from django.http import HttpResponseRedirect
from geoip2.errors import AddressNotFoundError

from cms.models.business_models import Comment, Service

from django.contrib.gis.geoip2 import GeoIP2


def savecomments(request):
    comment = Comment(service=Service.objects.get(slug=request.POST['slug']),
                      review=request.POST['review'],
                      stars=3,
                      active=True)

    g = GeoIP2()
    try:
        comment.country = g.city(request.META.get('REMOTE_ADDR'))['country_name']
    except AddressNotFoundError:
        pass

    comment.save()

    return HttpResponseRedirect('/services/' + request.POST['slug'])
