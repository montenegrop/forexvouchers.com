from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from ..business_models import Service


class ServicePage(Page):
    body = RichTextField(blank=True)

    def get_context(self, request):
        context = super(ServicePage, self).get_context(request)
        context['table_rows'] = []
        for service in Service.objects.all():
            attrs = service.getAttributes()
            attrs['name'] = service.name
            context['table_rows'].append(attrs)
        return context

