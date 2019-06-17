from wagtail.contrib.modeladmin.options import (
    ModelAdmin, ModelAdminGroup, modeladmin_register)
from .models import Category, Service, Attribute, AttributeValue, Voucher, Affiliate, Product


class CategoryAdmin(ModelAdmin):
    model = Category
    menu_label = 'Category'  # ditch this to use verbose_name_plural from model
    menu_icon = 'pilcrow'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    add_to_settings_menu = False  # or True to add your model to the Settings sub-menu
    exclude_from_explorer = False  # or True to exclude pages of this type from Wagtail's explorer view
    list_display = ('name',)
    list_filter = ('name',)
    search_fields = ('name',)


class ServiceAdmin(ModelAdmin):
    model = Service
    menu_label = 'Service'  # ditch this to use verbose_name_plural from model
    menu_icon = 'pilcrow'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    add_to_settings_menu = False  # or True to add your model to the Settings sub-menu
    exclude_from_explorer = False  # or True to exclude pages of this type from Wagtail's explorer view
    list_display = ('name', 'category')  # que hace name aca???
    list_filter = ('name', 'premium')
    search_fields = ('name', 'premium', 'attributes')


class AttributeAdmin(ModelAdmin):
    model = Attribute


class AttributeValueAdmin(ModelAdmin):
    model = AttributeValue


class VoucherAdmin(ModelAdmin):
    model = Voucher


class AffiliateAdmin(ModelAdmin):
    model = Affiliate


class ProductAdmin(ModelAdmin):
    model = Product


class ProductsGroup(ModelAdminGroup):
    menu_label = 'Products'
    menu_icon = 'folder-open-inverse'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    items = (CategoryAdmin, ServiceAdmin, AttributeAdmin, AttributeValueAdmin, ProductAdmin)


# Now you just need to register your customised ModelAdmin class with Wagtail
# modeladmin_register(CategoryAdmin)
# modeladmin_register(ServiceAdmin)
modeladmin_register(ProductsGroup)
modeladmin_register(AffiliateAdmin)
