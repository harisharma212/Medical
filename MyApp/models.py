from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.db import models
from postgres_copy import CopyManager
from jsonfield import JSONField

# Create your models here.
class Person(models.Model):
	user = models.CharField(max_length=20, unique=True)
	first_name = models.CharField(max_length=20)
	last_name = models.CharField(max_length=20)
	age = models.IntegerField()
	email_id = models.EmailField(unique=True)
	dob = models.DateField()
	date_created = models.DateTimeField(auto_now=True)
	phone = models.CharField(max_length=10, unique=True)
	address = models.CharField(max_length=200)
	objects = CopyManager()

	def __str__(self):
		return str(self.user)


class DealersInfo(models.Model):
	person_info = models.OneToOneField(Person, on_delete=models.CASCADE) 
	company_name = models.CharField(max_length=50)
	dl1 = models.CharField(max_length=15, unique=True)
	dl2 = models.CharField(max_length=15, unique=True)
	tin = models.CharField(max_length=15, unique=True)
	objects = CopyManager()

	def __str__(self):
		return str(self.person_info.first_name + self.person_info.last_name)


class ComplteStockDetails(models.Model):
    batch_num = models.IntegerField(unique=True)
    item_name = models.CharField(max_length=50, unique=True)
    company = models.CharField(max_length=30)
    price_per_unit = models.FloatField()
    manf_date = models.DateField()
    exp_date = models.DateField()
    quantity = models.IntegerField()
    dealer = models.ForeignKey(DealersInfo, on_delete=models.CASCADE)
    comments = models.CharField(max_length=100)
    margin = models.CharField(max_length=20)
    cgst = models.CharField(max_length=20)
    sgst = models.CharField(max_length=20)
    objects = CopyManager()

    def __str__(self):
        return str(self.item_name)

class Billings(models.Model):
	bill_number = models.AutoField(primary_key=True)
	bill_items = JSONField()
	bill_date = models.DateTimeField(auto_now_add=True)
	bill_user = models.ForeignKey(Person, on_delete=models.CASCADE)
	bill_amount = models.DecimalField(max_digits=10, decimal_places=4)
	objects = CopyManager()

	def __str__(self):
		return str(self.bill_number)