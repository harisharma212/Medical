"""Medical URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin

from MyApp import views

'''urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^app_login/', views.app_login),
    url(r'^load/', views.load),
]
'''

urlpatterns = [
    # TEST URLS
    url(r'^admin/', admin.site.urls),
    # url(r'^load/', views.load),
    url(r'^load/', views.LoadView.as_view()),
    
    # STOCK URLS
    url(r'^show_stock/', views.StockView.as_view()),
    url(r'^home/', views.HomePageView.as_view()),
    url(r'^load_shop_page/', views.LoadShopPage.as_view()),
    url(r'^show_selected_stock/', views.SelectedStockSearchView.as_view()),
    url(r'^back_to_home/', views.BacktoHomeView.as_view()),
    
    url(r'^profit/', views.ShowProfitView.as_view()),
    url(r'^get_profit_details_by_date/', views.ProfitBillsByDateView.as_view()),
    url(r'^get_profit_details_by_user/', views.ProfitBillsByUserView.as_view()),

    # BILLS URL
    url(r'^show_billing_cart/', views.ShowBillingCart.as_view()),
    url(r'^go_final_billing/', views.GoFinalBillingView.as_view()),
    url(r'^billings/', views.ShowBillingsView.as_view()),
    url(r'^generate_bill/(?P<bill_num>[-\d]+)', views.GenerateBillView.as_view()),
    url(r'^get_bills_by_date/', views.GetBillsByDateView.as_view()),
    url(r'^get_bills_by_user/', views.GetBillsByUserView.as_view()),

    # INVOICE URLS
    url(r'^print_page/',  views.print_page),

    # COMMUNICATION URLS
    url(r'^contact/', views.ContactView.as_view()),
    url(r'^send_invoice/', views.SendInvoiceView.as_view()),

    # AUTHENTICATION URLS
    url(r'^login/', views.LoginView.as_view()),
    url(r'^logout/', views.LogoutView.as_view()),

    # PERSON URLS
    url(r'^add_person_page/', views.AddPersonPageView.as_view()), 
    url(r'^add_person/', views.AddPersonView.as_view()),

    # ITEMS PAGE
    url(r'^add_item/', views.LoadAddItem.as_view()),
    
    # DEALER URLS
    url(r'^add_dealer/', views.AddDealerView.as_view()),
    url(r'^show_dealers/', views.ShowDealerView.as_view()),
    
    # LOADING DATA URLS
    url(r'^load_excel/', views.LoadDataFromExcel.as_view()),
]