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
def dynamic_upload_path(instance, image):
    return f'uploads/{instance.image}/{image}'

class Image(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    file = models.ImageField(upload_to=dynamic_upload_path)

class FileUpload(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    user_name = models.CharField(max_length=100, default='', editable=False)
    images = models.ManyToManyField(Image)

    def __str__(self):
        return str(self.user_name)

    def save(self, *args, **kwargs):
        if self.user_name == '':
            self.user_name = User.objects.get(username=self.user_name).username
        super().save(*args, **kwargs)

class ImageFile(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    image = models.ImageField(upload_to=dynamic_upload_path)
