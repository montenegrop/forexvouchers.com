# Generated by Django 2.2.10 on 2020-05-16 05:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0056_merge_20200513_0500'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='accountcurrency',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='accountoption',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='accounttype',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='brokertype',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='chat',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='license',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='location',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='methodology',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='paymentmethod',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='platformsupported',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='pricingmodel',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='regulation',
            options={'ordering': ['code']},
        ),
        migrations.AlterModelOptions(
            name='revenuemodel',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='securityoffunds',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='service',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='signalalert',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='status',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='supportedlanguage',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='systemtype',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='timezone',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='tradinginstrument',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='tradingsoftware',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='tradingtool',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='tradingtype',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='trainingcourse',
            options={'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='trainingtype',
            options={'ordering': ['name']},
        ),
        migrations.RemoveField(
            model_name='language',
            name='language_code',
        ),
        migrations.AlterField(
            model_name='generalsettings',
            name='smtp_port',
            field=models.IntegerField(),
        ),
    ]
