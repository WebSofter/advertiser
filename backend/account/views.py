from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.generics import ListCreateAPIView,RetrieveUpdateDestroyAPIView
from rest_framework.permissions import IsAuthenticated
from .models import Account
from django.contrib.auth.models import User
from .permissions import IsOwnerProfileOrReadOnly
from .serializers import AccountSerializer
from rest_framework.filters import OrderingFilter, SearchFilter
from django_filters.rest_framework import DjangoFilterBackend, FilterSet
from django_filters import CharFilter, ModelMultipleChoiceFilter
from rest_framework.parsers import FileUploadParser, MultiPartParser, FormParser
from rest_framework import serializers #HyperlinkedModelSerializer
from django.db.models import Q, ImageField
from rest_framework.response import Response
from rest_framework import status
'''
class AccountFilter(FilterSet):
    first_name = CharFilter(field_name="first_name", lookup_expr='icontains',)
    second_name = CharFilter(field_name="second_name", lookup_expr='icontains',)
    class Meta:
        model = Account
        fields = {'first_name' : ['icontains'], 'second_name' : ['icontains'] }
'''

class AccountListView(ListCreateAPIView): #(ListCreateAPIView):
    queryset=Account.objects.all().order_by('id').reverse()
    serializer_class=AccountSerializer
    #permission_classes=[IsAuthenticated]
    filter_backends = (SearchFilter, OrderingFilter, DjangoFilterBackend)
    parser_classes = (FileUploadParser, FormParser, MultiPartParser)

    def perform_create(self, serializer):
        user=self.request.user
        serializer.save(user=user)

    ordering_fields = '__all__'
    search_fields = '__all__' #('user', 'first_name', 'second_name')

class AccountDetailView(RetrieveUpdateDestroyAPIView):
    queryset=Account.objects.all()
    serializer_class=AccountSerializer
    #permission_classes=[IsOwnerProfileOrReadOnly,IsAuthenticated]
    filter_backends = (SearchFilter, OrderingFilter, DjangoFilterBackend)
    parser_classes = [FileUploadParser, FormParser, MultiPartParser] #(FileUploadParser, FormParser, MultiPartParser)
    '''
        #parser_classes = (FileUploadParser,)
        def put(self, request, filename, format=None):
            file_obj = request.FILES['file']
            print("FILE############", file_obj)
            # do some stuff with uploaded file
            #return Response(status=204)
    '''
    '''
    def put(self, request, *args, **kwargs):
            serializer = AccountSerializer(data=request.data)
            file_obj = request.FILES
            print("FILE############", request)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    '''
    def put(self, request, *args, **kwargs):
            serializer = AccountSerializer(data=request.data)
            file_obj = request.FILES
            print("FILE############", request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def perform_create(self, serializer):
        print('CREATE METHOD...', self.request.user.first_name)