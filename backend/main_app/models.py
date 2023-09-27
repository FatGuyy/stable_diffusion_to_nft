import uuid
from django.db import models

# Create your models here.
def dynamic_upload_path(instance, filename):
    return f'uploads/{instance.file_name}/{filename}'

# Create your models here.
class FileUpload(models.Model):
    id = models.UUIDField(primary_key=True, default= uuid.uuid4)
    file_name = models.TextField()
    # uploader_name = models.TextField()
    file = models.ImageField(upload_to=dynamic_upload_path)

    def __str__(self) -> str:
        return str(self.file_name)
