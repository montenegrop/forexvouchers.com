# Generated by Django 2.2.3 on 2019-07-30 21:51

from django.db import migrations, models
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0009_auto_20190730_2141'),
    ]

    operations = [
        migrations.AddField(
            model_name='service',
            name='chat',
            field=modelcluster.fields.ParentalManyToManyField(default=None, null=True, to='cms.Chat'),
        ),
        migrations.AddField(
            model_name='service',
            name='email',
            field=models.EmailField(blank=True, default=None, max_length=254, null=True),
        ),
        migrations.AddField(
            model_name='service',
            name='office_address',
            field=models.CharField(blank=True, default=None, max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='service',
            name='phone',
            field=models.CharField(blank=True, default=None, max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='service',
            name='support_languages',
            field=modelcluster.fields.ParentalManyToManyField(default=None, null=True, to='cms.Language'),
        ),
    ]