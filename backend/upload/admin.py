from django.contrib import admin
from .models import File
# Register your models here.

class FileAdmin(admin.ModelAdmin):
    list_display = ('id', 'file', 'status')
    list_display_links = ('id','file', 'status')
    search_fields = ('id', 'file', 'status')
    list_filter = ('id', 'file', 'status')

admin.site.register(File, FileAdmin)
