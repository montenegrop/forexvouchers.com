from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from cms.models.business_models import Service
from cms.helpers.services import get_service_context, get_comments_by_service, get_services_by_category

from wagtail.contrib.routable_page.models import RoutablePageMixin, route

from django.shortcuts import render


class HomePage(RoutablePageMixin, Page):
    body = RichTextField(blank=True)

    def get_context(self, request):
        context = super(HomePage, self).get_context(request)
        context['table_rows'] = []
        for service in Service.objects.all():
            attrs = service.getAttributes()
            attrs['name'] = service.name
            attrs['slug'] = service.slug
            context['table_rows'].append(attrs)
        return context

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]

    @route(r'^services/(.+)/$')
    def get_service_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request)
        slug = args[0]
        service = Service.objects.get(slug=slug)
        context['service'] = get_service_context(service)
        context['comments'] = get_comments_by_service(service)
        context['services'] = get_services_by_category(service)

        return render(request, "../templates/cms/service_page.html", context)

    @route(r'^f./compare/(.+)/$')
    def get_compare_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request)
        slugs = args[0].split("-vs-")
        service1 = Service.objects.get(slug=slugs[0])
        service2 = Service.objects.get(slug=slugs[1])
        context['service1'] = get_service_context(service1)
        context['service2'] = get_service_context(service2)

        return render(request, "../templates/cms/compare_page.html")
