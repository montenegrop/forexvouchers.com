# Generated by Django 2.2.9 on 2020-01-20 02:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0030_service_created_at'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='short_name',
            field=models.CharField(default='shortname', max_length=30),
            preserve_default=False,
        ),
    ]