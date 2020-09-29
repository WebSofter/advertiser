from django.contrib import admin
from .models import Company

# I'll often add this to admin.py...
class ArrayFieldListFilter(admin.SimpleListFilter):
    title = 'Members'
    parameter_name = 'members'
    def lookups(self, request, model_admin):
        members = Company.objects.values_list("members", flat=True)
        members = [(kw, kw) for sublist in members for kw in sublist if kw]
        members = sorted(set(members))
        return members
    def queryset(self, request, queryset):
        lookup_value = self.value()
        if lookup_value:
            queryset = queryset.filter(members__contains=[lookup_value])
        return queryset
# Register your models here.
class CompanyAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'user', 'user_id', 'members', 'theme', 'date_created', 'description', 'status')
    list_display_links = ('id', 'name')
    list_filter = (ArrayFieldListFilter, 'name', 'user', 'user_id', 'members', 'date_created')
    #search_fields = ('id', 'user', 'name', 'description', 'members')
    #list_editable = ('description', 'theme')

admin.site.register(Company, CompanyAdmin)
