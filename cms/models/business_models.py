from captcha.fields import ReCaptchaField
from django.core.mail.backends.smtp import EmailBackend
from wagtail.contrib.forms.forms import FormBuilder
from wagtailcaptcha.forms import WagtailCaptchaFormBuilder
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend

from cms.helpers.cache_decorators import cache_to_dict
from cms.models.site_settings import GeneralSettings
from cms.models.fields import *

from django_extensions.db.fields import AutoSlugField
from django import forms
from django.db.models import Q
import datetime

from modelcluster.models import ClusterableModel
from wagtail.core.models import Orderable, Site
from wagtail.core.fields import RichTextField
from wagtail.search import index
from modelcluster.fields import ParentalKey
from modelcluster.fields import ParentalManyToManyField

from wagtailautocomplete.edit_handlers import AutocompletePanel
from wagtailcaptcha.models import WagtailCaptchaEmailForm

from wagtail.core import hooks

from wagtail.admin.edit_handlers import (
    MultiFieldPanel,
    InlinePanel,
    FieldPanel,
)

# notifications:
from django.db import models

from modelcluster.fields import ParentalKey
from wagtail.admin.edit_handlers import (
    FieldPanel,
    FieldRowPanel,
    InlinePanel,
    MultiFieldPanel
)
from wagtail.core.fields import RichTextField
from wagtail.contrib.forms.models import (
    AbstractEmailForm,
    AbstractFormField
)

### images ####

from wagtail.images.models import Image
from wagtail.images.edit_handlers import ImageChooserPanel

# from wagtail.core.blocks import ChoiceBlock
from cms.json_ld.ServiceLD import ServiceLD
from cms.json_ld.VoucherLD import VoucherLD


class Category(models.Model):
    name = models.CharField(max_length=30)
    short_name = models.CharField(max_length=30)
    autocomplete_search_field = 'name'
    attributes = models.ManyToManyField('Attribute', blank=True)
    services = models.ManyToManyField('Service', blank=True, related_name='service_category')
    slug = AutoSlugField(populate_from='name', editable=True)

    panels = [
        MultiFieldPanel([
            FieldPanel('name'),
            FieldPanel('slug'),
            FieldPanel('short_name'),
        ], heading="Category")
    ]

    def __str__(self):
        return self.name

    def autocomplete_label(self):
        return self.name

    def toDict(self):
        return {
            'id': self.id,
            'name': self.name,
        }


