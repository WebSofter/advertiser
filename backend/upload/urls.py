from rest_framework import routers
from .api import FileViewSet

router = routers.DefaultRouter()
router.register('api/upload', FileViewSet, 'upload')
#router.register('api/file', FileViewSet, 'file')
urlpatterns = router.urls

'''
from django.urls import path
from .views import *

urlpatterns = [
    path('', FileUploadView.as_view())
]
'''