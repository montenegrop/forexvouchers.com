from wagtail.core.models import Page
from wagtailtrans.models import TranslatablePage
from django.db import models
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel, MultiFieldPanel
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend

from wagtail.images.edit_handlers import ImageChooserPanel
from cms.models.business_models import Service, Compare, Comment, Category
from cms.helpers.ServiceHelper import ServiceHelper, BROKERS

from wagtail.contrib.routable_page.models import RoutablePageMixin

class HomePage(RoutablePageMixin, PageLDMixin, TranslatablePage, Page):
    banner_title = models.CharField(max_length=100, default='')
    banner_body = RichTextField(blank=True, default='')
    banner_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Background'
    )

    content_panels = Page.content_panels + [
        MultiFieldPanel(
            [
                FieldPanel("banner_title", classname="col12"),
                FieldPanel("banner_body", classname="col12"),
                ImageChooserPanel("banner_image", classname="col12"),

            ],
            heading="Banner",
        )
    ]


    def get_context(self, request):
        context = super(HomePage, self).get_context(request)
        services = Service.objects.filter(category__in=[BROKERS], premium=True).order_by('name')[0:10]

        context['recent_comments'] = []
        context['categories'] = Category.objects.all().order_by('name')
        context['comments'] = [comment.toDict() for comment in Comment.objects.all().order_by('-created_at')[:5]]
        context['compares'] = [compare for compare in Compare.objects.all().order_by('-count')][:8]
        context['premium_services_models'] = services
        context['premium_services'] = [ServiceHelper(service).to_dict() for service in services]

        return context


    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })
