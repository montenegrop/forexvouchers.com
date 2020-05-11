from django import template
from cms.models import Menu, Language

register = template.Library()

@register.simple_tag()
def get_menu(slug):
    return Menu.objects.get(slug=slug)

@register.simple_tag()
def get_languages():
    langs = Language.objects.all()
    codes = []
    for lang in langs:
        codes.append(f"'{lang.language_code}'")
    return {
        "codes": ','.join(codes),
        "languages": langs
    }

def flagIconCode(code, languages):
    langs = [lang for lang in languages if lang.language_code == code]
    return langs[0].flag_code if len(langs) else 'en'

register.simple_tag(flagIconCode)

