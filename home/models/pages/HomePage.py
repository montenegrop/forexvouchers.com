from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from home.models.business_models import Service
from home.helpers.services import get_service_context

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

    @route(r'^services/(.+)/$', name='service_url')
    def get_service_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request)
        slug = args[0]
        context['service'] = get_service_context(slug)
        context['model'] = Service.objects.get(slug=slug)

        return render(request, "../templates/home/service_page.html", context)
