from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from wagtail.contrib.routable_page.models import RoutablePageMixin, route
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend

from cms.helpers.ServiceHelper import ServiceHelper
from cms.helpers.services import get_service_context
from cms.models.business_models import Service, Compare
from django.shortcuts import render



class ComparePage(RoutablePageMixin, PageLDMixin, Page):
    body = RichTextField(blank=True)

    def get_context(self, request):
        context = super(ComparePage, self).get_context(request)
        return context

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]

    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })


    @route(r'^(.+)/$')
    def get_compare_context(self, request, *args, **kwargs):
        context = super(ComparePage, self).get_context(request)
        slugs = args[0].split("-vs-")
        service1 = Service.objects.get(slug=slugs[0])
        service2 = Service.objects.get(slug=slugs[1])

        context['service1'] = get_service_context(service1)
        context['service2'] = get_service_context(service2)

        cats1 = service1.category.all()
        # Merging both categories
        for category in service2.category.all():
            service1.category.add(category)
        for category in cats1:
            service2.category.add(category)

        context['service_helper1'] = ServiceHelper(service1)
        context['service_helper2'] = ServiceHelper(service2)

        context['affiliate1'] = service1.affiliate
        context['affiliate2'] = service2.affiliate

        sortedServices = sorted([service1, service2], key=lambda service: service.id)

        compare, _ = Compare.objects.get_or_create(service1=sortedServices[0], service2=sortedServices[1])
        compare.count += 1
        compare.save()

        return render(request, "../templates/cms/compare_page.html", context)


    def get_sitemap_urls(self, request=None):
        services = Service.objects.all()
        for service1 in services:
            for service2 in services:
                if service1.id != service2.id and service1.belongsToCategories(service2.getCategoriesIDs()):
                  yield {
                     'location': f"{self.get_full_url()}{service1.slug}-vs-{service2.slug}",
                  }
