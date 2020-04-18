import smtplib
import json
import os
import pdfkit

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.views.generic import View
from django.contrib.auth import authenticate, login, logout
from django.template import RequestContext
from django.contrib.auth.mixins import LoginRequiredMixin
from Medical.settings import BASE_DIR
from MyApp.forms import StockForm, PersonForm, DealerForm
from MyApp.models import ComplteStockDetails, DealersInfo, Person, Billings



class LoadView(View):

    def get(self, request, *args, **kwargs):
        return render(request, 'login.html')


class LoginView(View):

    def get(self, request):
        try:
            if request.user.is_authenticated:
                return HttpResponseRedirect('/home/')
            else:
                return HttpResponseRedirect('/load/')
        except:
            return HttpResponseRedirect('/load/')

    def post(self, request, *args, **kwargs):
        user = authenticate(username=request.POST.get('user'),
                            password=request.POST.get('password'))
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect('/home/')
            else:
                return HttpResponseRedirect('/load/')

        else:
            return HttpResponseRedirect('/load/')


class HomePageView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        try:
            return render(request, 'home.html', {'user': str(
            	request.user)})
        except:
            return HttpResponseRedirect('/load/')


class ContactView(LoginRequiredMixin, View):
    
    def get(self, request, *args, **kwargs):
        try:
            return render(request, 'contact.html')
        except:
            return HttpResponseRedirect('/load/')

    def post(self, request, *args, **kwargs):
        data = request.POST
        msg = MIMEMultipart()
        msg['From'] = "Pavana Medicals"
        msg['To'] = 'talktoharihara@gmail.com'
        msg['Subject'] = "Comment :: " + str(
            data.get('name')) + " Mobile - " + data.get(
            'mobile') + " Mail - " + data.get('mail')
        message = data.get('comment')
        msg.attach(MIMEText(message))
        mailserver = smtplib.SMTP('smtp.gmail.com', 587)
        mailserver.ehlo()
        mailserver.starttls()
        mailserver.ehlo()
        mailserver.login('talktoharihara@gmail.com', 'GhsKanna212$')

        mailserver.sendmail('talktoharihara@gmail.com',
                            'talktoharihara@gmail.com', msg.as_string())

        mailserver.close()
        return HttpResponseRedirect('/home/')


class LogoutView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        logout(request)
        return HttpResponseRedirect('/load/')


class StockView(LoginRequiredMixin,View):

    def get(self, request, *args, **kwargs):
        model = ComplteStockDetails
        objs = ComplteStockDetails.objects.all()
        for obj in objs:
            obj.price = obj.price_per_unit + (obj.price_per_unit * (
                float(obj.margin) + float(obj.cgst) + float(obj.sgst)))
        return render(request, 'show_stock.html',
                                  {'data': objs,
                                   'itemnames': [
                                       obj.item_name for obj in objs]})


class AddStockView(LoginRequiredMixin, View):
    def get(self, request):
        form = StockForm()
        return render(request, 'add_stock.html', {'form': form})

    def post(self, request):
        form = StockForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/home/')
        else:
            return HttpResponseRedirect('/add_stock/')


class LoadShopPage(LoginRequiredMixin, View):

    def post(self, request, *args, **kwargs):
        loop_content = range(
            int(request.POST.get('no_of_products')))
        objs = ComplteStockDetails.objects.all()
        return render(request, 'select_shop_page.html',
                                  {'objs': objs,
                                   'looping': loop_content}
                                   )

    def get(self, request, *args, **kwargs):
        return render(request, 'shop_page.html', {'count': range(2, 50)})


class BacktoHomeView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        return render(request, 'login_welcome.html',
            {'user': request.user.username})


class SelectedStockSearchView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        objs = ComplteStockDetails.objects.filter(
            item_name=str(request.GET.get('itemname')))
        for obj in objs:
            obj.price = obj.price_per_unit + (obj.price_per_unit * (
                float(obj.margin) + float(obj.cgst) + float(obj.sgst)))

        return render(
            request,
            'show_stock.html',
            {'data': objs,
             'itemnames': [
                 i.item_name for i in ComplteStockDetails.objects.all()]})

    def post(self, request, *args, **kwargs):
        return HttpResponseRedirect('/home/')


class ShowDealerView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        objs = DealersInfo.objects.all()
        return render(request, 'dealers.html', {'objs': objs})
    
    def post(self, request, *args, **kwargs):
        return HttpResponseRedirect('/home/')


