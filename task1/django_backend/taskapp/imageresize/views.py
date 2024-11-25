from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404, render
from PIL import Image
from io import BytesIO
from django.core.files.base import ContentFile
from django.contrib.auth.decorators import login_required
from .models import UploadedImage
from .serializers import UploadedImageSerializer

#for using with flutter frontend
class UploadImageView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        image = request.FILES.get('image')
        if not image:
            return Response({"error": "No image uploaded"}, status=400)
        
        uploaded_image = UploadedImage.objects.create(user=request.user, original=image)

        self.resize_image(uploaded_image, 100, 'small')
        self.resize_image(uploaded_image, 300, 'medium')

        uploaded_image.save()
        return Response({'id': uploaded_image.id}, status=201)

    def resize_image(self, instance, height, size_field):
        img = Image.open(instance.original)
        aspect_ratio = img.width / img.height
        width = int(height * aspect_ratio)
        img = img.resize((width, height))
        
        buffer = BytesIO()
        img.save(buffer, format='JPEG')
        resized_image = ContentFile(buffer.getvalue(), name=f'{size_field}_{instance.original.name}')
        setattr(instance, size_field, resized_image)

class ImageDetailView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, id):
        image_instance = get_object_or_404(UploadedImage, id=id, user=request.user)
        serializer = UploadedImageSerializer(image_instance)
        return Response(serializer.data)
