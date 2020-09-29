from django.urls import include, path
from rest_framework.routers import DefaultRouter

from .views import AccountListView, AccountDetailView

# router=DefaultRouter()

# router.register("all-profiles", AccountListView)
# router.register("profile/<int:pk>",AccountDetailView,basename='profile')

urlpatterns = [
    path("all", AccountListView.as_view(),name="all"),
    path("<int:pk>",AccountDetailView.as_view(),name="profile")
    # path("",include(router.urls))
]
