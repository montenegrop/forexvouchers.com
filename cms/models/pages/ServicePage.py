from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend

from cms.helpers.ServiceHelper import ServiceHelper, BROKERS
from cms.helpers.services import get_comments_by_service, get_comparable_services, get_other_services_names, \
    get_vouchers_by_service, get_products_by_service
from cms.models.business_models import Attribute, Service
from django.shortcuts import render


from wagtail.contrib.routable_page.models import RoutablePageMixin, route

class ServicePage(RoutablePageMixin, PageLDMixin, Page):
    body = RichTextField(blank=True)

    @route(r'^(.+)/$')
    def get_service_context(self, request, *args, **kwargs):
        context = super(ServicePage, self).get_context(request)
        slug = args[0]
        service = Service.objects.get(slug=slug)
        helper = ServiceHelper(service)

        context['service_helper'] = helper

        context['service'] = service
        context['comments'] = get_comments_by_service(service)
        context['services'] = get_comparable_services(service, [BROKERS])
        context['compare'] = get_other_services_names(service, [BROKERS])
        context['affiliate'] = service.affiliate
        context['vouchers'] = get_vouchers_by_service(service)
        context['products'] = get_products_by_service(service)

        return render(request, "../templates/cms/service_page.html", context)


    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })
