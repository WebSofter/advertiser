from rest_framework import serializers
from .models import Company
from account.models import Account
from task.models import Task, Note
from django.contrib.auth.models import User

class AccountSerializer(serializers.ModelSerializer):
    user=serializers.StringRelatedField(read_only=False)
    first_name = serializers.CharField(source = "user.first_name")
    last_name = serializers.CharField(source = "user.last_name")
    class Meta:
        model=Account
        fields='__all__'
'''
class OwnerSerializer(serializers.ModelSerializer):
    #account = Account.objects.filter(id__in=obj.files)
    account = serializers.SerializerMethodField()#AccountSerializer(read_only=True)
    class Meta:
        model=User
        fields='__all__'
    def get_account(self, obj):
        print('11111111111111111111111111111', obj.id)
        account = Account.objects.filter(id=obj.id)
        return AccountSerializer(account, many=False).data
'''
class UserSerializer(serializers.ModelSerializer):
    #account = Account.objects.filter(id__in=obj.files) #serializers.ImageField(source = "account.user_pic")
    class Meta:
        model = User
        fields = '__all__'

class CompanySerializer(serializers.ModelSerializer):
    # user = UserSerializer(read_only=True)
    process = serializers.SerializerMethodField()

    def get_process(self, obj):
        a = Task.objects.filter(company_id = obj.id).count()
        active = Task.objects.filter(company_id = obj.id, status = 1).count()
        freez = Task.objects.filter(company_id = obj.id, status = 2).count()
        finish = Task.objects.filter(company_id = obj.id, status = 3).count()
        percent = 0
        if a > 0 :
            percent = round((finish / (a - freez)) * 100, 1)
        return { 
                    'all' : a, 
                    'active': active,
                    'freez': freez,
                    'finish': finish,
                    'percent': percent
                }


    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        try:
            if self.context['request'].method in ['GET']:
                self.fields['members'] = serializers.SerializerMethodField()
                self.fields['user'] = UserSerializer() #OwnerSerializer() #
        except KeyError:
            pass
    def get_members(self, obj):
        accounts = Account.objects.filter(id__in=obj.members)
        return AccountSerializer(accounts, many=True).data
    class Meta:
        model = Company
        fields = '__all__' #('id', 'name', 'description', 'date_created', 'user', 'status', 'theme', 'members')

class CompanyListSerializer(serializers.ModelSerializer):
    # memb = serializers.ReadOnlyField(source='members.user')
    class Meta: 
        model = Company
        fields = '__all__'
