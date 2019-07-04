from home.models.business_models import Service, Attribute


def get_service_context(slug):
    data = {'attributes': [], 'sections': {}}
    service = Service.objects.get(slug=slug)
    service_attributes = service.getAttributes()
    for attribute in service.category.attributes.all():
        data['sections'][attribute.section] = attribute.get_section_display()
        data_attribute = {'name': attribute.name,
                          'section_id': attribute.section,
                          'value': service_attributes.get(attribute.getKey()).get('value')}
        data['attributes'].append(data_attribute)
    data['name'] = service.name
    return data
