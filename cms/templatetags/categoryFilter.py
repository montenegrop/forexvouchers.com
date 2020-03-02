from django.template import Library

from cms.helpers.ServiceHelper import TRAINING, VPS, TRADING_SYSTEM, SIGNALS, TOOLS

categories = {
    'training': TRAINING,
    'vps': VPS,
    'trading': TRADING_SYSTEM,
    'signal': SIGNALS,
    'tools': TOOLS
}


def urlToCategory(cat):
    return f'/services/?categories={categories[cat]}'


register = Library()
register.filter('urlToCategory', urlToCategory)
