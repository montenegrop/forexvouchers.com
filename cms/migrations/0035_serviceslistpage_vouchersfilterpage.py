# Generated by Django 2.2.9 on 2020-01-28 05:28

from django.db import migrations, models
import django.db.models.deletion
import wagtail.contrib.routable_page.models
import wagtail.core.fields
import wagtailschemaorg.models


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0041_group_collection_permissions_verbose_name_plural'),
        ('cms', '0034_comparepage_forexpage_staticpage_voucherpage'),
    ]

    operations = [
        migrations.CreateModel(
            name='ServicesListPage',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('body', wagtail.core.fields.RichTextField(blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(wagtail.contrib.routable_page.models.RoutablePageMixin, wagtailschemaorg.models.PageLDMixin, 'wagtailcore.page'),
        ),
        migrations.CreateModel(
            name='VouchersFilterPage',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailcore.Page')),
                ('body', wagtail.core.fields.RichTextField(blank=True)),
            ],
            options={
                'abstract': False,
            },
            bases=(wagtail.contrib.routable_page.models.RoutablePageMixin, wagtailschemaorg.models.PageLDMixin, 'wagtailcore.page'),
        ),
    ]
