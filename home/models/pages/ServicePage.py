from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from ..business_models import Attribute


class ServicePage(Page):
    body = RichTextField(blank=True)

    def get_context(self, request):
        context = super(ServicePage, self).get_context(request)
        context['table_rows'] = []
        for attribute in Attribute.objects.all():
            attrs = attribute.section
            context['table_rows'].append(attrs)
        return context

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]
