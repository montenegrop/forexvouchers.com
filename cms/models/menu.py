from django.db import models
from django_extensions.db.fields import AutoSlugField
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from wagtail.core.models import Orderable

from wagtail.admin.edit_handlers import (
    MultiFieldPanel,
    InlinePanel,
    FieldPanel,
    PageChooserPanel)
from wagtail.snippets.models import register_snippet
from wagtailautocomplete.edit_handlers import AutocompletePanel


class MenuItem(Orderable):
    link_title = models.CharField(blank=True, null=True, max_length=100)
    link_url = models.CharField(max_length=500, blank=True)
    link_page = models.ForeignKey("wagtailcore.Page", null=True, blank=True, related_name="+", on_delete=models.CASCADE)
    open_in_new_tab = models.BooleanField(default=False)
    page = ParentalKey("Menu",  related_name="menu_items")
    sub_menu = models.ForeignKey("cms.Menu", null=True, blank=True, related_name="+", on_delete=models.CASCADE)

    panels = [
        FieldPanel("link_title"),
        FieldPanel("link_url"),
        PageChooserPanel("link_page"),
        FieldPanel("open_in_new_tab"),
        AutocompletePanel('sub_menu', target_model="cms.Menu", is_single=True),
    ]

    @property
    def link(self):
        if self.sub_menu_id:
            return self.sub_menu
        elif self.link_page:
            return self.link_page.url
        elif self.link_url:
            return self.link_url
        return '#'

    @property
    def target(self):
        return "_blank" if self.open_in_new_tab else "_self"


@register_snippet
class Menu(ClusterableModel):
    title = models.CharField(max_length=100)
    slug = AutoSlugField(populate_from="title", editable=True)

    autocomplete_search_field = 'title'


    panels = [
        MultiFieldPanel([
            FieldPanel('title'),
            FieldPanel('slug')
        ], heading='Menu'),
        InlinePanel("menu_items", label="Menu Item")
    ]

    def __str__(self):
        return self.title

    def get_label(self):
        return self.__class__.__name__

    def autocomplete_label(self):
        return self.title


@register_snippet
class Language(ClusterableModel):
    name = models.CharField(max_length=100)
    language_code = models.CharField(max_length=2, null=True)
    flag_code = models.CharField(max_length=2, help_text="This is used to display the right flag. Search for the correct 2-digit country code here: https://www.iso.org/obp/ui/#search ")

    autocomplete_search_field = 'name'

    panels = [
        MultiFieldPanel([
            FieldPanel('name'),
            FieldPanel('language_code'),
            FieldPanel('flag_code')
        ], heading='Language')
    ]

    def __str__(self):
        return self.name

    def get_label(self):
        return self.__class__.__name__

    def autocomplete_label(self):
        return self.name
