from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from wagtailtrans.models import TranslatablePage
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend

class StaticPage(TranslatablePage, PageLDMixin, Page):
    body = RichTextField(blank=True)

    def get_context(self, request):
        context = super(StaticPage, self).get_context(request)
        return context

    content_panels = TranslatablePage.content_panels + [
        FieldPanel('body', classname="full")
    ]

    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })