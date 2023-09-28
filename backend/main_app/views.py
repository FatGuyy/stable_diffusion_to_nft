import os
import subprocess
from .models import Profile
from dotenv import load_dotenv
from .forms import ImageFileForm
from django.contrib import messages
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout

# Run Command in terminal
load_dotenv()
RPC_URL = os.getenv('RPC_URL')
PRIVATE_KEY = os.getenv('PRIVATE_KEY')
COMMAND = f"forge script script/basicNFT.s.sol --rpc-url {RPC_URL} --broadcast --private-key {PRIVATE_KEY}"
PROJECT_DIRECTORY = os.path.dirname(os.getcwd())


@csrf_protect
@login_required(login_url='/signin/')
def index(request):
    if request.method == 'POST':
        form = ImageFileForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            subprocess.run(COMMAND, shell=True, cwd=PROJECT_DIRECTORY)
            print("project dir -",PROJECT_DIRECTORY)
    else:
        form = ImageFileForm()
    return render(request, 'index.html', {'form': form})

def signup(request):
    if request.method == 'POST':
        username =  request.POST['username']
        email =  request.POST['email']
        password =  request.POST['password']
        password2 =  request.POST['password2']
        if password == password2:
            if User.objects.filter(email=email).exists():
                messages.info(request,"Email already registered.")
                return redirect("/signup")
            elif User.objects.filter(username=username).exists():
                messages.info(request, 'username taken')
                return redirect('/signup')
            else:
                # Save user and Profile and redirect to settings page
                user = User.objects.create_user(username=username, email=email, password=password) # type: ignore
                user.save() # Save user as user
                new_profile = Profile.objects.create(user=user, id_user=user.id) # type: ignore
                new_profile.save() # Save User as profile

                login(request, user)
                messages.info(request, 'You are not logged in!')
                return redirect('/signin/')
        else:
            messages.info(request, 'Password not matching')

        return redirect("/signup")
    else:
        return render(request, "signup.html")

@csrf_protect
def signin(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        if User.objects.filter(username=username).exists():
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('home')
            else: # incorrect password
                messages.info(request, 'Incorrect password')
                return redirect('signin')
        else:
            messages.info(request, 'Incorrect Username')
            return redirect('signin')
    else:
        return render(request, "signin.html")
