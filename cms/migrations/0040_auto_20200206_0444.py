# Generated by Django 2.2.9 on 2020-02-06 04:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0039_auto_20200206_0433'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='affiliate',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='products', to='cms.Affiliate'),
        ),
        migrations.AlterField(
            model_name='voucher',
            name='affiliate',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='vouchers', to='cms.Affiliate'),
        ),
    ]
