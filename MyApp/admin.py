from django.contrib import admin

# Register your models here.
from MyApp.models import Person, DealersInfo, Billings, ComplteStockDetails

admin.site.register(Person)
admin.site.register(DealersInfo)
admin.site.register(Billings)
admin.site.register(ComplteStockDetails)
