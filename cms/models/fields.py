from django.db import models
from wagtail.core.models import Orderable, ClusterableModel


class AbstractField(object):
    autocomplete_search_field = 'name'

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

    autocomplete_search_field = 'code'

    def __str__(self):
        return self.code

    def autocomplete_label(self):
        return self.code


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


class TrainingTool(AbstractField, models.Model):
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
    name = models.CharField(max_length=30)


class TradingInstrument(AbstractField, models.Model):
    name = models.CharField(max_length=30)


class RevenueModel(AbstractField, models.Model):
    name = models.CharField(max_length=30)


class AccountOption(AbstractField, models.Model):
    name = models.CharField(max_length=30)


class AccountCurrency(AbstractField, models.Model):
    name = models.CharField(max_length=10)


class PaymentMethod(AbstractField, models.Model):
    name = models.CharField(max_length=50)

########################