class Service(ClusterableModel, index.Indexed):
    category = ParentalManyToManyField('Category', through=Category.services.through, blank=False)
    premium = models.BooleanField(null=False, default=False)
    attributes = models.ManyToManyField('Attribute', blank=True)
    slug = AutoSlugField(populate_from='name', editable=True)
    affiliate = models.ForeignKey("Affiliate", on_delete=models.SET_NULL, null=True, related_name='services')

    # Company profile:
    name = models.CharField(max_length=100)
    founded = models.IntegerField(null=True, blank=True)
    regulation = ParentalManyToManyField("Regulation", related_name='regulation', blank=True)
    license = ParentalManyToManyField("License", related_name='license', blank=True)
    location = ParentalManyToManyField("Location", related_name='location', blank=True)

    # # brokers only:
    status = models.ForeignKey("Status", on_delete=models.SET_NULL, null=True, blank=True)
    broker_type = ParentalManyToManyField("BrokerType", related_name='broker_type', blank=True)
    international_offices = ParentalManyToManyField("Location", related_name='international_offices',
                                                    blank=True)
    restrictions = ParentalManyToManyField("Location", related_name='restrictions',
                                           blank=True)

    # Trading setup
    timezone = models.ForeignKey("Timezone", on_delete=models.SET_NULL, null=True, blank=True)
    trading_software = ParentalManyToManyField("TradingSoftware", blank=True)
    operating_system = ParentalManyToManyField("PlatformSupported", blank=True)
    ea_robots = models.BooleanField(null=False, default=True)
    scalping = models.BooleanField(null=False, default=True)
    hedging = models.BooleanField(null=False, default=True)
    news_trading = models.BooleanField(null=False, default=True)

    # Customer support
    email = models.EmailField(blank=True, default=None, null=True)
    phone = models.CharField(max_length=500, blank=True, default=None, null=True)
    chat = ParentalManyToManyField("Chat", default=None, blank=True)
    support_languages = ParentalManyToManyField("SupportedLanguage", default=None, blank=True)
    office_address = models.CharField(max_length=500, blank=True, default=None, null=True)

    # Details
    system_type = ParentalManyToManyField("SystemType", blank=True)
    trading_type = ParentalManyToManyField("TradingType", blank=True)
    trading_software = ParentalManyToManyField("TradingSoftware", blank=True)
    trading_tools = ParentalManyToManyField("TradingTool", blank=True)
    pricing_model = ParentalManyToManyField("PricingModel", blank=True)

    # Trading account
    account_types = ParentalManyToManyField("AccountType", blank=True)
    trading_instrument = ParentalManyToManyField("TradingInstrument", blank=True)
    revenue_model = ParentalManyToManyField("RevenueModel", blank=True)
    account_options = ParentalManyToManyField("AccountOption", blank=True)
    account_currency = ParentalManyToManyField("AccountCurrency", blank=True)
    minimum_deposit = models.CharField(max_length=20, blank=True)
    commission = models.CharField(max_length=20, blank=True)
    leverage = models.CharField(max_length=20, blank=True)
    spread = models.CharField(max_length=20, blank=True)
    min_lot_size = models.CharField(max_length=20, blank=True)
    security_of_funds = ParentalManyToManyField("SecurityOfFunds", blank=True)
    deposit_method = ParentalManyToManyField("PaymentMethod", related_name='deposit_method', blank=True)
    withdraw_method = ParentalManyToManyField("PaymentMethod", related_name='withdraw_method', blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    # About
    about = RichTextField(max_length=2500, blank=True, default=None, null=True)

    # SEO
    meta_description = models.CharField(max_length=3000, default=None)

    # Images
    logo = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Logo (More width than height recommended)'
    )

    avg_rate = models.FloatField(null=True, blank=True)
    count_rate = models.IntegerField(null=True, blank=True)

    preview = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Preview (More width than height recommended)'
    )

    autocomplete_search_field = 'name'

    def autocomplete_label(self):
        return self.name

    class Meta:
        ordering = ['name']

    @property
    def get_avg_rate(self):
        return int(round(self.avg_rate)) if self.avg_rate else 0

    @property
    def get_count_rate(self):
        return self.count_rate if self.count_rate else 0

    @property
    def url(self):
        return '/forex-' + 'brokers' + '/' + self.slug

    def getAttributes(self):
        attributeServices = AttributeService.objects.select_related('attribute').filter(service=self)
        attributes = {attributeService.attribute.getKey(): {
            'label': attributeService.attribute.name,
            'value': ','.join([value.__str__() for value in attributeService.attSerVal.all()])
        } for attributeService in attributeServices}
        return attributes

    def __str__(self):
        return self.name

    def getCategoriesIDs(self):
        return [cat.id for cat in self.category.all()]

    def belongsToCategories(self, categories):
        return bool(list(set(self.getCategoriesIDs()) & set(categories)))

    def getTradingTypes(self):
        return [(ttype.name, ttype.id) for ttype in self.trading_type.all()]

    def getTradingsoftwares(self):
        return [(soft.name, soft.id) for soft in self.trading_software.all()]

    def getSystemTypes(self):
        return [(stype.name, stype.id) for stype in self.system_type.all()]

    def getTradingTools(self):
        return [(ttool.name, ttool.id) for ttool in self.trading_tools.all()]

    def getPricingModels(self):
        return [(price.name, price.id) for price in self.pricing_model.all()]

    def toDict(self):
        return {
            'name': self.name,
            'categories': self.getCategoriesIDs(),
            'trading_types': self.getTradingTypes(),
            'trading_softwares': self.getTradingsoftwares(),
            'system_types': self.getSystemTypes(),
            'trading_tools': self.getTradingTools(),
            'pricings': self.getPricingModels(),
            'logo_url_small': self.logo.get_rendition('width-45').url if self.logo else None,
            'logo_url': self.logo.get_rendition('width-100').url if self.logo else None,
            'url': self.url,
            'avg_rate': self.get_avg_rate,
            'count_rate': self.get_count_rate,
            'slug': self.slug,
            'created_at': self.created_at.isoformat() if self.created_at else None,
        }

    panels = [
        MultiFieldPanel(
            [
                AutocompletePanel("category", target_model="cms.Category", is_single=False),
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
                AutocompletePanel("location", target_model="cms.Location", is_single=False, ),
                AutocompletePanel('international_offices', target_model="cms.Location", is_single=False),
                AutocompletePanel("regulation", target_model="cms.Regulation", is_single=False),
                AutocompletePanel("restrictions", target_model="cms.Location", is_single=False),
            ],
            heading="Company Profile",
        ),
        MultiFieldPanel([FieldPanel('meta_description', classname="col12")], heading="Promote"),
        MultiFieldPanel(
            [
                AutocompletePanel("trading_type", target_model="cms.TradingType", is_single=False),
                AutocompletePanel("trading_software", target_model="cms.TradingSoftware", is_single=False),
                AutocompletePanel("trading_tools", target_model="cms.TradingTool", is_single=False),
                AutocompletePanel("system_type", target_model="cms.SystemType", is_single=False),
                AutocompletePanel("pricing_model", target_model="cms.PricingModel", is_single=False),
            ],
            heading="Details",
        ),
        MultiFieldPanel(
            [
                FieldPanel("ea_robots", classname="col4"),
                FieldPanel("scalping", classname="col4"),
                FieldPanel("hedging", classname="col4"),
                FieldPanel("timezone", classname="col12"),
                FieldPanel("news_trading", classname="col12"),
                AutocompletePanel("trading_software", target_model="cms.TradingSoftware", is_single=False),
                AutocompletePanel("operating_system", target_model="cms.PlatformSupported", is_single=False),

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
                FieldPanel("min_lot_size", classname="col12"),
                AutocompletePanel("account_types", target_model="cms.AccountType", is_single=False),
                AutocompletePanel("trading_instrument", target_model="cms.TradingInstrument", is_single=False),
                AutocompletePanel("revenue_model", target_model="cms.RevenueModel", is_single=False),
                AutocompletePanel("account_options", target_model="cms.AccountOption", is_single=False),
                AutocompletePanel("account_currency", target_model="cms.AccountCurrency", is_single=False),
                AutocompletePanel("deposit_method", target_model="cms.PaymentMethod", is_single=False),
                AutocompletePanel("withdraw_method", target_model="cms.PaymentMethod", is_single=False),
                AutocompletePanel("security_of_funds", is_single=False),
            ],
            heading="Trading Account",
        ),
        MultiFieldPanel(
            [
                FieldPanel("about"),
            ],
            heading="About",
        ),
        MultiFieldPanel(
            [
                ImageChooserPanel("logo"),
                ImageChooserPanel("preview"),
            ],
            heading="Media",
        )
    ]

    search_fields = [
        index.SearchField('name', partial_match=True, boost=10),
    ]

    @property
    def json_ld(self):
        return ServiceLD(self)


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
    cloakedLink = models.URLField(max_length=500, verbose_name='Cloacked link')
    slug = models.CharField(max_length=200, unique=True, null=False)
    clicks = models.IntegerField(default=0)

    def autocomplete_label(self):
        return self.getLink()

    def getLink(self):
        return f"/{self.type}/{self.slug}"

    def __str__(self):
        return self.getLink()

    def getClicks(self):
        if self.clicks < 1000:
            return str(self.clicks)
        elif self.clicks < 10000:
            return str(self.clicks)[:1] + 'K'
        elif self.clicks < 100000:
            return str(self.clicks)[:2] + 'K'
        elif self.clicks < 1000000:
            return str(self.clicks)[:3] + 'K'
        elif self.clicks < 10000000:
            return str(self.clicks)[:1] + 'Mil'

    def toDict(self):
        return {
            'url': self.getLink(),
            'clicks': self.clicks,
            'clicks_large': self.getClicks(),
        }

    panels = [
        FieldPanel("type", classname="col6"),
        FieldPanel("cloakedLink", classname="col6"),
        FieldPanel("slug", classname="col6"),
    ]


