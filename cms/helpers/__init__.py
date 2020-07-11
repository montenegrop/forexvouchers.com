from django.db.models import Q
import datetime


def not_expired_condition():
    return Q(expires__gte=datetime.date.today()) | Q(
        never_expires=True)
