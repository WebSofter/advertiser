from .models import Company
from rest_framework.filters import SearchFilter, OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend, FilterSet
from rest_framework import viewsets, permissions
from .serializers import CompanySerializer

class CompanyViewSet(viewsets.ModelViewSet):
    queryset = Company.objects.all().order_by('id').reverse()
    permission_classes = [ permissions.AllowAny ]
    # permission_classes = (IsAuthenticated,)
    serializer_class = CompanySerializer
    
    filter_backends = (SearchFilter, OrderingFilter, DjangoFilterBackend)
    ordering_fields = ('user',)
    filter_fields = ('user',)
    #search_fields = ['user']