class ShowPersonView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        objs = Person.objects.all()
        return render(request, 'persons.html', {'objs': objs})
    
    def post(self, request, *args, **kwargs):
        return HttpResponseRedirect('/home/')


class ShowBillingCart(LoginRequiredMixin, View):

    def post(self, request, *args, **kwargs):
        users = Person.objects.all()
        dictionary = dict(request.POST)
        test_list = []
        for key in range(len(dictionary.get('item_name_s'))):

            if str(dictionary.get(
                'item_name_s')[key]) != str('') and int(
                    dictionary.get('req_qnt')[key]) > 0:
                try:
                    bill_stock_obj = ComplteStockDetails.objects.get(
                        batch_num=int(dictionary.get('item_name_s')[key]))
                    if bill_stock_obj and bill_stock_obj.quantity and (
                        int(bill_stock_obj.quantity) > int(
                            dictionary.get('req_qnt')[key])):
                        total_price = (float(
                            bill_stock_obj.price_per_unit) + (
                            float(bill_stock_obj.price_per_unit) * (float(
                                bill_stock_obj.margin) + float(
                                bill_stock_obj.cgst) + float(
                                bill_stock_obj.sgst)))) * \
                            float(
                            dictionary.get('req_qnt')[key])
                        total_ppu = (float(bill_stock_obj.price_per_unit) +
                                     (float(bill_stock_obj.price_per_unit) *
                                      (float(bill_stock_obj.margin) +
                                       float(bill_stock_obj.cgst) +
                                       float(bill_stock_obj.sgst))))

                        test_list.append({'obj': bill_stock_obj,
                                          'quantity': dictionary.get(
                                              'req_qnt')[key],
                                          'tp': total_price,
                                          'total_ppu': total_ppu})
                except:
                    continue
        else:
            pass
        sum_of_all_elements = sum([x['tp'] for x in test_list])
        return render(request, 'show_final_billing_cart.html', {
            'test_list': test_list,
            'sum': sum_of_all_elements, 'users': users}
            )
    
    def get(self, request, *args, **kwargs):
        return HttpResponseRedirect('/load_shop_page/')


class GoFinalBillingView(LoginRequiredMixin, View):

    def post(self, request, *args, **kwargs):
        final_list = []
        dictionary = dict(request.POST)
        if dictionary.get('bill_user')[0]:
            batch_numbers = dictionary['batch_nums']
            item_names = dictionary['item_nums']
            company_names = dictionary['company_names']
            ppus = dictionary['ppus']
            quantities = dictionary['quantities']
            tps = dictionary['tps']
            for i in range(len(batch_numbers)):
                try:
                    obj = ComplteStockDetails.objects.get(
                        batch_num=batch_numbers[i])
                except:
                    obj = None
                if obj and obj.quantity and (int(
                        obj.quantity) >= int(quantities[i])):
                    obj.quantity = int(
                        obj.quantity) - int(quantities[i])
                    obj.save()
                    final_list.append({'batch_num': batch_numbers[i],
                                       'item_name': item_names[i],
                                       'company': company_names[i],
                                       'ppu': ppus[i],
                                       'quantity': quantities[i],
                                       'tp': tps[i]})
                else:
                    continue
            per_obj = Person.objects.get(
                user=dictionary.get('bill_user')[0])
            bill_obj = Billings(
                bill_items=final_list, bill_user=per_obj,
                bill_amount=float(dictionary['sum'][0]))
            bill_obj.save()
            c = render(request,
                'billing.html',
                {'final_list': final_list, 'sum': dictionary['sum'],
                 'inv_number': bill_obj.bill_number,
                 'inv_date': bill_obj.bill_date,
                 'user': dictionary.get('bill_user')})

            fp = open('billing.html', 'w')
            fp.write(str(c.content))
            fp.close()

            return render(request, 'final_billing.html',
                {'final_list': final_list,
                'user_details': per_obj,
                'sum': dictionary['sum']}
                )
        else:
            return HttpResponseRedirect('/load_shop_page/')


