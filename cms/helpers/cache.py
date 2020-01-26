from cms.helpers.ServiceHelper import ServiceHelper
from django.core.cache import cache
import json


def reset_cache_service(service):
    '''
    Resets cache when service is updated.
    :param service:
    :return:
    '''
    hash = f'service_{service.id}'
    helper = ServiceHelper(service)
    value = json.dumps(helper.to_dict(refresh_cache=True))
    cache.set(hash, value, None)

def reset_cache_obj(obj):
    '''
    Resets cache when service is updated.
    :param service:
    :return:
    '''
    hash = f'{obj.__class__.__name__}_{obj.id}'
    value = json.dumps(obj.toDict(refresh_cache=True))
    cache.set(hash, value, None)