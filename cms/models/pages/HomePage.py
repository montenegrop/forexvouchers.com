from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from cms.models.business_models import Service
from cms.helpers.services import get_service_context, get_comments_by_service

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

        return render(request, "../templates/cms/service_page.html", context)