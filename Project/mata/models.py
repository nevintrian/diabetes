from django.db import models

# Create your models here.


class Data(models.Model):
    nama = models.CharField(max_length=100)
    entropi = models.FloatField()
    energi = models.FloatField()
    homogenitas = models.FloatField()
    kontras = models.FloatField()
    status = models.IntegerField()
    gambar = models.CharField(max_length=100)


