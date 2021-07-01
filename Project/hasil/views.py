import math
import cv2
import numpy as np
from neupy import algorithms
from django.shortcuts import render
from django.core.files.storage import FileSystemStorage
from mata.models import Data
# Create your views here.


def index(request):
    return render(request, 'hasil/index.html')


def action(request):

    if request.method == 'POST' and request.FILES['gambar']:
        gambar = request.FILES['gambar']
        fs = FileSystemStorage()
        filename = fs.save(gambar.name, gambar)

    img = cv2.imread("media/"+filename)

    img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    glcm_0 = getGlcm(img_gray, 1, 0)
    asm, con, eng, idm = feature_computer(glcm_0)
    print(asm, con, eng, idm)

    mata = Data.objects.all()
    data_x = []
    data_y = []
    data_test = [round(asm, 9), round(con, 9), round(eng, 9), round(idm, 9)]
    for row in mata:
        data_x.append(
            [row.energi, row.entropi, row.kontras, row.homogenitas])
        data_y.append(row.status)
    hasil = lvq(data_x, data_y, data_test)[0]
    if hasil == 0:
        show_hasil = 'Tidak terdeteksi diabetes'
    else:
        show_hasil = 'Terdeteksi gejala diabetes'

    context = {
        'show_hasil': show_hasil,
        'nama': filename
    }
    return render(request, 'hasil/index.html', context)


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


# LVQ Method
def lvq(data_x, data_y, data_test):
    x = np.array(data_x)
    y = np.array(data_y)

    lvqnet = algorithms.LVQ(n_inputs=4, n_classes=2)
    lvqnet.train(x, y, epochs=100)
    return lvqnet.predict([data_test])
