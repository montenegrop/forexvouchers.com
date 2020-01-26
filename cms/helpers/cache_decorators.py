from django.core.cache import cache
import json

def cache_service_dict(func):
    def wrapper(self, **kwargs):
        value = None
        hash = f'service_{self.service.id}'
        if 'refresh_cache' not in kwargs:
           value = cache.get(hash)

        if not value:
            result = func(self)
            value = json.dumps(result)
            cache.set(hash, value, None)
        return json.loads(value)
    return wrapper



def cache_to_dict(func):
    def wrapper(self, **kwargs):
        value = None
        hash = f'{self.__class__.__name__}_{self.id}'
        if 'refresh_cache' not in kwargs:
           value = cache.get(hash)

        if not value:
            result = func(self)
            value = json.dumps(result)
            cache.set(hash, value, None)
        return json.loads(value)
    return wrapper


