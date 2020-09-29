from .models import File
from rest_framework.filters import SearchFilter, OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend, FilterSet
from rest_framework import viewsets, permissions
from .serializers import FileSerializer

class FileViewSet(viewsets.ModelViewSet):
    queryset = File.objects.all()
    permission_classes = [ permissions.AllowAny ]
    # permission_classes = (IsAuthenticated,)
    serializer_class = FileSerializer
    
    filter_backends = (SearchFilter, OrderingFilter, DjangoFilterBackend)
    #ordering_fields = ('file',)
    #filter_fields = ('file',)
    #search_fields = ['user']