from django.db import models
from django.contrib.auth.models import User
from upload.utils import FileUtils
# Create your models here.

def user_directory_path(instance, fileName): 
    print(fileName)
    fileName = FileUtils.getTranslitedName(fileName)
    return 'user/{0}/{1}'.format(instance.user.username, fileName) 

class Account(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE, related_name="profile")
    about=models.TextField(blank=True)
    updated_on=models.DateTimeField(auto_now=True)
    user_pic = models.ImageField(upload_to=user_directory_path, default='user_pic_male.png', blank=True)
    phone = models.CharField(max_length=15, blank=True)

    STATUSES = (
        (0, 'Blocked'),
        (1, 'Active'),
        (2, 'Limited'),
    )
    status = models.IntegerField(choices=STATUSES, default=1, blank=False)

    GENDERS = (
        (1, 'Male'),
        (2, 'Female'),
    )
    gender = models.IntegerField(verbose_name='Gender', choices=GENDERS, default=1, blank=False)

    ROLES = (
        ('admin', 'Admin'),
        ('user', 'User'),
    )
    role = models.CharField(max_length=10, verbose_name='Role', choices=ROLES, default='user', blank=False)
    def __str__(self):
        return self.user.username
    