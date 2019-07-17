from django.db import models

class Country(models.Model):
    name = models.CharField(max_length=30)
    code = models.CharField(max_length=4)
    continent = models.CharField(max_length=30)
    capital = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Timezone(models.Model):
    name = models.CharField(max_length=30)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
