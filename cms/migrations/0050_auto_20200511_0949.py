# Generated by Django 2.2.9 on 2020-05-11 09:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0049_contactpage_formfield'),
    ]

    operations = [
        migrations.AddField(
            model_name='generalsettings',
            name='smtp_host',
            field=models.CharField(default='smtp.gmail.com', max_length=100),
        ),
        migrations.AddField(
            model_name='generalsettings',
            name='smtp_password',
            field=models.CharField(default='pass123', max_length=100),
            preserve_default=False,
        ),
    ]
