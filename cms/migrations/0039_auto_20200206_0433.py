# Generated by Django 2.2.9 on 2020-02-06 04:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0038_auto_20200206_0430'),
    ]

    operations = [
        migrations.AlterField(
            model_name='service',
            name='affiliate',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='services', to='cms.Affiliate'),
        ),
    ]
