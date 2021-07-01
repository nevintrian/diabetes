from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.models import User
# Create your views here.


def index(request):

    return render(request, 'login/index.html')


def login_action(request):
    if request.method == 'POST':
        print(request.POST)
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.add_message(request, messages.INFO,
                                 'Anda berhasil login.')
            return redirect('/dashboard')
        else:
            messages.add_message(request, messages.ERROR,
                                 'Username/password salah.')
            return redirect('/login')

    return render(request, 'login/index.html')


def register_action(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']

        user = User.objects.create_user(username, email, password)
        user.first_name = first_name
        user.last_name = last_name
        user.save()
        messages.add_message(request, messages.INFO, 'Anda berhasil daftar.')

    return render(request, 'login/index.html')


def logout_action(request):

    logout(request)
    messages.add_message(request, messages.INFO, 'Anda berhasil logout.')
    return redirect('/login')
