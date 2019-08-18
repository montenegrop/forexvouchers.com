from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
from openpyxl import Workbook

from cms.helpers.ServiceHelper import ServiceHelper, Field
from cms.models import Service


@csrf_exempt
def import_services(request):
    return HttpResponse('x')


def export_services(request):
    '''
    Download file by category
    http://localhost:8000/admin/export_services/?category=1
    '''
    cat = int(request.GET['category'])
    service = Service()
    helper = ServiceHelper(service)

    response = HttpResponse(
        content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    )
    response['Content-Disposition'] = 'attachment; filename={date}-services.xlsx'.format(
        date=datetime.now().strftime('%Y-%m-%d'),
    )
    workbook = Workbook()
    worksheet = workbook.active
    worksheet.title = 'Services'

    # define available columns
    columns = ['name', 'slug', 'category']
    rows = []
    for field in helper.fields:
        if cat in field.categories:
            columns.append(field.key)



    services = Service.objects.filter(category=cat)
    for service in services:
        row = []
        rows.append(row)
        helper = ServiceHelper(service)
        for column in columns:
            row.append(helper.get_csv_value(column))

    # add columns to excel's first row
    for num, title in enumerate(columns, 1):
        cell = worksheet.cell(row=1, column=num)
        cell.value = title

    for rnumber, row in enumerate(rows, 2):
        for cnumber, cell_value in enumerate(row, 1):
            cell = worksheet.cell(row=rnumber, column=cnumber)
            cell.value = str(cell_value)

    workbook.save(response)
    return response
