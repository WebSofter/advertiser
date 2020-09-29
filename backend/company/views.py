from django.shortcuts import render
from django.db import models
from rest_framework import generics
from django_filters.rest_framework import DjangoFilterBackend
from .models import Company, User
from .serializers import CompanyListSerializer 
# Create your views here.

    