class SendInvoiceView(LoginRequiredMixin, View):

    def post(self, request):
        mail = request.POST.get('email_id')
        msg = MIMEMultipart('alternative')
        msg['From'] = 'talktoharihara@gmail.com'
        msg['To'] = mail
        msg['Subject'] = "Your Invoice Details Bill"
        c = open('billing.html', 'r').read()
        part2 = MIMEText(c, 'html')
        msg.attach(part2)
        mailserver = smtplib.SMTP('smtp.gmail.com', 587)
        mailserver.ehlo()
        mailserver.starttls()
        mailserver.ehlo()
        mailserver.login('talktoharihara@gmail.com', 'GhsKanna212$')
        mailserver.sendmail('talktoharihara@gmail.com',
                            mail,
                            msg.as_string())
        mailserver.close()
        return HttpResponseRedirect('/home/')


def print_page(request):
	# Windows
    #config = pdfkit.configuration(wkhtmltopdf='C:\Program Files\wkhtmltopdf')
    #path_wkthmltopdf = r'C:/Python27/wkhtmltopdf/bin/wkhtmltopdf.exe'
    #config = pdfkit.configuration(wkhtmltopdf=path_wkthmltopdf
    pdfkit.from_file('billing.html', 'out.pdf')
    os.system('lpr out.pdf')
    os.remove('out.pdf')
    return HttpResponseRedirect('/home')


class ShowBillingsView(LoginRequiredMixin, View):

    def get(self, request):
        objs = Billings.objects.all().order_by('-bill_date')
        users = Person.objects.all()
        return render(request, 'billings.html',
                      {'billings': objs, 'users': users})
    
    def post(self, request):
        objs = Billings.objects.all()
        users = Person.objects.all()
        return render(request, 'billings.html',
                      {'billings': objs, 'users': users})


class GenerateBillView(LoginRequiredMixin, View):

    def get(self, request, bill_num=None):
        import pdb;pdb.set_trace()
        if bill_num:
            obj = Billings.objects.get(bill_number=int(bill_num))
            inv_number = obj.bill_number
            inv_date = obj.bill_date
            user = obj.bill_user.user
            final_list = obj.bill_items
            sum1 = obj.bill_amount
            output_file_name = '''{BASE_DIR}/Bills/{bill_num}_{user}_\
{date}{month}\
{year}.pdf'''.format(
	BASE_DIR=BASE_DIR, bill_num=str(bill_num), user=user,
	date=str(inv_date.date().day), month=str(inv_date.date().month),
	year=str(inv_date.date().month))
            content = render(request, 'bill_for_each_invoice.html',
                                   {'inv_number': inv_number,
                                    'inv_date': inv_date,
                                    'user': user,
                                    'final_list': final_list,
                                    'sum1': sum1})
            fp = open('test_bill_test.html', 'w')
            content = str(content.content).replace('\n', '').replace('\t', '')
            fp.write(content)
            fp.close()
            pdfkit.from_file('test_bill_test.html', output_file_name)
            os.remove('test_bill_test.html')
            return HttpResponseRedirect('/home/')
        else:
            return HttpResponseRedirect('/load/')


class GetBillsByDateView(LoginRequiredMixin, View):

    def get(self, request):
        try:
            objs = Billings.objects.filter(
                bill_date__range=[request.GET['start'],
                                  request.GET['end']]).order_by(
                '-bill_date')
            users = Person.objects.all()
            return render(request, 'billings.html',
                          {'billings': objs, 'users': users})
        except:
            return HttpResponseRedirect('/billings/')


class GetBillsByUserView(LoginRequiredMixin, View):

    def get(self, request):
        try:
            objs = Billings.objects.filter(bill_user__user=str(
                request.GET['customer'])).order_by('-bill_date')
            users = Person.objects.all()
            return render(request, 'billings.html', {'billings': objs, 'users': users})
        except:
            return HttpResponseRedirect('/billings/')


class ShowProfitView(LoginRequiredMixin, View):

    def get(self, request):
        obj_bills = Billings.objects.all()
        users = Person.objects.all()
        data_list = []
        for bill in obj_bills:
            data = {}
            data['bill_num'] = bill.bill_number
            data['bill_amount'] = bill.bill_amount
            data['bill_date'] = bill.bill_date
            data['actual_amount'] = float(
                sum([ComplteStockDetails.objects.get(
                    batch_num=item['batch_num']).price_per_unit * int(
                    item['quantity']) for item in bill.bill_items]))
            data['profit'] = float(
                data['bill_amount']) - data['actual_amount']
            data['user'] = str(bill.bill_user.user)
            data_list.append(data)
        total_profit = sum([list_['profit']
                            for list_ in data_list])
        return render(request, 'profit_bills.html',
                      {'data': data_list, 'users': users,
                       'total_profit': total_profit})


