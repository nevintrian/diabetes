from django.contrib.auth import login
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('login_action', views.login_action),
    path('register_action', views.register_action),
    path('logout_action', views.logout_action),
]
