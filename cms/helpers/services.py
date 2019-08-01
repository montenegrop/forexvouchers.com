from cms.models.business_models import Service, Comment, AttributeService


def get_service_context(service):
    data = {'attributes': [], 'sections': {}}
    service_attributes = service.getAttributes()
    for attser in AttributeService.objects.filter(service=service):
        attribute = attser.attribute
        data['sections'][attribute.section] = attribute.get_section_display()
        data_attribute = {'name': attribute.name,
                          'section_id': attribute.section,
                          'value': service_attributes.get(attribute.getKey()).get('value')}
        data['attributes'].append(data_attribute)
    data['name'] = service.name
    data['slug'] = service.slug
    data['category'] = service.category
    return data


def get_comments_by_service(service):
    comments = []
    for comment in Comment.objects.filter(service=service, active=True, parent_comment=None).order_by('-id'):
        children = Comment.objects.filter(active=True, parent_comment=comment).order_by('-id')
        data = comment.toDict()
        data['children'] = [comment.toDict() for comment in children]
        comments.append(data)
    return comments


def get_services_by_category(service):
    services = []
    for service in Service.objects.filter(category=service.category).order_by('name'):
        services.append(service)
    return services




def toBoolean(value):
    return 'Yes' if value else 'No'

def toMultiple(values):
    pass


def get_fields_by_service(service):
    data = {'fields': [], 'codes': {}}

    if service.category.name == 'Forex Brokers':
        data['codes']['Company Profile'] = 'cp'

        data_field = {'name': 'Founded', 'value': service.founded, 'code': 'cp'}
        data['fields'].append(data_field)

        data_field = {'name': 'Status', 'value': service.status, 'code': 'cp'}
        data['fields'].append(data_field)

        data_field = {'name': 'Broker Type', 'value': service.broker_type, 'code': 'cp'}
        data['fields'].append(data_field)

        data_field = {'name': 'Regulation', 'value': service.regulation, 'code': 'cp'}
        data['fields'].append(data_field)

        data_field = {'name': 'Countries', 'value': toMultiple(service.countries), 'code': 'cp'}
        data['fields'].append(data_field)

        data_field = {'name': 'International Offices', 'value': service.international_offices, 'code': 'cp'}
        data['fields'].append(data_field)

        data_field = {'name': 'License', 'value': service.license, 'code': 'cp'}
        data['fields'].append(data_field)

        data_field = {'name': 'Accepting US Clients', 'value': service.accept_us_clients, 'code': 'cp'}
        data['fields'].append(data_field)

        data_field = {'name': 'Accepting EU Clients', 'value': service.accept_eu_clients, 'code': 'cp'}
        data['fields'].append(data_field)

        data['codes']['Trading Setup'] = 'ts'

        data_field = {'name': 'Timezone', 'value': service.timezone, 'code': 'ts'}
        data['fields'].append(data_field)

        data_field = {'name': 'Trading Software', 'value': service.trading_software, 'code': 'ts'}
        data['fields'].append(data_field)

        data_field = {'name': 'Platforms Supported', 'value': service.platforms_supported, 'code': 'ts'}
        data['fields'].append(data_field)

        data_field = {'name': 'ea robots', 'value': service.ea_robots, 'code': 'ts'}
        data['fields'].append(data_field)

        data_field = {'name': 'Scalping', 'value': toBoolean(service.scalping), 'code': 'ts'}
        data['fields'].append(data_field)

        data_field = {'name': 'Hedging', 'value': service.hedging, 'code': 'ts'}
        data['fields'].append(data_field)

        data['codes']['Customer Support'] = 'cs'

        data_field = {'name': 'Email', 'value': service.email, 'code': 'cs'}
        data['fields'].append(data_field)

        data_field = {'name': 'Phone', 'value': service.phone, 'code': 'cs'}
        data['fields'].append(data_field)

        data_field = {'name': 'Office Address', 'value': service.office_address, 'code': 'cs'}
        data['fields'].append(data_field)

        data_field = {'name': 'Chat', 'value': service.chat, 'code': 'cs'}
        data['fields'].append(data_field)

        data_field = {'name': 'Supported Languages', 'value': service.support_languages, 'code': 'cs'}
        data['fields'].append(data_field)

        data['codes']['Details'] = 'd'

        data_field = {'name': 'Training Courses', 'value': service.training_courses, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Training Type', 'value': service.phone, 'training_type': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Methodology', 'value': service.methodology, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Training Tools', 'value': service.training_tools, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Instructor', 'value': service.instructor, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Pricing Model', 'value': service.pricing_model, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'System Type', 'value': service.system_type, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Trading Type', 'value': service.trading_type, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Required Software', 'value': service.required_software, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Signal Alerts', 'value': service.signal_alerts, 'code': 'd'}
        data['fields'].append(data_field)

        data_field = {'name': 'Frequency', 'value': service.frequency, 'code': 'd'}
        data['fields'].append(data_field)

    return data
