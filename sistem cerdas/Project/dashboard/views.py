from django.shortcuts import render
from mata.models import Data
from pengujian.models import Mata
from django.contrib.auth.models import User
from django.db import connection
# Create your views here.


def index(request):
    mata_count = Data.objects.all().count()
    user_count = User.objects.all().count()
    pengujian_count = Mata.objects.all().count()
    cursor = connection.cursor()
    cursor.execute(
        'SELECT count(id) from pengujian_mata where status-uji!=0')
    row = cursor.fetchone()
    count_value = row[0]

    akurasi = round(((mata_count-count_value)/mata_count)*100, 2)
    print(count_value)
    context = {
        'mata_count': mata_count,
        'pengujian_count': pengujian_count,
        'user_count': user_count,
        'akurasi': akurasi
    }

    return render(request, 'dashboard/index.html', context)
