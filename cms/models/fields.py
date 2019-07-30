from django.db import models
from wagtail.core.models import Orderable, ClusterableModel

class AbstractField(object):
    autocomplete_search_field = 'name'

    def get_label(self):
        return self.__class__.__name__

    def autocomplete_label(self):
        return self.name



class Status(AbstractField, models.Model):
    name = models.CharField(max_length=30)

class BrokerType(AbstractField, models.Model):
    name = models.CharField(max_length=30)
    description = models.CharField(max_length=500)



class AccountTypes(AbstractField, models.Model):
    name = models.CharField(max_length=30)


class AccountOptions(AbstractField, models.Model):
    name = models.CharField(max_length=30)

class AccountCurrency(AbstractField, models.Model):
    name = models.CharField(max_length=10)

class PaymentMethod(AbstractField, models.Model):
    name = models.CharField(max_length=50)

class TradingSoftware(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class PlatformsSupported(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class Chat(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class Language(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class TrainingCourse(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class TrainingType(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class Methodology(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class TrainingTools(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class PricingModel(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class SystemType(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class TradingType(AbstractField, models.Model):
    name = models.CharField(max_length=100)

class SignalAlert(AbstractField, models.Model):
    name = models.CharField(max_length=100)


class Country(AbstractField, models.Model):
    name = models.CharField(max_length=30)
    code = models.CharField(max_length=4)
    continent = models.CharField(max_length=30)
    capital = models.CharField(max_length=50)


    def __str__(self):
        return self.name


class Timezone(AbstractField, models.Model):
    name = models.CharField(max_length=30)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Regulation(AbstractField, models.Model):
    code = models.CharField(max_length=30)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)
    description = models.CharField(max_length=500)
    link = models.URLField()
