from .models import Task, Note, Link
from rest_framework import viewsets, permissions, generics, mixins
from .serializers import TaskSerializer, TaskTemplateSerializer, NoteSerializer, LinkSerializer
#from rest_framework.pagination import PageNumberPagination
#from rest_framework.generics import ListAPIView
from rest_framework.filters import SearchFilter, OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend, FilterSet
from django_filters import CharFilter
from .service import TaskFilter, NoteFilter


#from rest_framework import OrderingFilter
from django.db.models.functions import Lower

class LinkFilter(FilterSet):
    title = CharFilter(lookup_expr="icontains" )
    class Meta:
        model = Link
        fields = '__all__'
class LinkViewSet(viewsets.ModelViewSet):
    queryset = Link.objects.all()
    permission_classes = [
        permissions.AllowAny
    ]
    serializer_class = LinkSerializer
    filterset_class = LinkFilter
    filter_backends = [SearchFilter, OrderingFilter, DjangoFilterBackend] #(SearchFilter, OrderingFilter, DjangoFilterBackend)
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    filter_fields = ['title'] #'__all__'
    search_fields = '__all__'

class TaskViewSet(viewsets.ModelViewSet):
    queryset = Task.objects.all().order_by('-date_start')
    permission_classes = [
        permissions.AllowAny
    ]
    serializer_class = TaskSerializer
    #filterset_class = TaskFilter

    filter_backends = (SearchFilter, OrderingFilter, DjangoFilterBackend)
    ordering_fields = ('company',)
    filter_fields = ('company',)
    search_fields = ['company']

class TaskTemplateViewSet(viewsets.ModelViewSet):
    #queryset = Task.objects.all()
    
    def get_queryset(self):
        #group = self.kwargs["uuid"]
        return Task.objects.filter(company = None)
    
    permission_classes = [
        permissions.AllowAny
    ]
    serializer_class = TaskTemplateSerializer
    filterset_class = TaskFilter

    filter_backends = (SearchFilter, OrderingFilter, DjangoFilterBackend)
    ordering_fields = '__all__'
    filter_fields = '__all__'
    search_fields = ['company']

class NoteViewSet(viewsets.ModelViewSet):
    queryset = Note.objects.all().order_by('date_created') #.order_by('id').reverse()

    permission_classes = [
        permissions.AllowAny
    ]
    '''
    def get_queryset(self):
        queryset = self.queryset
        ordering = self.request.query_params.get('ordering', None)
        if ordering is not None:
            from django.db.models.functions import Lower
            if ordering.startswith('-'):
                queryset = queryset.order_by(Lower(ordering[1:])).reverse()
            else:
                queryset = queryset.order_by(Lower(ordering))
    '''
    serializer_class = NoteSerializer
    #filterset_class = NoteFilter

    filter_backends = (SearchFilter, OrderingFilter, DjangoFilterBackend)
    ordering_fields = ('task', 'user')
    filter_fields = ('task', 'user')
    search_fields = ['task', 'user']
    #pagination_class = PageNumberPagination