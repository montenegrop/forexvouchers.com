from wagtailschemaorg.jsonld import ThingLD
from wagtailschemaorg.utils import extend
from django.conf import settings
import re


from cms.helpers.ServiceHelper import ServiceHelper

BASE_URL = settings.BASE_URL


class ServiceLD(ThingLD):
    def __init__(self, service):
        self.service = service

    def ld_get_url(self):
        return f'{BASE_URL}/services/{self.service.slug}'

    def ld_entity(self):
        service = ServiceHelper(self.service).to_dict()
        about = re.sub('<[^<]+?>', '', service['about'])
        return extend(super().ld_entity(), {
                                            "@type": "FinancialService",
                                            "name": service['name'],
                                            "description": about,
                                            "logo": f"{BASE_URL}{ service['logo_url'] }",
                                          })
