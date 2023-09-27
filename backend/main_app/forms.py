from django import forms
from .models import FileUpload

class FileUploadForm(forms.ModelForm):
    class Meta:
        model = FileUpload
        fields = ['file_name', 'images']
        
    # Add a FileInput widget with 'multiple' attribute for multiple file selection
    images = forms.FileField(widget=forms.ClearableFileInput(attrs={'multiple': True}))
