import datetime

from django.db.models import Q
from wagtail.contrib.modeladmin.options import (
    ModelAdmin, ModelAdminGroup, modeladmin_register)
from wagtail.core import hooks

from django.contrib.staticfiles.templatetags.staticfiles import static
from django.utils.html import format_html
from django.conf import settings
from .models import Category, Service, Attribute, Voucher, Affiliate, Product, Comment, PromoCode, Discount, Offer
from .models import Status, BrokerType, Location, Regulation, License
from .models import Timezone, TradingSoftware, PlatformSupported
from .models import Chat, SupportedLanguage
from .models import TrainingCourse, TradingType, Methodology, TradingTool, PricingModel, SystemType, TradingType, \
    SignalAlert, SecurityOfFunds
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
    index_template_name = 'admin/service_index.html'
    index_view_extra_js = ['js/service_index.js']
    model = Service
    menu_label = 'Service'  # ditch this to use verbose_name_plural from model
    menu_icon = 'pilcrow'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    add_to_settings_menu = False  # or True to add your model to the Settings sub-menu
    exclude_from_explorer = False  # or True to exclude pages of this type from Wagtail's explorer view
    list_display = ('name', 'getCategoriesLabels', 'getVouchersColumn', 'getComments', 'premium')
    list_filter = ('premium', 'category')
    search_fields = ('name',)

    def getCategoriesLabels(self, obj):
        return ', '.join([cat.name for cat in obj.category.all()])

    def getVouchersColumn(self, obj):

        discount_counts = Discount.objects.filter(service=obj).filter(Discount.not_expired_condition()).count()
        promocodes_counts = PromoCode.objects.filter(service=obj).filter(PromoCode.not_expired_condition()).count()
        offers_counts = Offer.objects.filter(service=obj).filter(Offer.not_expired_condition()).count()

        return (format_html(
            f'<li><a href="/admin/cms/discount/?service__id__exact={obj.id}">Discounts ({discount_counts})</a></li>'
            f'<li><a href="/admin/cms/offer/?service__id__exact={obj.id}">Offers ({offers_counts})</a></li>'
            f'<li><a href="/admin/cms/promocode/?service__id__exact={obj.id}">Promocodes ({promocodes_counts})</a></li>\n'
        ))

    def getComments(self, obj):
        count = obj.comment_set.filter(active=True).count()
        return (format_html('<a href="/admin/cms/comment/?service__id__exact={}">Comments ({})</a>'
        , obj.id, count))

    getCategoriesLabels.short_description = 'categories'
    getVouchersColumn.short_description = 'vouchers'
    getComments.short_description = 'comments'



class AttributeAdmin(ModelAdmin):
    model = Attribute
    menu_label = 'Custom Attributes'


class VoucherAdmin(ModelAdmin):
    model = Voucher

    list_display = ('name', 'service', 'slug', 'expires', 'never_expires')
    search_fields = ('name', 'service__name', 'slug')
    list_filter = ('expires', 'never_expires')


class PromoCodeAdmin(VoucherAdmin):
    menu_label = 'Promo Codes'
    model = PromoCode


class DiscountAdmin(VoucherAdmin):
    menu_label = 'Discounts'
    model = Discount


class OfferAdmin(VoucherAdmin):
    menu_label = 'Offers'
    model = Offer


class AffiliateAdmin(ModelAdmin):
    model = Affiliate

    list_display = ('cloakedLink', '__str__', 'slug', 'linked_services', 'linked_products', 'linked_vouchers')
    search_fields = ('cloakedLink', 'slug', 'services__name', 'products__name', 'vouchers__name')

    def linked_services(self, affiliate):
        return [service.name for service in affiliate.services.all()]

    def linked_products(self, affiliate):
        return [service.name for service in affiliate.products.all()]

    def linked_vouchers(self, affiliate):
        return [service.name for service in affiliate.vouchers.all()]

    def linked_to(self, affiliate):
        linked_resources = self.linked_services(affiliate) + self.linked_products(
            affiliate) + self.linked_vouchers(affiliate)
        return ','.join(linked_resources)


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
    search_fields = ('code', 'location__name')


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


class TradingToolAdmin(ModelAdmin):
    model = TradingTool
    menu_label = 'Trading Tools'

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


class SecurityOfFundAdmin(ModelAdmin):
    model = SecurityOfFunds
    menu_label = 'Security of funds'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class SecurityOfFundAdmin(ModelAdmin):
    model = SecurityOfFunds
    menu_label = 'Security of funds'

    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


class FieldGroup(ModelAdminGroup):
    menu_label = 'List Manager'
    menu_icon = 'folder-open-inverse'  # change as required
    menu_order = 300  # will put in 3rd place (000 being 1st, 100 2nd)
    items = (
        CategoryAdmin, StatusAdmin, BrokerTypeAdmin, LocationAdmin, RegulationAdmin, LicenseAdmin, TimezoneAdmin,
        TradingSoftwareAdmin,
        PlatformSupportedAdmin, ChatAdmin, SupportedLanguageAdmin, TrainingCourseAdmin, TradingTypeAdmin,
        MethodologyAdmin,
        TradingToolAdmin, PricingModelAdmin, SystemTypeAdmin, TradingTypeAdmin, SignalAlertAdmin, AccountTypeAdmin,
        TradingInstrumentAdmin, RevenueModelAdmin, AccountOptionAdmin, AccountCurrencyAdmin, PaymentMethodAdmin,
        SecurityOfFundAdmin)


class ProductsGroup(ModelAdminGroup):
    menu_label = 'Manage services'
    menu_icon = 'folder-open-inverse'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    items = (ServiceAdmin, ProductAdmin,)


class VouchersGroup(ModelAdminGroup):
    menu_label = 'Vouchers'
    menu_icon = 'folder-open-inverse'  # change as required
    menu_order = 200  # will put in 3rd place (000 being 1st, 100 2nd)
    items = (PromoCodeAdmin, DiscountAdmin, OfferAdmin)


class CommentAdmin(ModelAdmin):
    model = Comment

    list_display = ('id', 'service', 'country', 'name', 'active', 'created_at')
    list_filter = ('active', 'created_at', 'country')
    search_fields = ('id', 'service__name', 'country', 'name', 'active')


# Now you just need to register your customised ModelAdmin class with Wagtail
# modeladmin_register(CategoryAdmin)
modeladmin_register(ProductsGroup)
modeladmin_register(VouchersGroup)
modeladmin_register(AffiliateAdmin)
modeladmin_register(CommentAdmin)
modeladmin_register(FieldGroup)


# @hooks.register("insert_global_admin_js", order=100)
# def global_admin_js():
#     """Add /static/css/custom.js to the admin."""
#     return format_html(
#         '<script src="' + settings.STATIC_URL + 'js/custom_admin.js"></script>'
#     )




@hooks.register("insert_global_admin_css", order=100)
def global_admin_css():
    return format_html(
        '<link rel="stylesheet" href="' + settings.STATIC_URL + 'css/custom_admin.css" type="text/css">'
    )
