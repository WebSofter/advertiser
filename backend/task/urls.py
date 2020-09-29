from rest_framework import routers
from .api import TaskViewSet, TaskTemplateViewSet, NoteViewSet, LinkViewSet

router = routers.DefaultRouter()
router.register('api/task', TaskViewSet, 'task')
router.register('api/task-template', TaskTemplateViewSet, 'template')
#router.register('api/task/<int:pk>/note', NoteViewSet, 'note')
router.register('api/note', NoteViewSet, 'note')
router.register('api/link', LinkViewSet, 'link')
urlpatterns = router.urls
