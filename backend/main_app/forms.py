from django import forms
from .models import FileUpload

class ImageUploadForm(forms.ModelForm):
    class Meta:
        model = FileUpload
        fields = ['file_name', 'file']
