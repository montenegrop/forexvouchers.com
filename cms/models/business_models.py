from django.db import models
# from cms.models.fields import *
from wagtail.contrib.modeladmin.helpers import AdminURLHelper

from django_extensions.db.fields import AutoSlugField
from django import forms

import json
from django.core.serializers.json import DjangoJSONEncoder
import datetime

from modelcluster.models import ClusterableModel
from wagtail.core.models import Orderable
from wagtail.core.fields import RichTextField
from modelcluster.fields import ParentalKey
from modelcluster.fields import ParentalManyToManyField

from wagtailautocomplete.edit_handlers import AutocompletePanel

from wagtail.admin.edit_handlers import (
    MultiFieldPanel,
    InlinePanel,
    FieldPanel,
)

### images ####

from wagtail.images.models import Image
from wagtail.images.edit_handlers import ImageChooserPanel


# from wagtail.core.blocks import ChoiceBlock


class Category(models.Model):
    name = models.CharField(max_length=30)
    attributes = models.ManyToManyField('Attribute', blank=True)
    slug = AutoSlugField(populate_from='name', editable=True)

    panels = [
        MultiFieldPanel([
            FieldPanel('name'),
            FieldPanel('slug')
        ], heading="Category")
    ]

    def __str__(self):
        return self.name


