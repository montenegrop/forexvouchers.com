# Generated by Django 2.2.9 on 2020-05-13 22:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0055_auto_20200512_0433'),
    ]

    operations = [
        migrations.AlterField(
            model_name='generalsettings',
            name='smtp_port',
            field=models.IntegerField(),
        ),
    ]
