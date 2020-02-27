from django.db import models

from wagtail.admin.edit_handlers import FieldPanel, MultiFieldPanel
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


