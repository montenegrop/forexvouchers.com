# Generated by Django 2.2.1 on 2019-09-23 00:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0010_auto_20190903_2203'),
    ]

    operations = [
        migrations.AddField(
            model_name='voucher',
            name='expires',
            field=models.DateField(default='1999-10-10'),
        ),
    ]