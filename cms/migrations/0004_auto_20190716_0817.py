# Generated by Django 2.2.1 on 2019-07-16 08:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0003_comment_country_code'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='country',
            field=models.CharField(default='Argentina', max_length=50),
        ),
        migrations.AlterField(
            model_name='comment',
            name='country_code',
            field=models.CharField(default='AR', max_length=2),
        ),
    ]