from django.shortcuts import render
from django.contrib.auth.models import User
# method view


def index(request):
    return render(request, 'index.html')