class ProfitBillsByDateView(LoginRequiredMixin, View):

    def get(self, request):
        try:
            obj_bills = Billings.objects.filter(
                bill_date__range=[request.GET[
                    'start'], request.GET['end']]).order_by(
                '-bill_date')
            users = Person.objects.all()
            data_list = []
            for bill in obj_bills:
                data = {}
                data['bill_num'] = bill.bill_number
                data['bill_amount'] = bill.bill_amount
                data['bill_date'] = bill.bill_date
                data['actual_amount'] = float(
                    sum([ComplteStockDetails.objects.get(
                        batch_num=item['batch_num']).price_per_unit * int(
                        item['quantity']) for item in bill.bill_items]))
                data['profit'] = float(
                    data['bill_amount']) - data['actual_amount']
                data['user'] = str(bill.bill_user.user)
                data_list.append(data)
            total_profit = sum([list_['profit']
                                for list_ in data_list])
            return render(request, 'profit_bills.html',
                          {'data': data_list, 'users': users,
                           'total_profit': total_profit})
        except:
            return HttpResponseRedirect('/profit/')


class ProfitBillsByUserView(LoginRequiredMixin, View):

    def get(self, request):
        try:
            obj_bills = Billings.objects.filter(bill_user__user=str(
                request.GET['customer'])).order_by('-bill_date')
            users = Person.objects.all()
            data_list = []
            for bill in obj_bills:
                data = {}
                data['bill_num'] = bill.bill_number
                data['bill_amount'] = bill.bill_amount
                data['bill_date'] = bill.bill_date
                data['actual_amount'] = float(
                    sum([ComplteStockDetails.objects.get(
                        batch_num=item['batch_num']).price_per_unit * int(
                        item['quantity']) for item in bill.bill_items]))
                data['profit'] = float(
                    data['bill_amount']) - data['actual_amount']
                data['user'] = str(bill.bill_user.user)
                data_list.append(data)
            total_profit = sum([list_['profit']
                                for list_ in data_list])
            return render(request, 'profit_bills.html',
                          {'data': data_list, 'users': users,
                           'total_profit': total_profit})
        except:
            return HttpResponseRedirect('/profit/')


class AddPersonView(LoginRequiredMixin, View):

    def get(self, request):
        form = PersonForm()
        return render(request, 'add_person.html', {'form': form})

    def post(self, request):
        form = PersonForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/home/')
        else:
            return HttpResponseRedirect('/add_person/')


class AddDealerView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
            form = DealerForm()
            return render(request, 'add_dealer_page.html', {'form': form})

    def post(self, request, *args, **kwargs):
        form = DealerForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/home/')
        else:
            return HttpResponseRedirect('/add_dealer_page/')


class LoadAddItem(LoginRequiredMixin, View):

    def get(self, request):
        return render(request, 'additempage.html')

    def post(self, request):
        return render(request, 'additempage.html')


class LoadDataFromExcel(LoginRequiredMixin, View):

    def get(self, request):
        return HttpResponseRedirect('/home/')
        # TODO
        # Logic to add data from Excel file
        # And load Stock page

    def post(self, request):
        return HttpResponseRedirect('/home/')
        # TODO
        # Logic to add data from Excel file
        # And load Stock page

##############  Profit/Loss Code for all the bills ###################
'''
obj_bills = Billings.objects.all()
for bill in obj_bills:
	data = {}
	data['bill_num'] = bill.bill_number
	data['bill_amount'] = bill.bill_amount
	data['actual_amount'] = float(
		sum([ComplteStockDetails.objects.get(batch_num=item['batch_num']).price_per_unit * int(item['quantity']) for item in bill.bill_items]))
	data['profit'] = float(data['bill_amount'])-data['actual_amount']
	data['user'] = bill.bill_user.user
	data_list.append(data)
'''
############  For getting profile for all the billings  ##############
'''
[float(item_data.['bill_amount'])-item_data['actual_amount'] for item_data in data_list]
'''
######################################################################

######################  Excel Creation  ##############################
'''
pandas.DataFrame(
	{'Date': [str(obj.bill_date.date()) for obj in objs],
	 'INVOICE NUMBER': [obj.bill_number for obj in objs],
	 'Invoice Amount': [obj.bill_amount for obj in objs]}).to_excel(
	 'test.xlsx', sheet_name='sheet1', index=False)
'''
######################################################################
