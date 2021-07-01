from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('search', views.index),
    path('create', views.create),
    path('create_action', views.create_action),
    path('update/<id>', views.update),
    path('update_action', views.update_action),
    path('delete/<id>', views.delete)

]
