from cms.models.business_models import Service, Comment, AttributeService, Product, Discount, PromoCode, Offer


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
    data['logo'] = service.logo
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


def get_other_services_names(service):
    services = []
    for ser in Service.objects.filter(category=service.category).exclude(name=service.name).order_by('name'):
        services.append(ser.name)
    return services


def get_vouchers_by_service(service):
    vouchers = []

    for voucher in Discount.objects.filter(service=service):
        vouchers.append(voucher)

    for voucher in PromoCode.objects.filter(service=service):
        vouchers.append(voucher)

    for voucher in Offer.objects.filter(service=service):
        vouchers.append(voucher)

    return vouchers


def get_products_by_service(service):
    products = []
    for product in Product.objects.filter(service=service):
        products.append(product)
    return products


def toBoolean(value):
    return 'Yes' if value else 'No'


def toMultiple(values):
    pass
