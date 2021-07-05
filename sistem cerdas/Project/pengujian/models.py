from django.db import models

# Create your models here.


class Mata(models.Model):
    nama = models.CharField(max_length=100)
    entropi = models.FloatField()
    energi = models.FloatField()
    homogenitas = models.FloatField()
    kontras = models.FloatField()
    status = models.IntegerField()
    uji = models.IntegerField()
    gambar = models.CharField(max_length=100)
