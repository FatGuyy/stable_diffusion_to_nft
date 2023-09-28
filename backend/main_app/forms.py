from django import forms
from .models import FileUpload, ImageFile

class FileUploadForm(forms.ModelForm):
    class Meta:
        model = FileUpload
        fields = ['images']
        
    # Add a FileInput widget with 'multiple' attribute for multiple file selection
    images = forms.FileField(widget=forms.ClearableFileInput(attrs={'multiple': True}))

class ImageFileForm(forms.ModelForm):
    class Meta:
        model = ImageFile
        fields = ['image']
