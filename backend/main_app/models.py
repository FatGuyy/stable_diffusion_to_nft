import uuid
from django.db import models
from django.contrib.auth import get_user_model
User = get_user_model()


class Profile(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    id_user = models.IntegerField()

    def __str__(self): # Gets called when object type expected for the output is str
        return str(self.user)


# Models and Function for Image Upload
def dynamic_upload_path(instance, filename):
    return f'uploads/{instance.file_name}/{filename}'

class Image(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    file = models.ImageField(upload_to=dynamic_upload_path)

class FileUpload(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    file_name = models.ForeignKey(Profile, on_delete=models.CASCADE)
    images = models.ManyToManyField(Image)

    def __str__(self):
        return str(self.file_name)
