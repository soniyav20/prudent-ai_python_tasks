from django.db import models

class ImageRecord(models.Model):
    id = models.AutoField(primary_key=True)
    original_image = models.CharField(max_length=255)
    resized_small_image = models.CharField(max_length=255, null=True, blank=True)
    resized_medium_image = models.CharField(max_length=255, null=True, blank=True)
