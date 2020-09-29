from rest_framework import serializers
from .models import File
from .utils import FileUtils
import os.path 

class FileSerializer(serializers.ModelSerializer):
    file = serializers.FileField()

    class Meta:
        model = File
        fields = '__all__'#('file')
    
    def to_representation(self, instance):
        representation = super().to_representation(instance)
        f = representation.pop("file")
        file = {
            "url": f,
            "link": f,
            "size": instance.file.size,
            "path": instance.file.name,
            "name": os.path.basename(instance.file.name),
            #"color": FileUtils.getFileIcon(instance.file.name).color,
            #"icon": FileUtils.getFileIcon(instance.file.name).icon,
            "icon": FileUtils.getFileIcon(instance.file.name)['icon'],
            "color": FileUtils.getFileIcon(instance.file.name)['color'],
            #"date": instance.file.date,
        }
        representation['file'] = file
        return representation
'''
class FileSerializer(serializers.ModelSerializer):
    class Meta:
        model = File
        fields = "__all__"
'''