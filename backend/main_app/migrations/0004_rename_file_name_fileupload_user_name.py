# Generated by Django 4.0.10 on 2023-09-28 09:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0003_alter_fileupload_file_name'),
    ]

    operations = [
        migrations.RenameField(
            model_name='fileupload',
            old_name='file_name',
            new_name='user_name',
        ),
    ]