class Service(ClusterableModel):
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    name = models.CharField(max_length=100)
    premium = models.BooleanField(null=False, default=False)
    attributes = models.ManyToManyField('Attribute', blank=True)
    slug = AutoSlugField(populate_from='name', editable=True)
    affiliate = models.ForeignKey("Affiliate", on_delete=models.SET_NULL, null=True)

    # Company profile
    status = models.ForeignKey("Status", on_delete=models.SET_NULL, null=True, blank=True)
    founded = models.IntegerField(null=True, blank=True)
    broker_type = ParentalManyToManyField("BrokerType", related_name='broker_type', blank=True)
    regulation = ParentalManyToManyField("Regulation", related_name='regulation', blank=True)
    license = ParentalManyToManyField("License", related_name='license', blank=True)

    location = ParentalManyToManyField("Location", related_name='location', blank=True)

    international_offices = ParentalManyToManyField("Location", related_name='international_offices',
                                                    blank=True)

    accept_us_clients = models.BooleanField(null=False, default=True)
    accept_eu_clients = models.BooleanField(null=False, default=True)

    # Trading setup
    timezone = models.ForeignKey("Timezone", on_delete=models.SET_NULL, null=True, blank=True)
    trading_software = ParentalManyToManyField("TradingSoftware", blank=True)
    platforms_supported = ParentalManyToManyField("PlatformSupported", blank=True)
    ea_robots = models.BooleanField(null=False, default=True)
    scalping = models.BooleanField(null=False, default=True)
    hedging = models.BooleanField(null=False, default=True)

    # Customer support
    email = models.EmailField(blank=True, default=None, null=True)
    phone = models.CharField(max_length=500, blank=True, default=None, null=True)
    chat = ParentalManyToManyField("Chat", default=None, blank=True)
    support_languages = ParentalManyToManyField("SupportedLanguage", default=None, blank=True)
    office_address = models.CharField(max_length=500, blank=True, default=None, null=True)

    # Details
    training_courses = ParentalManyToManyField("TrainingCourse", blank=True)
    training_type = ParentalManyToManyField("TrainingType", blank=True)
    methodology = ParentalManyToManyField("Methodology", blank=True)
    training_tools = ParentalManyToManyField("TrainingTool", blank=True)
    instructor = models.CharField(max_length=500, blank=True, default=None, null=True)
    pricing_model = ParentalManyToManyField("PricingModel", blank=True)
    system_type = ParentalManyToManyField("SystemType", blank=True)
    trading_type = ParentalManyToManyField("TradingType", blank=True)
    required_software = ParentalManyToManyField("TradingSoftware", blank=True, related_name='required_software')
    signal_alerts = ParentalManyToManyField("SignalAlert", blank=True)
    frequency = models.CharField(max_length=500, blank=True, default=None, null=True)

    # Trading account
    account_types = ParentalManyToManyField("AccountType", blank=True)
    trading_instruments = ParentalManyToManyField("TradingInstrument", blank=True)
    revenue_model = ParentalManyToManyField("RevenueModel", blank=True)
    account_options = ParentalManyToManyField("AccountOption", blank=True)
    account_currency = ParentalManyToManyField("AccountCurrency", blank=True)
    payment_method = ParentalManyToManyField("PaymentMethod", blank=True)
    minimum_deposit = models.CharField(max_length=20, blank=True)
    commission = models.CharField(max_length=20, blank=True)
    leverage = models.CharField(max_length=20, blank=True)
    spread = models.CharField(max_length=20, blank=True)
    swap_free = models.BooleanField(null=False, default=True)
    islamic_accounts = models.BooleanField(null=False, default=True)
    bonus_policy = models.BooleanField(null=False, default=True)

    # About
    about = RichTextField(max_length=2500, blank=True, default=None, null=True)

    # Images
    logo = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    avg_rate = models.IntegerField(null=True, blank=True)
    count_rate = models.IntegerField(null=True, blank=True)

    preview = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    @property
    def get_avg_rate(self):
        return self.avg_rate if self.avg_rate else 0

    @property
    def get_count_rate(self):
        return self.count_rate if self.count_rate else 0

    @property
    def url(self):
        return '/services/' + self.slug

    def getAttributes(self):
        attributeServices = AttributeService.objects.select_related('attribute').filter(service=self)
        attributes = {attributeService.attribute.getKey(): {
            'label': attributeService.attribute.name,
            'value': ','.join([value.__str__() for value in attributeService.attSerVal.all()])
        } for attributeService in attributeServices}
        return attributes

    def __str__(self):
        return self.name

    panels = [
        MultiFieldPanel(
            [
                FieldPanel("category", classname="col12"),
                FieldPanel("premium", classname="col12"),
                AutocompletePanel("affiliate", target_model="cms.Affiliate")
            ],
            heading="Select Category First",
        ),
        MultiFieldPanel(
            [
                FieldPanel('name', classname="col6"),
                FieldPanel('status', classname="col6"),
                FieldPanel('founded', classname="col12"),
                AutocompletePanel('broker_type', target_model="cms.BrokerType", is_single=False),
                AutocompletePanel('license', target_model="cms.License", is_single=False),
                FieldPanel('accept_us_clients', classname="col12"),
                FieldPanel('accept_eu_clients', classname="col12"),
                AutocompletePanel("location", target_model="cms.Location", is_single=False),
                AutocompletePanel('international_offices', target_model="cms.Location", is_single=False),
                AutocompletePanel("regulation", target_model="cms.Regulation", is_single=False),
            ],
            heading="Company Profile",
        ),
        MultiFieldPanel(
            [
                FieldPanel('instructor', classname="col12"),
                FieldPanel('frequency', classname="col12"),
                AutocompletePanel("training_courses", target_model="cms.TrainingCourse", is_single=False),
                AutocompletePanel("training_type", target_model="cms.TrainingType", is_single=False),
                AutocompletePanel("methodology", target_model="cms.Methodology", is_single=False),
                AutocompletePanel("training_tools", target_model="cms.TrainingTool", is_single=False),
                AutocompletePanel("pricing_model", target_model="cms.PricingModel", is_single=False),
                AutocompletePanel("system_type", target_model="cms.SystemType", is_single=False),
                AutocompletePanel("trading_type", target_model="cms.TradingType", is_single=False),
                AutocompletePanel("required_software", target_model="cms.TradingSoftware", is_single=False),
                AutocompletePanel("signal_alerts", target_model="cms.SignalAlert", is_single=False),

            ],
            heading="Details",
        ),
        MultiFieldPanel(
            [
                FieldPanel("ea_robots", classname="col4"),
                FieldPanel("scalping", classname="col4"),
                FieldPanel("hedging", classname="col4"),
                FieldPanel("timezone", classname="col12"),

                AutocompletePanel("trading_software", target_model="cms.TradingSoftware", is_single=False),
                AutocompletePanel("platforms_supported", target_model="cms.PlatformSupported", is_single=False),
            ],
            heading="Trading setup",
        ),
        MultiFieldPanel(
            [
                FieldPanel("email", classname="col6"),
                FieldPanel("phone", classname="col6"),
                FieldPanel("office_address", classname="col12"),
                AutocompletePanel("chat", target_model="cms.Chat", is_single=False),
                AutocompletePanel("support_languages", target_model="cms.SupportedLanguage", is_single=False),
            ],
            heading="Customer Support",
        ),
        MultiFieldPanel(
            [
                FieldPanel("minimum_deposit", classname="col12"),
                FieldPanel("commission", classname="col12"),
                FieldPanel("leverage", classname="col12"),
                FieldPanel("spread", classname="col12"),
                FieldPanel("office_address", classname="col12"),
                FieldPanel("swap_free", classname="col12"),
                FieldPanel("islamic_accounts", classname="col12"),
                FieldPanel("bonus_policy", classname="col12"),
                AutocompletePanel("account_types", target_model="cms.AccountType", is_single=False),
                AutocompletePanel("trading_instruments", target_model="cms.TradingInstrument", is_single=False),
                AutocompletePanel("revenue_model", target_model="cms.RevenueModel", is_single=False),
                AutocompletePanel("account_options", target_model="cms.AccountOption", is_single=False),
                AutocompletePanel("account_currency", target_model="cms.AccountCurrency", is_single=False),
                AutocompletePanel("payment_method", target_model="cms.PaymentMethod", is_single=False),

            ],
            heading="Trading Account",
        ),
        MultiFieldPanel(
            [
                FieldPanel("about"),
                ImageChooserPanel("logo"),
                ImageChooserPanel("preview")
            ],
            heading="About",
        ),
    ]