class Product(models.Model):
    name = models.CharField(max_length=100)
    body = RichTextField(max_length=500, verbose_name='Description')
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, null=True)
    affiliate = models.ForeignKey(Affiliate, on_delete=models.SET_NULL, null=True, related_name='products')
    slug = AutoSlugField(populate_from='name', editable=True, null=True)

    logo = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
        verbose_name='Image (More width than height recommended)'
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


class Voucher(models.Model, index.Indexed):
    slug = AutoSlugField(populate_from='name', editable=True)
    name = models.CharField(max_length=100)
    affiliate = models.ForeignKey(Affiliate, on_delete=models.SET_NULL, null=True, related_name='vouchers')
    description = RichTextField(max_length=2500, blank=True, default=None, null=True)
    service = models.ForeignKey(Service, on_delete=models.SET_NULL, null=True)

    expires = models.DateField(blank=True, null=True)
    never_expires = models.BooleanField(default=True)
    meta_description = models.CharField(max_length=3000, default=None)

    likes = models.IntegerField(default=0)
    dislikes = models.IntegerField(default=0)


    @classmethod
    def not_expired_condition(cls):
        return Q(expires__gte=datetime.date.today()) | Q(
            never_expires=True)

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
        verbose_name='Logo (More width than height recommended)'
    )

    def __str__(self):
        return self.name

    def toDict(self):
        return {
            'id': self.id,
            'name': self.name,
            'affiliate': self.affiliate.toDict(),
            'expires': self.expires.isoformat() if self.expires else None,
            'never_expires': self.never_expires,
            'type': self.get_type(),
            'description': self.description.__str__(),
            'logo': self.logo.get_rendition('width-100').url if self.logo else None,
            'logo_url_small': self.logo.get_rendition('width-45').url if self.logo else None,
            'service_id': self.service.id,
            'service_name': self.service.name,
            'service_logo': self.service.logo.get_rendition('width-15').url if self.service.logo else None,
            'service_logo_medium': self.service.logo.get_rendition('width-80').url if self.service.logo else None,
            'service_logo_big': self.service.logo.get_rendition('width-120').url if self.service.logo else None,
            'service_category': self.service.getCategoriesIDs(),
            'service_affiliate': self.service.affiliate.toDict(),
            'service_rate': self.service.get_avg_rate,
            'service_url': self.service.url,
            'middleware_url': '/' + self.get_type().lower() + 's/' + self.slug,
            'likes': self.likes,
            'dislikes': self.dislikes,
            'url': '/' + self.get_type().lower() + 's/' + self.slug
        }

    @property
    def json_ld(self):
        return VoucherLD(self)

    search_fields = [
        index.SearchField('name', partial_match=True, boost=10),
        index.FilterField('expires'),
        index.FilterField('never_expires')
    ]


