from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend

from wagtail.contrib.routable_page.models import RoutablePageMixin

class ServicesListPage(RoutablePageMixin, PageLDMixin, Page):
    body = RichTextField(blank=True)
    template = '../templates/cms/services_filter_page.html'

    def get_context(self, request):
        context = super(ServicesListPage, self).get_context(request)
        return context

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]

    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })
