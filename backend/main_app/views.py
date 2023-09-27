from .forms import ImageUploadForm
from django.shortcuts import render
# from django.contrib import messages
from django.views.decorators.csrf import csrf_protect


# Create your views here.
@csrf_protect
def index(request):
    if request.method == 'POST':
        form = ImageUploadForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            # messages.info(request, 'Got the video!')
        else:
            pass
    else:
        form = ImageUploadForm()
    return render(request, 'index.html', {'form': form})
