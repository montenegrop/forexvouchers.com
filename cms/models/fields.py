from django.db import models
from wagtail.core.models import Orderable, ClusterableModel


class AbstractField(object):
    autocomplete_search_field = 'name'

    class Meta:
        ordering = ['name']

    def get_label(self):
        return self.__class__.__name__

    def autocomplete_label(self):
        return self.name

    def __str__(self):
        return self.name


class Status(AbstractField, models.Model):
    name = models.CharField(max_length=30)


class BrokerType(AbstractField, models.Model):
    name = models.CharField(max_length=30)
    description = models.CharField(max_length=500)

    def __str__(self):
        return self.name


##

class Location(AbstractField, models.Model):
    name = models.CharField(max_length=100)
    code = models.CharField(max_length=4)
    continent = models.CharField(max_length=100)
    capital = models.CharField(max_length=100)

    def __str__(self):
        return self.name

    def to_dict(self):
        return {
            "name": self.name,
            "code": self.code
        }


##


class Regulation(AbstractField, ClusterableModel):
    code = models.CharField(max_length=30)
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    description = models.CharField(max_length=500)
    link = models.URLField()

    class Meta:
        ordering = ['code']

    autocomplete_search_field = 'code'


    def __str__(self):
        return self.code

    def autocomplete_label(self):
        return self.code

    def to_dict(self):
        return {
            'code': self.code,
            'description': self.description,
            'location': self.location.to_dict() if self.location else None
        }


class License(AbstractField, models.Model):
    name = models.CharField(max_length=30)


#######################


class Timezone(AbstractField, ClusterableModel):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class TradingSoftware(AbstractField, models.Model):
    name = models.CharField(max_length=30)


class PlatformSupported(AbstractField, models.Model):
    name = models.CharField(max_length=30)


########################


class Chat(AbstractField, models.Model):
    name = models.CharField(max_length=100)


class SupportedLanguage(AbstractField, models.Model):
    name = models.CharField(max_length=100)


########################


class TrainingCourse(AbstractField, models.Model):
    name = models.CharField(max_length=100)


class TrainingType(AbstractField, models.Model):
    name = models.CharField(max_length=100)


class Methodology(AbstractField, models.Model):
    name = models.CharField(max_length=100)


class PricingModel(AbstractField, models.Model):
    name = models.CharField(max_length=100)


class SystemType(AbstractField, models.Model):
    name = models.CharField(max_length=100)


class TradingType(AbstractField, models.Model):
    name = models.CharField(max_length=100)


class SignalAlert(AbstractField, models.Model):
    name = models.CharField(max_length=100)


########################


class AccountType(AbstractField, models.Model):
    name = models.CharField(max_length=150)


class TradingInstrument(AbstractField, models.Model):
    name = models.CharField(max_length=150)


class RevenueModel(AbstractField, models.Model):
    name = models.CharField(max_length=150)


class AccountOption(AbstractField, models.Model):
    name = models.CharField(max_length=150)


class AccountCurrency(AbstractField, models.Model):
    name = models.CharField(max_length=150)


class PaymentMethod(AbstractField, models.Model):
    name = models.CharField(max_length=150)


########################
# new fields:
class TradingTool(AbstractField, models.Model):
    name = models.CharField(max_length=150)


class SecurityOfFunds(AbstractField, models.Model):
    name = models.CharField(max_length=150)
