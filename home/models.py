from django.db import models

from django_extensions.db.fields import AutoSlugField

from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from wagtail.core.models import Orderable

from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import (
    MultiFieldPanel,
    InlinePanel,
    FieldPanel,
)



from wagtail.core.blocks import ChoiceBlock


class HomePage(Page):
    body = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]


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


class Service(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    premium = models.BooleanField(null=False)
    attributes = models.ManyToManyField('Attribute', blank=True)
    slug = AutoSlugField(populate_from='name', editable=True)

    def getAttributeValues(self):
        # return AttributeValue.objects.filter(service=self)
        pass

    def __str__(self):
        return self.name


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

    def __str__(self):
        return self.name

    panels = [
        FieldPanel("name"),
        FieldPanel("categories"),
        InlinePanel("options", label="options")
    ]


class AttributeService(ClusterableModel):
    attribute = models.ForeignKey(Attribute, on_delete=models.CASCADE)
    service = models.ForeignKey(Service, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.attribute}-{self.service}"

    panels = [
        MultiFieldPanel([
            FieldPanel("attribute"),
            FieldPanel("service"),
        ], heading="attribute-service"),
        InlinePanel("attSerVal", label="values")
    ]


class AttributeServiceValue(Orderable):
    attributeService = ParentalKey("AttributeService", related_name="attSerVal")
    value = models.CharField(max_length=50)
    option = models.ForeignKey(Option, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.value


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
