from rest_framework import routers
from .api import CompanyViewSet

router = routers.DefaultRouter()
router.register('api/company', CompanyViewSet, 'company')

urlpatterns = router.urls
