from django.db import models
from django.conf import settings

class UploadedImage(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    original = models.ImageField(upload_to='images/original/')
    small = models.ImageField(upload_to='images/small/', blank=True, null=True)
    medium = models.ImageField(upload_to='images/medium/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Image {self.id} by {self.user.username}"