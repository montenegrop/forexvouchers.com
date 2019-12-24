from wagtailschemaorg.jsonld import ThingLD
from wagtailschemaorg.utils import extend
from django.conf import settings
import re

BASE_URL = settings.BASE_URL


class VoucherLD(ThingLD):
    def __init__(self, voucher):
        self.voucher = voucher.toDict()

    def ld_get_url(self):
        return f"{BASE_URL}{self.voucher['middleware_url']}"

    def ld_entity(self):
        voucher = self.voucher
        description = re.sub('<[^<]+?>', '', voucher['description'])
        return extend(super().ld_entity(), {
                                            "@type": "FinancialProduct",
                                            "name": voucher['name'],
                                            "description": f"{description}",
                                            "logo": f"{BASE_URL}{ voucher['logo'] }",
                                          })
