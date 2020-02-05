# Generated by Django 2.2.9 on 2020-01-27 23:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailtrans', '0009_create_initial_language'),
        ('cms', '0032_merge_20200127_2149'),
    ]

    operations = [
        migrations.RunSQL(
            """
            BEGIN;
    
           ALTER TABLE cms_homepage ADD COLUMN translatablepage_ptr_id INTEGER;
           UPDATE cms_homepage SET translatablepage_ptr_id=page_ptr_id;
           INSERT INTO wagtailtrans_translatablepage (translatable_page_ptr_id, canonical_page_id, language_id) SELECT translatablepage_ptr_id, NULL, 1 FROM cms_homepage;
            ALTER TABLE cms_homepage ADD CONSTRAINT cms_translatablepage_ptr_id_fk_wagtailtrans_translatable_page_id FOREIGN KEY (translatablepage_ptr_id) REFERENCES wagtailtrans_translatablepage (translatable_page_ptr_id);
            ALTER TABLE cms_homepage MODIFY translatablepage_ptr_id INTEGER UNIQUE NOT NULL;
            alter table cms_homepage drop foreign key cms_homepage_page_ptr_id_3967ea6a_fk_wagtailcore_page_id;
           ALTER TABLE cms_homepage DROP PRIMARY KEY;
    
            COMMIT;
            """,
        state_operations = [
        migrations.AddField(
            model_name='homepage',
            name='translatablepage_ptr',
            field=models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wagtailtrans.TranslatablePage'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='homepage',
            name='page_ptr',
            field=models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, to='wagtailcore.Page'),
        ),
        ])
    ]