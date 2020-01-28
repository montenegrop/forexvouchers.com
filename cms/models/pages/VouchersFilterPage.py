from django.shortcuts import render
from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from wagtail.contrib.routable_page.models import RoutablePageMixin, route
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend
from cms.models.business_models import Voucher


class VouchersFilterPage(RoutablePageMixin, PageLDMixin, Page):
    body = RichTextField(blank=True)
    template = '../templates/cms/vouchers_filter_page.html'

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]


    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })


    def get_context(self, request, *args, **kwargs):
        context = super(VouchersFilterPage, self).get_context(request)
        return context
