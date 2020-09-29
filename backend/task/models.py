from django.contrib.postgres.fields import ArrayField
from django.db import models
from django.contrib.auth.models import User
from datetime import datetime, timedelta
from company.models import Company
# Create your models here.

class Link(models.Model):
    link = models.URLField(max_length = 200)
    title = models.CharField(max_length=100, blank=False)
    date  = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.title

class Task(models.Model):

    company = models.ForeignKey(Company, verbose_name='Company', on_delete=models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=120, blank=False)
    links = models.ManyToManyField(Link, blank=True)
    # worker = models.ForeignKey(User, verbose_name='User', on_delete=models.CASCADE)
    description = models.TextField(blank=True)
    STATUSES = (
        (1, 'Active'),
        (2, 'Freeze'),
        (3, 'Finish'),
    )
    auto_join = models.BooleanField(default=False)
    status = models.IntegerField(verbose_name='Status', choices=STATUSES, default=1)
    date_start = models.DateTimeField(auto_now=True)
    date_end = models.DateTimeField(auto_now=True)#models.DateTimeField(default=datetime.now()+timedelta(days=7))
    date_created= models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Note(models.Model):
    task = models.ForeignKey(Task, verbose_name='tasks', related_name='notes', on_delete=models.CASCADE, blank=True)
    title = models.CharField(max_length=120, blank=True)
    files = ArrayField(models.IntegerField(blank=True), blank=True)
    user = models.ForeignKey(User, verbose_name='users', on_delete=models.CASCADE, blank=False, default=None)

    description = models.TextField(blank=True)
    STATUSES = (
        (1, 'Active'),
        (2, 'Freeze'),
        (3, 'Finish'),
    )
    status = models.IntegerField(verbose_name='Status', choices=STATUSES, default=1)
    date_start = models.DateTimeField(auto_now=True)
    date_end = models.DateTimeField(default=datetime.now()+timedelta(days=7))
    date_created= models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.title
'''
company_id - связанная компания
user_executors_id - ID исполнителей
description - описание задачи
status - статус исполнения
date_start - время начала
date_end - время окончания

'''
