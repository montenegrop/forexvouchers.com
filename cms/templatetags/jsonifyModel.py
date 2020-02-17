import json
from django.template import Library

register = Library()


def jsonifyModel(object):
    return json.dumps(object.toDict())


register.filter('jsonifyModel', jsonifyModel)
