import os
from rest_framework import serializers
from .models import Task, Note, Link
from upload.models import File
from upload.utils import FileUtils
from django.conf import settings


class FileSerializer(serializers.ModelSerializer):
    file=serializers.StringRelatedField(read_only=False)
    def to_representation(self, instance):
        representation = super().to_representation(instance)
        file = {
            "link": 'https://crm.wsofter.ru:8000' + settings.MEDIA_URL + representation.pop("file"),
            "size": instance.file.size,
            "name": os.path.basename(instance.file.name),
            "icon": FileUtils.getFileIcon(instance.file.name)['icon'],
            "color": FileUtils.getFileIcon(instance.file.name)['color'],
        }
        representation['file'] = file
        return representation
    class Meta:
        model=File
        fields='__all__'

class NoteSerializer(serializers.ModelSerializer):
    username = serializers.ReadOnlyField(source='user.username')
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        try:
            if self.context['request'].method in ['GET']:
                self.fields['files'] = serializers.SerializerMethodField()
        except KeyError:
            pass
    
    def get_files(self, obj):
        files = File.objects.filter(id__in=obj.files)
        return FileSerializer(files, many=True).data
    class Meta:
        model = Note
        fields = '__all__' #('id', 'title', 'user', 'files', 'description', 'date_start', 'task', 'status', 'username')

class LinkSerializer(serializers.ModelSerializer):
    #notes = NoteSerializer(many=True, read_only=False)
    class Meta:
        model = Link
        fields = '__all__' 

class TaskSerializer(serializers.ModelSerializer):
    #notes = NoteSerializer(many=True, read_only=False)
    #links = LinkSerializer(many=True, read_only=False)#serializers.SerializerMethodField()
    links = serializers.PrimaryKeyRelatedField(many=True, read_only=False, queryset=Link.objects.all())
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        try:
            if self.context['request'].method in ['GET']:
                self.fields['links'] = LinkSerializer(many=True, read_only=False)
            #if self.context['request'].method in ['DELETE']:
            #    print("DELETE*********************")
        except KeyError:
            pass
    '''
    def get_links(self, obj):
        print(self.fields['links'], obj.links)
        links = Link.objects.filter(id__in=[0,1,2,3,4])
        return LinkSerializer(links, many=True).data
    '''
    class Meta:
        model = Task
        fields = '__all__' #('id', 'name', 'company', 'description', 'date_start', 'date_end', 'status', 'notes')

class TaskTemplateSerializer(serializers.ModelSerializer):
    #notes = NoteSerializer(many=True, read_only=False)
    links = serializers.PrimaryKeyRelatedField(many=True, read_only=False, queryset=Link.objects.all())
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        try:
            if self.context['request'].method in ['GET']:
                self.fields['links'] = LinkSerializer(many=True, read_only=False)
        except KeyError:
            pass
    class Meta:
        model = Task
        fields = '__all__' #('id', 'name', 'company', 'description', 'date_start', 'date_end', 'status', 'notes')