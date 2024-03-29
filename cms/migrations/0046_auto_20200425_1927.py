# Generated by Django 2.2.10 on 2020-04-25 19:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0045_newssource_url_site'),
    ]

    operations = [
        migrations.AddField(
            model_name='generalsettings',
            name='recaptcha_secret_key',
            field=models.TextField(blank=True, default='', max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='generalsettings',
            name='recaptcha_site_key',
            field=models.TextField(blank=True, default='', max_length=1000, null=True),
        ),
    ]
