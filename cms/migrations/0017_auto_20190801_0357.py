# Generated by Django 2.2.1 on 2019-08-01 03:57

from django.db import migrations
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0016_auto_20190801_0356'),
    ]

    operations = [
        migrations.AlterField(
            model_name='service',
            name='support_languages',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, default=None, to='cms.Language'),
        ),
    ]
