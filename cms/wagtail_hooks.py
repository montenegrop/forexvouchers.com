from wagtail.contrib.modeladmin.options import (
    ModelAdmin, ModelAdminGroup, modeladmin_register)
from wagtail.core import hooks

from django.contrib.staticfiles.templatetags.staticfiles import static
from django.utils.html import format_html
from django.conf import settings
from .models import Category, Service, Attribute, Voucher, Affiliate, Product, Comment
from .models import Status, BrokerType, Location, Regulation, License
from .models import Timezone, TradingSoftware, PlatformSupported
from .models import Chat, SupportedLanguage
from .models import TrainingCourse, TradingType, Methodology, TrainingTool, PricingModel, SystemType, TradingType, \
    SignalAlert
from .models import AccountType, TradingInstrument, RevenueModel, AccountOption, AccountCurrency, PaymentMethod


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
    menu_label = 'Custom Attributes'


class VoucherAdmin(ModelAdmin):
    model = Voucher


class AffiliateAdmin(ModelAdmin):
    model = Affiliate


class ProductAdmin(ModelAdmin):
    model = Product


# fields


class StatusAdmin(ModelAdmin):
    model = Status
    menu_label = 'Status'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class BrokerTypeAdmin(ModelAdmin):
    model = BrokerType
    menu_label = 'Broker Type'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class LocationAdmin(ModelAdmin):
    model = Location
    menu_label = 'Locations'

    list_display = ('name', 'code', 'continent', 'capital')
    list_filter = ('continent',)
    search_fields = ('name', 'code')
    ordering = ('name',)


class RegulationAdmin(ModelAdmin):
    model = Regulation
    menu_label = 'Regulations'

    list_display = ('code', 'location', 'link')
    ordering = ('code',)
    search_fields = ('code', 'location')


class LicenseAdmin(ModelAdmin):
    model = License
    menu_label = 'Lincense'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


#######################

class TimezoneAdmin(ModelAdmin):
    model = Timezone
    menu_label = 'Timezone'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class TradingSoftwareAdmin(ModelAdmin):
    model = TradingSoftware
    menu_label = 'Trading Software'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class PlatformSupportedAdmin(ModelAdmin):
    model = PlatformSupported
    menu_label = 'Platforms Supported'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


#######################

class ChatAdmin(ModelAdmin):
    model = Chat
    menu_label = 'Chat'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class SupportedLanguageAdmin(ModelAdmin):
    model = SupportedLanguage
    menu_label = 'Supported Language'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


#######################

class TrainingCourseAdmin(ModelAdmin):
    model = TrainingCourse
    menu_label = 'Training Course'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class TrainingTypeAdmin(ModelAdmin):
    model = TradingType
    menu_label = 'Trading Type'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class MethodologyAdmin(ModelAdmin):
    model = Methodology
    menu_label = 'Methodology'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class TrainingToolAdmin(ModelAdmin):
    model = TrainingTool
    menu_label = 'Training Tools'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class PricingModelAdmin(ModelAdmin):
    model = PricingModel
    menu_label = 'Pricing Models'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class SystemTypeAdmin(ModelAdmin):
    model = SystemType
    menu_label = 'System Type'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class TradingTypeAdmin(ModelAdmin):
    model = TradingType
    menu_label = 'Trading Type'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class SignalAlertAdmin(ModelAdmin):
    model = SignalAlert
    menu_label = 'Signal Alerts'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


#######################

class AccountTypeAdmin(ModelAdmin):
    model = AccountType
    menu_label = 'Account Types'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class TradingInstrumentAdmin(ModelAdmin):
    model = TradingInstrument
    menu_label = 'Trading Instruments'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class RevenueModelAdmin(ModelAdmin):
    model = RevenueModel
    menu_label = 'Revenue Models'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class AccountOptionAdmin(ModelAdmin):
    model = AccountOption
    menu_label = 'Account Options'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class AccountCurrencyAdmin(ModelAdmin):
    model = AccountCurrency
    menu_label = 'Account Currency'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class PaymentMethodAdmin(ModelAdmin):
    model = PaymentMethod
    menu_label = 'Payment Methods'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


#     fields_end


class FieldGroup(ModelAdminGroup):
    menu_label = 'List Manager'
    menu_icon = 'folder-open-inverse'  # change as required
    menu_order = 300  # will put in 3rd place (000 being 1st, 100 2nd)
    items = (
    CategoryAdmin, StatusAdmin, BrokerTypeAdmin, LocationAdmin, RegulationAdmin, LicenseAdmin, TimezoneAdmin, TradingSoftwareAdmin,
    PlatformSupportedAdmin, ChatAdmin, SupportedLanguageAdmin, TrainingCourseAdmin, TradingTypeAdmin, MethodologyAdmin,
    TrainingToolAdmin, PricingModelAdmin, SystemTypeAdmin, TradingTypeAdmin, SignalAlertAdmin, AccountTypeAdmin,
    TradingInstrumentAdmin, RevenueModelAdmin, AccountOptionAdmin, AccountCurrencyAdmin, PaymentMethodAdmin)


class ProductsGroup(ModelAdminGroup):
    menu_label = 'Manage services'
    menu_icon = 'folder-open-inverse'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    items = (ServiceAdmin, ProductAdmin)


class CommentAdmin(ModelAdmin):
    model = Comment


# Now you just need to register your customised ModelAdmin class with Wagtail
# modeladmin_register(CategoryAdmin)
# modeladmin_register(ServiceAdmin)
modeladmin_register(ProductsGroup)
modeladmin_register(AffiliateAdmin)
modeladmin_register(CommentAdmin)
modeladmin_register(FieldGroup)


@hooks.register("insert_global_admin_js", order=100)
def global_admin_js():
    """Add /static/css/custom.js to the admin."""
    return format_html(
        '<script src="' + settings.STATIC_URL + 'js/custom_admin.js"></script>'
    )


@hooks.register("insert_global_admin_css", order=100)
def global_admin_css():
    return format_html(
        '<link rel="stylesheet" href="' + settings.STATIC_URL + 'css/custom_admin.css" type="text/css">'
    )
