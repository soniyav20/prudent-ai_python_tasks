# Generated by Django 5.1.3 on 2024-11-24 09:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('imageresize', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='resizableimage',
            name='resized_image',
        ),
        migrations.AddField(
            model_name='resizableimage',
            name='medium',
            field=models.ImageField(blank=True, null=True, upload_to='resized_medium/'),
        ),
        migrations.AddField(
            model_name='resizableimage',
            name='small',
            field=models.ImageField(blank=True, null=True, upload_to='resized_small/'),
        ),
    ]