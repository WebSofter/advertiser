from rest_framework import serializers
from .models import Account
from django.contrib.auth.models import User

class AccountSerializer(serializers.ModelSerializer):
    user=serializers.StringRelatedField(read_only=False)
    first_name = serializers.CharField(source = "user.first_name")
    last_name = serializers.CharField(source = "user.last_name")
    date_joined = serializers.DateTimeField(source = "user.date_joined")
    def create(self, validated_data):
        request = self.context.get('request')
        user_obj = user.User.objects.create(**validated_data)
    class Meta:
        model=Account
        fields='__all__'
