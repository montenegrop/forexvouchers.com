# Generated by Django 2.2.10 on 2020-05-11 05:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0051_language'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='language',
            name='slug',
        ),
        migrations.AddField(
            model_name='language',
            name='language_code',
            field=models.CharField(max_length=2, null=True),
        ),
    ]
