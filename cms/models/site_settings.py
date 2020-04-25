from django.db import models
from django.db.models import TextField
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

    recaptcha_site_key = TextField(max_length=1000, blank=True, default="", null=True, help_text="Please use reCaptcha v2")
    recaptcha_secret_key = TextField(max_length=1000, blank=True, default="", null=True, help_text="Please use reCaptcha v2")

    panels = [
        MultiFieldPanel([
            FieldPanel("facebook"),
            FieldPanel("twitter"),
            FieldPanel("instagram"),
        ], heading="Social Media Settings"),
        MultiFieldPanel([
            FieldPanel("footer_custom_text"),
        ], heading="General"),
        MultiFieldPanel([
            FieldPanel("recaptcha_site_key"),
            FieldPanel("recaptcha_secret_key"),
        ], heading="Third-party APIs")

    ]

@register_setting
class NewsSettings(BaseSetting, ClusterableModel):
    # newsSource = models.ForeignKey("NewsSource", on_delete=models.SET_NULL, null=True, related_name='newsSettings')


    panels = [
        MultiFieldPanel([
            InlinePanel("newsSources", label="source", classname="collapsible")
        ], heading="News Sources")

    ]