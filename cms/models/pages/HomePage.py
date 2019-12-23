from wagtail.core.models import Page
from django.db import models
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel, MultiFieldPanel
from cms.models.business_models import Service, Compare, Comment, Voucher
from wagtail.images.edit_handlers import ImageChooserPanel
from cms.models.business_models import Service, Compare, Comment, Category
from cms.helpers.services import get_service_context, get_comments_by_service, get_comparable_services, \
    get_other_services_names, get_vouchers_by_service, get_products_by_service
from cms.helpers.ServiceHelper import ServiceHelper, BROKERS

from django.db.models import Q

from wagtail.contrib.routable_page.models import RoutablePageMixin, route

from django.shortcuts import render


class HomePage(RoutablePageMixin, Page):
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

        print([ser.category.all()[0].name for ser in services])

        context['recent_comments'] = []
        context['categories'] = Category.objects.all().order_by('name')
        context['comments'] = [comment.toDict() for comment in Comment.objects.all().order_by('-created_at')[:5]]
        context['compares'] = [compare for compare in Compare.objects.all().order_by('-count')][:8]
        context['premium_services'] = [ServiceHelper(service).to_dict() for service in services]
        context['vouchers'] = [ServiceHelper(service).to_dict() for service in services]

        return context

    @route(r'^services/(.+)/$')
    def get_service_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request)
        slug = args[0]
        service = Service.objects.get(slug=slug)
        helper = ServiceHelper(service)

        context['service_helper'] = helper

        context['service'] = service
        context['comments'] = get_comments_by_service(service)
        context['services'] = get_comparable_services(service, [BROKERS])
        context['compare'] = get_other_services_names(service, [BROKERS])
        context['affiliate'] = service.affiliate
        context['vouchers'] = get_vouchers_by_service(service)
        context['products'] = get_products_by_service(service)

        return render(request, "../templates/cms/service_page.html", context)

    @route(r'^f./compare/(.+)/$')
    def get_compare_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request)
        slugs = args[0].split("-vs-")
        service1 = Service.objects.get(slug=slugs[0])
        service2 = Service.objects.get(slug=slugs[1])

        context['service1'] = get_service_context(service1)
        context['service2'] = get_service_context(service2)

        context['service_helper1'] = ServiceHelper(service1)
        context['service_helper2'] = ServiceHelper(service2)

        context['affiliate1'] = service1.affiliate
        context['affiliate2'] = service2.affiliate

        sortedServices = sorted([service1, service2], key=lambda service: service.id)

        compare, _ = Compare.objects.get_or_create(service1=sortedServices[0], service2=sortedServices[1])
        compare.count += 1
        compare.save()

        return render(request, "../templates/cms/compare_page.html", context)

    @route(r'^forex-services/$')
    def get_vouchers_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request)
        return render(request, "../templates/cms/vouchers_page.html", context)

    @route(r'^vouchers/$')
    def get_vouchers_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request)
        return render(request, "../templates/cms/vouchers_page.html", context)

    @route(r'^(discounts|promocodes|offers)/(.+)/$')
    def get_middleware_context(self, request, *args, **kwargs):
        context = super(HomePage, self).get_context(request)
        slug = args[1]
        voucher = Voucher.objects.get(slug=slug).get_subobject()

        context['voucher'] = voucher.toDict()

        return render(request, "../templates/cms/vouchers_middleware.html", context)
