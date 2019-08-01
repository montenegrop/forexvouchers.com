# Generated by Django 2.2.3 on 2019-07-30 22:59

from django.db import migrations, models
import django.db.models.deletion
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('cms', '0010_auto_20190730_2151'),
    ]

    operations = [
        migrations.AddField(
            model_name='service',
            name='instructor',
            field=models.CharField(blank=True, default=None, max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='service',
            name='methodology',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.Methodology'),
        ),
        migrations.AddField(
            model_name='service',
            name='pricing_model',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.PricingModel'),
        ),
        migrations.AddField(
            model_name='service',
            name='training_courses',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TrainingCourse'),
        ),
        migrations.AddField(
            model_name='service',
            name='training_tools',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TrainingTools'),
        ),
        migrations.AddField(
            model_name='service',
            name='training_type',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TrainingType'),
        ),
        migrations.AlterField(
            model_name='service',
            name='chat',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, default=None, null=True, to='cms.Chat'),
        ),
        migrations.AlterField(
            model_name='service',
            name='countries',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, related_name='countries', to='cms.Country'),
        ),
        migrations.AlterField(
            model_name='service',
            name='founded',
            field=models.IntegerField(blank=True, default=1),
        ),
        migrations.AlterField(
            model_name='service',
            name='international_offices',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, related_name='offices', to='cms.Country'),
        ),
        migrations.AlterField(
            model_name='service',
            name='platforms_supported',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.PlatformsSupported'),
        ),
        migrations.AlterField(
            model_name='service',
            name='status',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='cms.Status'),
        ),
        migrations.AlterField(
            model_name='service',
            name='support_languages',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, default=None, null=True, to='cms.Language'),
        ),
        migrations.AlterField(
            model_name='service',
            name='timezone',
            field=modelcluster.fields.ParentalKey(blank=True, default=600, null=True, on_delete=django.db.models.deletion.CASCADE, to='cms.Timezone'),
        ),
        migrations.AlterField(
            model_name='service',
            name='trading_software',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TradingSoftware'),
        ),
    ]