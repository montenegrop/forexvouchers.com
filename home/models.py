from django.db import models

from wagtail.core.models import Page
from wagtail.core.fields import RichTextField
from wagtail.admin.edit_handlers import FieldPanel


class HomePage(Page):
    body = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]


class Category(models.Model):
    name = models.CharField(max_length=30)
    attributes = models.ManyToManyField('Attribute', blank=True)

    panels = [
        FieldPanel('name')
    ]

    def __str__(self):
        return self.name


class Service(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models.CharField(max_length=30)
    premium = models.BooleanField(null=True)
    attributes = models.ManyToManyField('Attribute', blank=True)

    def getAttributeValues(self):
        # return AttributeValue.objects.filter(service=self)
        pass

    def __str__(self):
        return self.name


class Attribute(models.Model):
    name = models.CharField(max_length=50)
    categories = models.ManyToManyField('Category', through=Category.attributes.through, blank=True)
    services = models.ManyToManyField('Service', through=Service.attributes.through, blank=True)

    def __str__(self):
        return self.name


class AttributeService(models.Model):
    attribute = models.ForeignKey(Attribute, on_delete=models.CASCADE)
    service = models.ForeignKey(Service, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.attribute}-{self.service}"

class AttributeServiceValue(models.Model):
    attributeService = models.ForeignKey(AttributeService, on_delete=models.CASCADE)
    value = models.CharField(max_length=50)

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


class Voucher(models.Model):
    type = models.CharField(max_length=30)
    name = models.CharField(max_length=50)
    description = models.TextField()

    def __str__(self):
        return self.name
