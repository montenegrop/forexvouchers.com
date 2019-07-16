from django.db import models

from django_extensions.db.fields import AutoSlugField
from django import forms

from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from wagtail.core.models import Orderable
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import (
    MultiFieldPanel,
    InlinePanel,
    FieldPanel,
)


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
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    premium = models.BooleanField(null=False, default=False)
    attributes = models.ManyToManyField('Attribute', blank=True)
    slug = AutoSlugField(populate_from='name', editable=True)

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
                FieldPanel("category"),
                FieldPanel("name"),
                FieldPanel("premium"),
                FieldPanel("slug")
            ],
            heading="service",
        ),
        MultiFieldPanel(
            [
                InlinePanel("attSer", label="attributes")
            ],
            heading="values",
            classname="collapsible"
        )
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
    attribute = models.ForeignKey(Attribute, on_delete=models.CASCADE)
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
    option = models.ForeignKey(Option, on_delete=models.CASCADE, blank=True, default='', null=True)

    panels = [
        FieldPanel("value"),
        FieldPanel("option"),
    ]

    def __str__(self):
        return self.option.name if hasattr(self, 'option') and self.option else self.value


class Affiliate(models.Model):
    linkTypes = [('out', 'out'), ('visit', 'visit'), ('go', 'go')]
    type = models.CharField(
        max_length=10,
        choices=linkTypes,
        default='go'
    )
    cloakedLink = models.URLField(max_length=500)
    slug = models.CharField(max_length=200, unique=True, null=False)

    def getLink(self):
        return f"/{self.type}/{self.slug}"

    def __str__(self):
        return self.getLink()


class Product(models.Model):
    name = models.CharField(max_length=50)
    body = RichTextField(max_length=500)
    service = models.ForeignKey(Service, on_delete=models.CASCADE)
    link = models.OneToOneField(Affiliate, on_delete=models.CASCADE, primary_key=True)
    slug = AutoSlugField(populate_from='name', editable=True)


class Voucher(models.Model):
    type = models.CharField(max_length=30)
    name = models.CharField(max_length=50)
    description = models.TextField()
    slug = AutoSlugField(populate_from='name', editable=True)

    def __str__(self):
        return self.name


class Comment(models.Model):
    service = models.ForeignKey(Service, on_delete=models.CASCADE, default=None)
    stars = models.IntegerField(choices=((1, 1), (2, 2), (3, 3), (4, 4), (5, 5)), null=True)
    name = models.CharField(max_length=100)
    country = models.CharField(max_length=50)
    review = models.CharField(max_length=500)
    parent_comment = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)
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
        return self.review

    def toDict(self):
        return {'name': self.name,
                'stars': self.stars,
                'country': self.country,
                'review': self.review,
                'stars': self.stars,
                'comment': self.parent_comment,
                'created_at': self.created_at,
                'updated_at': self.updated_at,
                'ip': self.ip,
                'active': self.active,
                'country_code': self.country_code
                }
