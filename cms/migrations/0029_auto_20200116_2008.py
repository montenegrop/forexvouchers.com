# Generated by Django 2.2.9 on 2020-01-16 20:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0028_auto_20191217_2147'),
    ]

    operations = [
        migrations.RenameField(
            model_name='service',
            old_name='trading_instruments',
            new_name='trading_instrument',
        ),
    ]