class Option(models.Model):
    name = models.CharField(max_length=50)
    attribute = ParentalKey("Attribute", related_name="options")
    slug = AutoSlugField(populate_from='name', editable=True)

    def __str__(self):
        return self.name


class Attribute(ClusterableModel):
    name = models.CharField(max_length=50)
    categories = models.ManyToManyField('Category', through=Category.attributes.through, blank=True)
    services = models.ManyToManyField('Service', through=Service.attributes.through, blank=True)
    slug = AutoSlugField(populate_from='name', editable=True)

    SECTION_CHOICES = (
        (1, "General Information"),
        (2, "Account Options"),
        (3, "Customer Service"),
        (4, "Trading"),
        (5, "Account"),
        (6, "General information about IC Markets")
    )

    section = models.IntegerField(choices=SECTION_CHOICES, default=1, null=False)

    def __str__(self):
        return self.name

    def getKey(self):
        return self.slug.replace('-', '_')

    panels = [
        FieldPanel("name"),
        FieldPanel("categories", widget=forms.CheckboxSelectMultiple),
        FieldPanel("section"),
        InlinePanel("options", label="options")
    ]


class AttributeService(Orderable, ClusterableModel):
    attribute = models.ForeignKey(Attribute, on_delete=models.SET_NULL, null=True)
    service = ParentalKey("Service", related_name="attSer")

    def __str__(self):
        return f"{self.attribute}-{self.service}"

    panels = [
        FieldPanel("attribute"),
        MultiFieldPanel([
            InlinePanel("attSerVal", label="values", classname="collapsible")
        ], heading="attribute-service", classname="collapsible"),
    ]


class AttributeServiceValue(Orderable):
    attributeService = ParentalKey("AttributeService", related_name="attSerVal")
    value = models.CharField(max_length=50, blank=True)
    option = models.ForeignKey(Option, on_delete=models.SET_NULL, blank=True, default='', null=True)

    panels = [
        FieldPanel("value"),
        FieldPanel("option"),
    ]

    def __str__(self):
        return self.option.name if hasattr(self, 'option') and self.option else self.value


class Affiliate(models.Model):
    autocomplete_search_field = 'slug'
    linkTypes = [('out', 'out'), ('visit', 'visit'), ('go', 'go')]
    type = models.CharField(
        max_length=10,
        choices=linkTypes,
        default='go'
    )
    cloakedLink = models.URLField(max_length=500)
    slug = models.CharField(max_length=200, unique=True, null=False)
    clicks = models.IntegerField(default=0)

    def autocomplete_label(self):
        return self.getLink()

    def getLink(self):
        return f"/{self.type}/{self.slug}"

    def __str__(self):
        return self.getLink()

    def toDict(self):
        return {
            'url': self.getLink()
        }

    panels = [
        MultiFieldPanel(
            [
                FieldPanel("type"),
                FieldPanel("cloakedLink"),
                FieldPanel("slug"),
            ], heading="Affiliates",
        )
    ]


class Product(models.Model):
    name = models.CharField(max_length=100)
    body = RichTextField(max_length=500, verbose_name='Description')
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, null=True)
    affiliate = models.ForeignKey(Affiliate, on_delete=models.SET_NULL, null=True)
    slug = AutoSlugField(populate_from='name', editable=True, null=True)

    logo = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Image'
    )

    def __str__(self):
        return self.name

    panels = [
        MultiFieldPanel(
            [
                FieldPanel("service", classname="col6"),
                FieldPanel("name", classname="col6"),
                AutocompletePanel("affiliate", target_model="cms.Affiliate"),
                FieldPanel("body", classname="col12"),
                ImageChooserPanel("logo", classname="col12"),
            ], heading="Products",
        )
    ]


