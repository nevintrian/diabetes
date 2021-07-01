from django.shortcuts import redirect, render
from django.contrib import messages
from .models import Data
from django.core.paginator import Paginator
import math
import cv2
from django.core.files.storage import FileSystemStorage
# Create your views here.


def index(request):
    if request.method == 'POST':
        search = request.POST['search']
        mata = Data.objects.filter(nama__contains=search)
    else:
        mata = Data.objects.all()

    paginator = Paginator(mata, 5)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    mata_count = Data.objects.all().count()
    context = {
        'data': page_obj,
        'count': mata_count
    }
    return render(request, 'mata/index.html', context)


def create(request):
    context = {
        'judul': 'Tambah Mata',
        'name': 'tambah',
        'action': '/mata/create_action'
    }
    return render(request, 'mata/write.html', context)


def create_action(request):

    if request.method == 'POST' and request.FILES['gambar']:
        nama = request.POST['nama']
        status = request.POST['status']
        gambar = request.FILES['gambar']
        fs = FileSystemStorage()
        filename = fs.save(gambar.name, gambar)

    img = cv2.imread("media/"+filename)

    img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    glcm_0 = getGlcm(img_gray, 1, 0)
    asm, con, eng, idm = feature_computer(glcm_0)
    print(asm, con, eng, idm)

    mata = Data(nama=nama, entropi=round(con, 9), energi=round(asm, 9),
                homogenitas=round(idm, 9), kontras=round(eng, 9), status=status, gambar=filename)
    mata.save()

    messages.add_message(request, messages.INFO, 'Data berhasil ditambah.')
    return redirect('/mata')


def update(request, id):
    mata = Data.objects.get(id=id)
    context = {
        'judul': 'Ubah Mata',
        'name': 'ubah',
        'action': '/mata/update_action',
        'nama': mata.nama,
        'status': mata.status,
        'id': mata.id
    }
    return render(request, 'mata/write.html', context)


def update_action(request):
    if request.method == 'POST':
        nama = request.POST['nama']
        status = request.POST['status']
        id = request.POST['id']

        mata = Data.objects.get(id=id)
        mata.nama = nama
        mata.status = status
        mata.save()
        messages.add_message(request, messages.INFO, 'Data berhasil diupdate.')
    return redirect('/mata')


def delete(request, id):
    Data.objects.filter(id=id).delete()
    messages.add_message(request, messages.INFO, 'Data berhasil dihapus.')
    return redirect('/mata')


# GLCM Method
gray_level = 16


def maxGrayLevel(img):
    max_gray_level = 0
    (height, width) = img.shape
    for y in range(height):
        for x in range(width):
            if img[y][x] > max_gray_level:
                max_gray_level = img[y][x]
    return max_gray_level+1


def getGlcm(input, d_x, d_y):
    srcdata = input.copy()
    ret = [[0.0 for i in range(gray_level)] for j in range(gray_level)]
    (height, width) = input.shape

    max_gray_level = maxGrayLevel(input)

    if max_gray_level > gray_level:
        for j in range(height):
            for i in range(width):
                srcdata[j][i] = srcdata[j][i]*gray_level / max_gray_level

    for j in range(height-d_y):
        for i in range(width-d_x):
            rows = srcdata[j][i]
            cols = srcdata[j + d_y][i+d_x]
            ret[rows][cols] += 1.0

    for i in range(gray_level):
        for j in range(gray_level):
            ret[i][j] /= float(height*width)

    return ret


def feature_computer(p):
    Con = 0.0
    Eng = 0.0
    Asm = 0.0
    Idm = 0.0
    for i in range(gray_level):
        for j in range(gray_level):
            Con += (i-j)*(i-j)*p[i][j]
            Asm += p[i][j]*p[i][j]
            Idm += p[i][j]/(1+(i-j)*(i-j))
            if p[i][j] > 0.0:
                Eng += p[i][j]*math.log(p[i][j])
    return Asm, Con, -Eng, Idm
