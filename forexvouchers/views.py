from django.http import HttpResponseRedirect
from geoip2.errors import AddressNotFoundError
import logging
from cms.models.business_models import Comment, Service
from django.contrib.gis.geoip2 import GeoIP2

logger = logging.getLogger(__name__)


def savecomments(request):
    comment = Comment(service=Service.objects.get(slug=request.POST['slug']),
                      review=request.POST['review'],
                      stars=request.POST['rate'],
                      name=request.POST['name'],
                      active=True)

    g = GeoIP2()
    try:
        ip2 = request.META.get('HTTP_X_FORWARDED_FOR')
        ip = request.META.get('REMOTE_ADDR')


        logger.info(f"current ip {ip}")
        logger.info(f"current ip2 {ip2}")

        comment.country = g.city(ip2)['country_name']
        comment.country_code = g.city(ip2)['country_code']
    except AddressNotFoundError:
        logger.error(f"This ip {ip} is not valid")

    comment.save()

    return HttpResponseRedirect('/services/' + request.POST['slug'])
