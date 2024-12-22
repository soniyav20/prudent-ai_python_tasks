from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404
from PIL import Image
from io import BytesIO
from django.core.files.base import ContentFile
from .models import UploadedImage
from .serializers import UploadedImageSerializer

# Upload image view for use with Flutter frontend
@api_view(['POST'])
def upload_image(request):
    if not request.user.is_authenticated:
        return Response({"error": "Authentication required"}, status=401)

    image = request.FILES.get('image')
    if not image:
        return Response({"error": "No image uploaded"}, status=400)
    
    uploaded_image = UploadedImage.objects.create(user=request.user, original=image)

    resize_image(uploaded_image, 100, 'small')
    resize_image(uploaded_image, 300, 'medium')

    uploaded_image.save()
    return Response({'id': uploaded_image.id}, status=201)

# Function to handle image resizing
def resize_image(instance, height, size_field):
    img = Image.open(instance.original)
    aspect_ratio = img.width / img.height
    width = int(height * aspect_ratio)
    img = img.resize((width, height))
    
    buffer = BytesIO()
    img.save(buffer, format='JPEG')
    resized_image = ContentFile(buffer.getvalue(), name=f'{size_field}_{instance.original.name}')
    setattr(instance, size_field, resized_image)

# Get image details view
@api_view(['GET'])
def image_detail(request, id):
    if not request.user.is_authenticated:
        return Response({"error": "Authentication required"}, status=401)

    image_instance = get_object_or_404(UploadedImage, id=id, user=request.user)
    serializer = UploadedImageSerializer(image_instance)
    return Response(serializer.data)
