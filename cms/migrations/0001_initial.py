# Generated by Django 2.2.1 on 2019-08-28 19:45

import cms.models.fields
from django.db import migrations, models
import django.db.models.deletion
import django_extensions.db.fields
import modelcluster.fields
import wagtail.contrib.routable_page.models
import wagtail.core.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('wagtailcore', '0041_group_collection_permissions_verbose_name_plural'),
        ('wagtailimages', '0001_squashed_0021'),
    ]

    operations = [
        migrations.CreateModel(
            name='AccountCurrency',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=10)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='AccountOption',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='AccountType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Affiliate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(choices=[('out', 'out'), ('visit', 'visit'), ('go', 'go')], default='go', max_length=10)),
                ('cloakedLink', models.URLField(max_length=500)),
                ('slug', models.CharField(max_length=200, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Attribute',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('slug', django_extensions.db.fields.AutoSlugField(blank=True, editable=False, populate_from='name')),
                ('section', models.IntegerField(choices=[(1, 'General Information'), (2, 'Account Options'), (3, 'Customer Service'), (4, 'Trading'), (5, 'Account'), (6, 'General information about IC Markets')], default=1)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='AttributeService',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sort_order', models.IntegerField(blank=True, editable=False, null=True)),
                ('attribute', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Attribute')),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='BrokerType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('description', models.CharField(max_length=500)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('slug', django_extensions.db.fields.AutoSlugField(blank=True, editable=False, populate_from='name')),
                ('attributes', models.ManyToManyField(blank=True, to='cms.Attribute')),
            ],
        ),
        migrations.CreateModel(
            name='Chat',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='HomePage',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('body', wagtail.core.fields.RichTextField(blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(wagtail.contrib.routable_page.models.RoutablePageMixin, 'wagtailcore.page'),
        ),
        migrations.CreateModel(
            name='License',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Location',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('code', models.CharField(max_length=4)),
                ('continent', models.CharField(max_length=30)),
                ('capital', models.CharField(max_length=50)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Methodology',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='PaymentMethod',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='PlatformSupported',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='PricingModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Regulation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=30)),
                ('description', models.CharField(max_length=500)),
                ('link', models.URLField()),
                ('location', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cms.Location')),
            ],
            options={
                'abstract': False,
            },
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='RevenueModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Service',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('premium', models.BooleanField(default=False)),
                ('slug', django_extensions.db.fields.AutoSlugField(blank=True, editable=False, populate_from='name')),
                ('founded', models.IntegerField(blank=True, null=True)),
                ('accept_us_clients', models.BooleanField(default=True)),
                ('accept_eu_clients', models.BooleanField(default=True)),
                ('ea_robots', models.BooleanField(default=True)),
                ('scalping', models.BooleanField(default=True)),
                ('hedging', models.BooleanField(default=True)),
                ('email', models.EmailField(blank=True, default=None, max_length=254, null=True)),
                ('phone', models.CharField(blank=True, default=None, max_length=500, null=True)),
                ('office_address', models.CharField(blank=True, default=None, max_length=500, null=True)),
                ('instructor', models.CharField(blank=True, default=None, max_length=500, null=True)),
                ('frequency', models.CharField(blank=True, default=None, max_length=500, null=True)),
                ('minimum_deposit', models.CharField(blank=True, max_length=20)),
                ('commission', models.CharField(blank=True, max_length=20)),
                ('leverage', models.CharField(blank=True, max_length=20)),
                ('spread', models.CharField(blank=True, max_length=20)),
                ('swap_free', models.BooleanField(default=True)),
                ('islamic_accounts', models.BooleanField(default=True)),
                ('bonus_policy', models.BooleanField(default=True)),
                ('about', wagtail.core.fields.RichTextField(blank=True, default=None, max_length=2500, null=True)),
                ('account_currency', modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.AccountCurrency')),
                ('account_options', modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.AccountOption')),
                ('account_types', modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.AccountType')),
                ('affiliate', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Affiliate')),
                ('attributes', models.ManyToManyField(blank=True, to='cms.Attribute')),
                ('broker_type', modelcluster.fields.ParentalManyToManyField(blank=True, related_name='broker_type', to='cms.BrokerType')),
                ('category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Category')),
                ('chat', modelcluster.fields.ParentalManyToManyField(blank=True, default=None, to='cms.Chat')),
                ('international_offices', modelcluster.fields.ParentalManyToManyField(blank=True, related_name='international_offices', to='cms.Location')),
                ('license', modelcluster.fields.ParentalManyToManyField(blank=True, related_name='license', to='cms.License')),
                ('location', modelcluster.fields.ParentalManyToManyField(blank=True, related_name='location', to='cms.Location')),
                ('logo', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='wagtailimages.Image')),
                ('methodology', modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.Methodology')),
                ('payment_method', modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.PaymentMethod')),
                ('platforms_supported', modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.PlatformSupported')),
                ('preview', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='wagtailimages.Image')),
                ('pricing_model', modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.PricingModel')),
                ('regulation', modelcluster.fields.ParentalManyToManyField(blank=True, related_name='regulation', to='cms.Regulation')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ServicePage',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('body', wagtail.core.fields.RichTextField(blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
        migrations.CreateModel(
            name='SignalAlert',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='SupportedLanguage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='SystemType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Timezone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
            ],
            options={
                'abstract': False,
            },
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='TradingInstrument',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='TradingSoftware',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='TradingType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='TrainingCourse',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='TrainingTool',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='TrainingType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            bases=(cms.models.fields.AbstractField, models.Model),
        ),
        migrations.CreateModel(
            name='Voucher',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(max_length=100)),
                ('name', models.CharField(max_length=100)),
                ('description', wagtail.core.fields.RichTextField(blank=True, default=None, max_length=2500, null=True)),
                ('slug', django_extensions.db.fields.AutoSlugField(blank=True, editable=False, populate_from='name')),
                ('affiliate', models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Affiliate')),
                ('service', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Service')),
            ],
        ),
        migrations.AddField(
            model_name='service',
            name='required_software',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, related_name='required_software', to='cms.TradingSoftware'),
        ),
        migrations.AddField(
            model_name='service',
            name='revenue_model',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.RevenueModel'),
        ),
        migrations.AddField(
            model_name='service',
            name='signal_alerts',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.SignalAlert'),
        ),
        migrations.AddField(
            model_name='service',
            name='status',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Status'),
        ),
        migrations.AddField(
            model_name='service',
            name='support_languages',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, default=None, to='cms.SupportedLanguage'),
        ),
        migrations.AddField(
            model_name='service',
            name='system_type',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.SystemType'),
        ),
        migrations.AddField(
            model_name='service',
            name='timezone',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Timezone'),
        ),
        migrations.AddField(
            model_name='service',
            name='trading_instruments',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TradingInstrument'),
        ),
        migrations.AddField(
            model_name='service',
            name='trading_software',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TradingSoftware'),
        ),
        migrations.AddField(
            model_name='service',
            name='trading_type',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TradingType'),
        ),
        migrations.AddField(
            model_name='service',
            name='training_courses',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TrainingCourse'),
        ),
        migrations.AddField(
            model_name='service',
            name='training_tools',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TrainingTool'),
        ),
        migrations.AddField(
            model_name='service',
            name='training_type',
            field=modelcluster.fields.ParentalManyToManyField(blank=True, to='cms.TrainingType'),
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('body', wagtail.core.fields.RichTextField(max_length=500)),
                ('slug', django_extensions.db.fields.AutoSlugField(blank=True, editable=False, populate_from='name')),
                ('affiliate', models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Affiliate')),
                ('service', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Service')),
            ],
        ),
        migrations.CreateModel(
            name='Option',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('slug', django_extensions.db.fields.AutoSlugField(blank=True, editable=False, populate_from='name')),
                ('attribute', modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, related_name='options', to='cms.Attribute')),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stars', models.IntegerField(blank=True, choices=[(1, 1), (2, 2), (3, 3), (4, 4), (5, 5)], null=True)),
                ('name', models.CharField(max_length=100)),
                ('country', models.CharField(max_length=100)),
                ('review', models.CharField(max_length=500)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('ip', models.CharField(max_length=20, null=True)),
                ('active', models.BooleanField(default=False)),
                ('country_code', models.CharField(max_length=2)),
                ('parent_comment', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Comment')),
                ('service', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Service')),
            ],
        ),
        migrations.CreateModel(
            name='AttributeServiceValue',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sort_order', models.IntegerField(blank=True, editable=False, null=True)),
                ('value', models.CharField(blank=True, max_length=50)),
                ('attributeService', modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, related_name='attSerVal', to='cms.AttributeService')),
                ('option', models.ForeignKey(blank=True, default='', null=True, on_delete=django.db.models.deletion.SET_NULL, to='cms.Option')),
            ],
            options={
                'ordering': ['sort_order'],
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='attributeservice',
            name='service',
            field=modelcluster.fields.ParentalKey(on_delete=django.db.models.deletion.CASCADE, related_name='attSer', to='cms.Service'),
        ),
        migrations.AddField(
            model_name='attribute',
            name='categories',
            field=models.ManyToManyField(blank=True, to='cms.Category'),
        ),
        migrations.AddField(
            model_name='attribute',
            name='services',
            field=models.ManyToManyField(blank=True, to='cms.Service'),
        ),
    ]
