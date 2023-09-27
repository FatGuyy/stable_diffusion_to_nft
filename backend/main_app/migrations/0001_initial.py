# Generated by Django 4.0.10 on 2023-09-27 05:44

from django.db import migrations, models
import main_app.models
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='FileUpload',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, primary_key=True, serialize=False)),
                ('file_name', models.TextField()),
                ('file', models.ImageField(upload_to=main_app.models.dynamic_upload_path)),
            ],
        ),
    ]