class Voucher(models.Model):
    slug = AutoSlugField(populate_from='name', editable=True)
    name = models.CharField(max_length=100)
    affiliate = models.ForeignKey(Affiliate, on_delete=models.SET_NULL, null=True)
    description = RichTextField(max_length=2500, blank=True, default=None, null=True)
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, null=True)

    expires = models.DateField(blank=True, null=True)
    never_expires = models.BooleanField(default=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def get_subobject(self):
        try:
            return self.discount
        except Voucher.discount.RelatedObjectDoesNotExist:
            pass
        try:
            return self.promocode
        except Voucher.promocode.RelatedObjectDoesNotExist:
            return self.offer

    def get_type(self):
        return self.__class__.__name__

    logo = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Image'
    )

    def __str__(self):
        return self.name

    def toDict(self):
        return {
            'name': self.name,
            'affiliate': self.affiliate.toDict(),
            'expires': self.expires.isoformat() if self.expires else None,
            'never_expires': self.never_expires,
            'type': self.get_type(),
            'description': self.description.__str__(),
            'logo': self.logo.get_rendition('height-100').url if self.logo else None,
            'service_name': self.service.name,
            'service_logo': self.service.logo.get_rendition('height-15').url if self.service.logo else None,
            'service_category': self.service.category.name,
            'service_affiliate': self.service.affiliate.toDict(),
            'service_rate': self.service.avg_rate
        }


class PromoCode(Voucher):
    code = models.CharField(max_length=200)

    def toDict(self):
        data = super(PromoCode, self).toDict()
        data['code'] = self.code
        return data

    panels = [
        MultiFieldPanel(
            [
                FieldPanel("service", classname="col6"),
                FieldPanel("name", classname="col12"),
                AutocompletePanel("affiliate", target_model="cms.Affiliate"),
                FieldPanel("description", classname="col12"),
                FieldPanel("code", classname="col12"),
                FieldPanel("expires", classname="col6"),
                FieldPanel("never_expires", classname="col6"),
                ImageChooserPanel("logo", classname="col12"),
            ], heading="PromoCode",
        )
    ]


class Discount(Voucher):
    discount_percent = models.IntegerField(verbose_name='Discount (%)', null=True, blank=True)

    def toDict(self):
        data = super(Discount, self).toDict()
        data['discount_percent'] = self.discount_percent
        return data

    panels = [
        MultiFieldPanel(
            [
                FieldPanel("service", classname="col6"),
                FieldPanel("name", classname="col12"),
                AutocompletePanel("affiliate", target_model="cms.Affiliate"),
                FieldPanel("description", classname="col12"),
                FieldPanel("discount_percent", classname="col12"),
                FieldPanel("expires", classname="col6"),
                FieldPanel("never_expires", classname="col6"),
                ImageChooserPanel("logo", classname="col12"),
            ], heading="Discount",
        )
    ]


class Offer(Voucher):
    panels = [
        MultiFieldPanel(
            [
                FieldPanel("service", classname="col6"),
                FieldPanel("name", classname="col12"),
                AutocompletePanel("affiliate", target_model="cms.Affiliate"),
                FieldPanel("description", classname="col12"),
                FieldPanel("expires", classname="col6"),
                FieldPanel("never_expires", classname="col6"),
                ImageChooserPanel("logo", classname="col12"),
            ], heading="Offers",
        )
    ]


class Comment(models.Model):
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, default=None, null=True)
    stars = models.IntegerField(choices=((1, 1), (2, 2), (3, 3), (4, 4), (5, 5)), blank=True, null=True)
    name = models.CharField(max_length=100)
    country = models.CharField(max_length=100)
    review = models.CharField(max_length=500)
    parent_comment = models.ForeignKey('self', on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    ip = models.CharField(max_length=20, null=True)
    active = models.BooleanField(default=False)
    country_code = models.CharField(max_length=2)

    panels = [
        FieldPanel("review"),
        FieldPanel("service"),
        FieldPanel("stars"),
        FieldPanel("name"),
        FieldPanel("country"),
        FieldPanel("parent_comment"),
        FieldPanel("active"),
        FieldPanel("country_code")
    ]

    def __str__(self):
        return self.review[:20]

    def toDict(self):
        return {'name': self.name,
                'country': self.country,
                'review': self.review,
                'stars': self.stars,
                'created_at': self.created_at.isoformat() if self.created_at else None,
                'updated_at': self.updated_at.isoformat() if self.updated_at else None,
                'ip': self.ip,
                'active': self.active,
                'country_code': self.country_code,
                'url': self.service.url + '#comments'
                }


class Compare(models.Model):
    service1 = models.ForeignKey(Service, on_delete=models.SET_NULL, default=None, null=True,
                                 related_name='compare_service1')
    service2 = models.ForeignKey(Service, on_delete=models.SET_NULL, default=None, null=True,
                                 related_name='compare_service2')
    count = models.IntegerField(default=0)

# def getCount(self):
#     complement = Compare.objects.get(service1=self.service2, service2=self.service1)
#     if complement:
#         return sum(self.count + complement.count)
#     else:
#         return self.count
