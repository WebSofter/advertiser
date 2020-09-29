from django.contrib import admin
from .models import Task, Note, Link


# Register your models here.
class TaskAdmin(admin.ModelAdmin):
    list_display = ('id', 'company', 'name', 'description', 'date_created', 'date_start', 'date_end', 'status')
    list_display_links = ('id','name',)
    search_fields = ('id', 'name', 'date_created', 'date_start', 'date_end')
    list_filter = ('name', 'company', 'date_created', 'date_start', 'date_end', 'status')
    #def get_links(self, obj):
    #    return "\n".join([p.products for p in obj.product.all()])
    #list_editable = ('user_executors_id', 'description', 'date_start', 'date_end', 'status')

class NoteAdmin(admin.ModelAdmin):
    list_display = ('id', 'task', 'title', 'files', 'user', 'description', 'date_created', 'date_start', 'date_end', 'status')
    list_display_links = ('id','title',)
    search_fields = ('id', 'date_created', 'date_start', 'date_end')
    list_filter = ('task', 'date_created', 'date_start', 'date_end', 'status')

class LinkAdmin(admin.ModelAdmin):
    list_display = ('id', 'title')
    list_display_links = ('id', 'title')
    search_fields = ('id', 'title')
    list_filter = ('id', 'title')

admin.site.register(Task, TaskAdmin)
admin.site.register(Note, NoteAdmin)
admin.site.register(Link, LinkAdmin)

'''
company_id - связанная компания
user_executors_id - ID исполнителей
description - описание задачи
status - статус исполнения
date_start - время начала
date_end - время окончания

'''