from django.contrib.postgres.fields import ArrayField
from django.db import models
from datetime import datetime, timedelta
from django.contrib.auth.models import User

def user_directory_path(instance, filename): 
    # file will be uploaded to MEDIA_ROOT / user_<id>/<filename> 
    return 'user_{0}/{1}'.format(instance.company.id, filename)

# Create your models here.
class Company(models.Model):
    name = models.CharField(max_length=40, blank=True)
    user =  models.ForeignKey(User, verbose_name='User', on_delete=models.CASCADE) #models.IntegerField(blank=True)
    members = ArrayField(models.IntegerField(blank=True), blank=True)
    date_created= models.DateTimeField(auto_now=True)
    description = models.TextField(blank=True)
    # ready = models.CharField(max_length=10, blank=True)
    STATUSES = (
        (1, 'Public'),
        (2, 'Private'),
        (3, 'Protected'),
    )
    status = models.IntegerField(verbose_name='Status', choices=STATUSES)
    THEMES = (
        (1, 'Finance'),
        (2, 'IT'),
        (3, 'Develop'),
        (4, 'Building'),
    )
    theme = models.IntegerField(verbose_name='Theme', choices=THEMES)
    # icon = models.ImageField(upload_to = user_directory_path, blank=True)

    def __str__(self):
        return self.name
