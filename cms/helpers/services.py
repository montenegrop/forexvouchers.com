from cms.models.business_models import Service, Comment


def get_service_context(service):
    data = {'attributes': [], 'sections': {}}
    service_attributes = service.getAttributes()
    for attribute in service.category.attributes.all():
        data['sections'][attribute.section] = attribute.get_section_display()
        data_attribute = {'name': attribute.name,
                          'section_id': attribute.section,
                          'value': service_attributes.get(attribute.getKey()).get('value')}
        data['attributes'].append(data_attribute)
    data['name'] = service.name
    data['slug'] = service.slug
    return data


def get_comments_by_service(service):
    comments = []
    for comment in Comment.objects.filter(service=service, active=True, parent_comment=None).order_by('-id'):
        children = Comment.objects.filter(active=True, parent_comment=comment).order_by('-id')
        data = comment.toDict()
        data['children'] = [comment.toDict() for comment in children]
        comments.append(data)
    return comments