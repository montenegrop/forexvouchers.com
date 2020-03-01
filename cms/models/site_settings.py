from django.db import models
from modelcluster.models import ClusterableModel

from wagtail.admin.edit_handlers import FieldPanel, MultiFieldPanel, InlinePanel
from wagtail.contrib.settings.models import BaseSetting, register_setting
from wagtail.core.fields import RichTextField


@register_setting
class GeneralSettings(BaseSetting):
    """Social media settings for our custom website.
    https://www.youtube.com/watch?v=jsan9SclzpI
    """

    facebook = models.URLField(blank=True, null=True, help_text="Facebook URL")
    twitter = models.URLField(blank=True, null=True, help_text="Twitter URL")
    instagram = models.URLField(blank=True, null=True, help_text="Instagram URL")

    footer_custom_text = RichTextField(max_length=2500, blank=True, default=None, null=True)



    panels = [
        MultiFieldPanel([
            FieldPanel("facebook"),
            FieldPanel("twitter"),
            FieldPanel("instagram"),
        ], heading="Social Media Settings"),
        MultiFieldPanel([
            FieldPanel("footer_custom_text"),
        ], heading="General")

    ]

@register_setting
class NewsSettings(BaseSetting, ClusterableModel):
    # newsSource = models.ForeignKey("NewsSource", on_delete=models.SET_NULL, null=True, related_name='newsSettings')


    panels = [
        MultiFieldPanel([
            InlinePanel("newsSources", label="source", classname="collapsible")
        ], heading="News Sources")

    ]