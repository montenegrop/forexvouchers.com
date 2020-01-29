from wagtail.core.models import Page
from django.db.models import TextField
from wagtail.admin.edit_handlers import FieldPanel
from wagtail.contrib.routable_page.models import RoutablePageMixin, route
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend

class ForexPage(RoutablePageMixin, PageLDMixin, Page):
    script = TextField(blank=True)

    def get_context(self, request):
        context = super(ForexPage, self).get_context(request)
        return context

    content_panels = Page.content_panels + [
        FieldPanel('script', classname="full")
    ]

    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })