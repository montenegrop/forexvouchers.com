from wagtail.contrib.modeladmin.options import (
    ModelAdmin, ModelAdminGroup, modeladmin_register)
from wagtail.core import hooks

from django.contrib.staticfiles.templatetags.staticfiles import static
from django.utils.html import format_html
from .models import Category, Service, Attribute, Voucher, Affiliate, Product, Comment


class CategoryAdmin(ModelAdmin):
    model = Category
    menu_label = 'Category'  # ditch this to use verbose_name_plural from model
    menu_icon = 'pilcrow'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    add_to_settings_menu = False  # or True to add your model to the Settings sub-menu
    exclude_from_explorer = False  # or True to exclude pages of this type from Wagtail's explorer view
    list_display = ('name',)
    search_fields = ('name',)


class ServiceAdmin(ModelAdmin):
    model = Service
    menu_label = 'Service'  # ditch this to use verbose_name_plural from model
    menu_icon = 'pilcrow'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    add_to_settings_menu = False  # or True to add your model to the Settings sub-menu
    exclude_from_explorer = False  # or True to exclude pages of this type from Wagtail's explorer view
    list_display = ('name', 'category', 'premium')
    list_filter = ('premium',)
    search_fields = ('name',)


class AttributeAdmin(ModelAdmin):
    model = Attribute


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
    items = (CategoryAdmin, ServiceAdmin, AttributeAdmin, ProductAdmin)


class CommentAdmin(ModelAdmin):
    model = Comment


# Now you just need to register your customised ModelAdmin class with Wagtail
# modeladmin_register(CategoryAdmin)
# modeladmin_register(ServiceAdmin)
modeladmin_register(ProductsGroup)
modeladmin_register(AffiliateAdmin)
modeladmin_register(CommentAdmin)


@hooks.register("insert_global_admin_js", order=100)
def global_admin_js():
    """Add /static/css/custom.js to the admin."""
    return format_html(
        '<script></script>'
    )