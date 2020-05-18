from django import template
from wagtail.core.models import Page
from wagtailtrans.models import TranslatablePage
from django.db.models import Q

from cms.models import Menu, Language

register = template.Library()

@register.simple_tag()
def get_menu(slug):
    return Menu.objects.get(slug=slug)

@register.simple_tag()
def get_languages():
    langs = Language.objects.select_related('language_code').all()
    codes = []
    for lang in langs:
        codes.append(f"'{lang.language_code.code}'")
    return {
        "codes": ','.join(codes),
        "languages": langs
    }

@register.simple_tag()
def flagIconCode(code, languages):
    langs = [lang for lang in languages if lang.language_code.code == code]
    return langs[0].flag_code if len(langs) else 'en'

@register.simple_tag()
def translatablePage(code, page):
    if isinstance(page, Page):
        try:
           transpage = TranslatablePage.objects.get(Q(Q(canonical_page=page.id) | Q(translatable_page_ptr=page)) & Q(language__code=code))
           return transpage.url
        except:
            return page.url

    return page




