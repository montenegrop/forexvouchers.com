from django.db import models
from modelcluster.fields import ParentalKey
from wagtail.core.models import Orderable



class NewsSource(Orderable):
    setting = ParentalKey("NewsSettings", related_name="newsSources")
    title = models.CharField(max_length=200)
    url = models.URLField(blank=True, null=True, help_text="RSS Feed URL")
    active = models.BooleanField(default=True)


class NewsItem(models.Model):
    source = models.ForeignKey(NewsSource, on_delete=models.SET_NULL, null=True)
    title = models.CharField(max_length=200)
    link = models.CharField(max_length=2048)
    description = models.TextField(null=True, blank=True)
    date = models.DateTimeField()