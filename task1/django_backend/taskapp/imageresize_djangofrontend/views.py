from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render,redirect,get_object_or_404
from django.contrib.auth import login,logout,authenticate
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from django.urls import reverse
from PIL import Image
import os
from .models import ImageRecord

def user_login(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('upload')
    else:
        form = AuthenticationForm()
    
    return render(request, 'login.html', {'form': form})
def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        print("NOt valid")
        if form.is_valid():
            user = form.save()
            login(request, user)
            print("here")
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'register.html', {'form': form})


def user_logout(request):
    logout(request)
    return redirect('login')

@login_required(login_url='login')
def upload(request):
    if request.method == 'POST':
        uploaded_file = request.FILES['image']
        file_name = default_storage.save(uploaded_file.name, ContentFile(uploaded_file.read()))
        file_path = default_storage.path(file_name)

        resized_small_path = None
        resized_medium_path = None

        with Image.open(file_path) as img:
            small_img = img.resize((100, 100))
            resized_small_path = os.path.join('resized_small_' + file_name)
            small_img.save(default_storage.path(resized_small_path))

        with Image.open(file_path) as img:
            medium_img = img.resize((300, 300))
            resized_medium_path = os.path.join('resized_medium_' + file_name)
            medium_img.save(default_storage.path(resized_medium_path))

        image_record = ImageRecord.objects.create(
            original_image=file_path,
            resized_small_image=resized_small_path,
            resized_medium_image=resized_medium_path,
        )
            
        return redirect(reverse('get_images', kwargs={'image_id': image_record.id}))

    return render(request, 'upload.html')

def get_images(request, image_id):
    image_record = get_object_or_404(ImageRecord, id=image_id)
    return render(request, 'downloads.html', {'original': default_storage.url(image_record.original_image),
        'resized_small': default_storage.url(image_record.resized_small_image),
        'resized_medium': default_storage.url(image_record.resized_medium_image),})


