from django.db.models import Q
from django.shortcuts import render
from django.utils import timezone
from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel
from wagtail.contrib.routable_page.models import RoutablePageMixin, route
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend
from cms.models.business_models import Voucher, PromoCode, Discount, Offer
import json


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

    def get_sitemap_urls(self, request=None):
        VoucherClasses = {
            'promocodes': PromoCode,
            'discounts': Discount,
            'offers': Offer,
        }

        try:
           vouchers = VoucherClasses[self.slug].objects.filter(Q(never_expires=True) | Q(expires__gt=timezone.now()))
        except:
            return []
        return map(lambda voucher: {
            'location': f"{self.get_full_url()}{voucher.slug}",
            'lastmod': voucher.created_at
        }, vouchers)

    @route(r'^(.+)/$')
    def get_middleware_context(self, request, *args, **kwargs):
        '''
        discounts|promocodes|offers)
        '''

        context = super(VoucherPage, self).get_context(request)
        slug = args[0]
        voucher = Voucher.objects.get(slug=slug).get_subobject()

        context['voucher_type'] = voucher.get_type()
        context['voucher'] = json.dumps(voucher.toDict())

        context['clicks_large'] = voucher.service.affiliate.getClicks()
        context['voucher_model'] = voucher

        return render(request, "../templates/cms/vouchers_middleware.html", context)

