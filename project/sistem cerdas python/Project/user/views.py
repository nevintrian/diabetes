from django.contrib import auth
from django.shortcuts import redirect, render
from django.contrib import messages
from django.contrib.auth.models import User
from django.core.paginator import Paginator
# Create your views here.


def index(request):
    if request.method == 'POST':
        search = request.POST['search']
        user = User.objects.filter(username__contains=search)
    else:
        user = User.objects.all()

    paginator = Paginator(user, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    user_count = User.objects.all().count()
    context = {
        'data': page_obj,
        'count': user_count,
    }
    return render(request, 'user/index.html', context)


def create(request):
    context = {
        'judul': 'Tambah User',
        'name': 'tambah',
        'action': '/user/create_action'
    }
    return render(request, 'user/write.html', context)


def create_action(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        password = request.POST['password']

        user = User.objects.create_user(username, email, password)
        user.first_name = first_name
        user.last_name = last_name
        user.save()
        messages.add_message(request, messages.INFO, 'Data berhasil ditambah.')
    return redirect('/user')


def update(request, id):
    user = User.objects.get(id=id)
    context = {
        'judul': 'Update User',
        'name': 'ubah',
        'placeholder': 'kosongkan password jika tidak diubah',
        'action': '/user/update_action',
        'username': user.username,
        'email': user.email,
        'first_name': user.first_name,
        'last_name': user.last_name,
        'password': user.password,
        'id': user.id

    }
    return render(request, 'user/write.html', context)


def update_action(request):
    if request.method == 'POST':
        password = request.POST['password']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        id = request.POST['id']

        user = User.objects.get(id=id)
        user.first_name = first_name
        user.last_name = last_name
        if password:
            user.set_password(password)
        user.save()
        messages.add_message(request, messages.INFO, 'Data berhasil diupdate.')

    return redirect('/user')


def delete(request, id):
    User.objects.filter(id=id).delete()
    messages.add_message(request, messages.INFO, 'Data berhasil dihapus.')

    return redirect('/user')
