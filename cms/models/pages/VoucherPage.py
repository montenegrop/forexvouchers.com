from django.shortcuts import render
from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from wagtail.contrib.routable_page.models import RoutablePageMixin, route
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend
from cms.models.business_models import Voucher


class VoucherPage(RoutablePageMixin, PageLDMixin, Page):
    body = RichTextField(blank=True)


    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]


    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })

    @route(r'^(.+)/$')
    def get_middleware_context(self, request, *args, **kwargs):
        '''
        discounts|promocodes|offers)
        '''

        context = super(VoucherPage, self).get_context(request)
        slug = args[0]
        voucher = Voucher.objects.get(slug=slug).get_subobject()

        context['voucher'] = voucher.toDict()
        context['voucher_model'] = voucher

        return render(request, "../templates/cms/vouchers_middleware.html", context)
