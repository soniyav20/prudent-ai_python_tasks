from . import views
from django.urls import path
from .views import UploadImageView, ImageDetailView

urlpatterns = [
    path('image/', UploadImageView.as_view(), name='upload_image'),
    path('image/<int:id>/', ImageDetailView.as_view(), name='image_detail'),
]