class PromoCode(Voucher):
    code = models.CharField(max_length=200)

    @cache_to_dict
    def toDict(self):
        data = super(PromoCode, self).toDict()
        data['code'] = self.code
        return data

    panels = [
        MultiFieldPanel(
            [
                AutocompletePanel("service", target_model="cms.Service", classname="col6"),
                FieldPanel("name", classname="col12"),
                AutocompletePanel("affiliate", target_model="cms.Affiliate"),
                FieldPanel("description", classname="col12"),
                FieldPanel("code", classname="col12"),
                FieldPanel("expires", classname="col6"),
                FieldPanel("never_expires", classname="col6"),
                ImageChooserPanel("logo", classname="col12"),
            ], heading="PromoCode",
        ),
        MultiFieldPanel([FieldPanel('meta_description', classname="col12")], heading="Promote")
    ]


class Discount(Voucher):
    discount_percent = models.IntegerField(verbose_name='Discount (%)', null=True, blank=True)

    @cache_to_dict
    def toDict(self):
        data = super(Discount, self).toDict()
        data['discount_percent'] = self.discount_percent
        return data

    panels = [
        MultiFieldPanel(
            [
                AutocompletePanel("service", target_model="cms.Service", classname="col6"),
                FieldPanel("name", classname="col12"),
                AutocompletePanel("affiliate", target_model="cms.Affiliate"),
                FieldPanel("description", classname="col12"),
                FieldPanel("discount_percent", classname="col12"),
                FieldPanel("expires", classname="col6"),
                FieldPanel("never_expires", classname="col6"),
                ImageChooserPanel("logo", classname="col12"),
            ], heading="Discount",
        ),
        MultiFieldPanel([FieldPanel('meta_description', classname="col12")], heading="Promote")
    ]


class Offer(Voucher):
    panels = [
        MultiFieldPanel(
            [
                AutocompletePanel("service", target_model="cms.Service", classname="col6"),
                FieldPanel("name", classname="col12"),
                AutocompletePanel("affiliate", target_model="cms.Affiliate"),
                FieldPanel("description", classname="col12"),
                FieldPanel("expires", classname="col6"),
                FieldPanel("never_expires", classname="col6"),
                ImageChooserPanel("logo", classname="col12"),
            ], heading="Offers",
        ),
        MultiFieldPanel([FieldPanel('meta_description', classname="col12")], heading="Promote")
    ]

    @cache_to_dict
    def toDict(self):
        return super(Offer, self).toDict()


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

    panels = [MultiFieldPanel([
        AutocompletePanel("service", target_model="cms.Service", classname="col6"),
        FieldPanel("stars", classname="col6"),
        FieldPanel("name", classname="col6"),
        FieldPanel("parent_comment", classname="col6 hidden", widget=forms.HiddenInput),
        FieldPanel("active", classname="col6"),
        FieldPanel("review", widget=forms.Textarea, classname="col12"),
    ], heading="")]

    def __str__(self):
        return self.review[:20]

    @cache_to_dict
    def toDict(self):
        return {
            'id': self.id,
            'permalink': f'{self.service.url}#comment-{self.id}' if self.service else '',
            'name': self.name,
            'country': self.country,
            'review': self.review,
            'stars': self.stars,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None,
            'ip': self.ip,
            'active': self.active,
            'country_code': self.country_code,
            'url': self.service.url + '#comments' if self.service else None,
            'service_name': self.service.name if self.service else None,
            'service_url': self.service.url if self.service else None,
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


class FormField(AbstractFormField):
    page = ParentalKey(
        'ContactPage',
        on_delete=models.CASCADE,
        related_name='form_fields',
    )





