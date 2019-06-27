from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from ..business_models import Service

class HomePage(Page):
    body = RichTextField(blank=True)
    def get_context(self, request):
        context = super(HomePage, self).get_context(request)
        context['table_rows'] = Service.objects.all()
        return context

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]
