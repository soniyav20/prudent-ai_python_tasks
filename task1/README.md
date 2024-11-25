
<br>
<br>

# To Run in Web

cd django_backend/

cd taskapp

pip install -r requirements.txt

python manage.py makemigrations

python manage.py migrate

python manage.py runserver

<br>

To access Admin Site

http://127.0.0.1:8000/admin/

<br>


To Login

http://127.0.0.1:8000/api/v1/login/

<br>


To Register

http://127.0.0.1:8000/api/v1/register/

<br>


To Upload Image

http://127.0.0.1:8000/api/v1/image/

<br>


Once Image Uploaded, it will take to this page where you can download the resized images

http://127.0.0.1:8000/api/v1/<image_id>/

<br>


All the images can be found inside the media folder 

<br>
<br>


# To Run with Flutter frontend and Django Rest Backend


cd django_backend/

cd taskapp

pip install -r requirements.txt

python manage.py makemigrations

python manage.py migrate

python manage.py runserver

This starts the server

<br>
<br>


Now for flutter
from task1 folder

cd flutter_frontend

cd imageresizer_flutter

flutter pub get

flutter run

<br>
<br>

Tokens were used for auth in app

<br>

To upload

http://IP_OF_NETWORK:8000/api/v2/

<br>


To get images

http://IP_OF_NETWORK:8000/api/v2/<image_id>

<br>


For auth

http://IP_OF_NETWORK:8000/api/token/

<br>


Make sure that the system you are running the backend on and the mobile phone is both connected to same network and get the Ip of tha network and update it in the urls in auth_service and api_service files in project/lib folder

<br>
<br>


All the images can be found inside the media folder and organized into subfolders for original , small and medium







