#import django_filters
import django_filters.rest_framework as filters
from .models import Company, Task, Note

class TaskFilter(filters.FilterSet):
    name = filters.CharFilter(lookup_expr='icontains') #lookup_expr = in iexact icontains
    company = Company.objects.filter() #userid__userid__gt=0
    date_start = filters.RangeFilter()
    class Meta:
        model = Task
        fields = ['name', 'company', 'date_start']

class NoteFilter(filters.FilterSet):
    title = filters.CharFilter(lookup_expr='icontains') #lookup_expr = in iexact icontains
    task = Task.objects.filter() #userid__userid__gt=0
    date_start = filters.RangeFilter()
    class Meta:
        model = Note
        fields = ['title', 'task', 'date_start']