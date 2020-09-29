from django.contrib import admin
from .models import Account
# Register your models here.

class AccountAdmin(admin.ModelAdmin):
    list_display = ('id', 'user',) #('first_name', 'last_name',)
    #list_display_links = ('id','title',)
    search_fields = ('id', 'user',) #('first_name', 'last_name',)
    list_filter = ('id', 'user',) #('first_name', 'last_name',)

admin.site.register(Account, AccountAdmin)

admin.site.site_header="Advertiser"