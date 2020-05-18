from captcha.fields import ReCaptchaField
from django.core.mail.backends.smtp import EmailBackend
from django.forms import widgets
from mailchimp3 import MailChimp
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel, MultiFieldPanel, FieldRowPanel
from wagtail.contrib.forms.models import AbstractEmailForm
from wagtail.core.fields import RichTextField
from wagtail.core.models import Site
from wagtailcaptcha.forms import WagtailCaptchaFormBuilder
from wagtailcaptcha.models import WagtailCaptchaEmailForm
from wagtailschemaorg.models import PageLDMixin
from wagtailschemaorg.utils import extend

from django.db import models

from cms.models import GeneralSettings


class WagtailCaptchaFormBuilderCustom(WagtailCaptchaFormBuilder):

    @property
    def formfields(self):
        fields = super(WagtailCaptchaFormBuilderCustom, self).formfields
        site_settings = GeneralSettings.for_site(Site.objects.get(is_default_site=True))
        public_key = site_settings.recaptcha_site_key
        private_key = site_settings.recaptcha_secret_key
        fields[self.CAPTCHA_FIELD_NAME] = ReCaptchaField(label='', public_key=public_key,
                                                         private_key=private_key)

        return fields


def social_media_settings(args):
    pass


class ContactPage(WagtailCaptchaEmailForm, PageLDMixin):
    template = "../templates/cms/contact_page.html"
    landing_page_template = "../templates/cms/contact_page_landing.html"
    form_builder = WagtailCaptchaFormBuilderCustom

    def get_form(self, *args, **kwargs):
        form = super().get_form(*args, **kwargs)
        for name, field in form.fields.items():
            # here we want to adjust the widgets on each field
            # if the field is a TextArea - adjust the rows
            if isinstance(field.widget, widgets.Textarea):
                field.widget.attrs.update({'rows': '5'})
            # for all fields, get any existing CSS classes and add 'form-control'
            # ensure the 'class' attribute is a string of classes with spaces
            css_classes = field.widget.attrs.get('class', '').split()
            css_classes.append('form-control')
            field.widget.attrs.update({'class': ' '.join(css_classes)})
        return form

    def process_form_submission(self, form):
        email = form.cleaned_data['email']
        social_media_settings = GeneralSettings.for_site(Site.objects.get(is_default_site=True))
        try:
            client = MailChimp(social_media_settings.mailchimp_api_key)
            user_data = client.lists.members.create(social_media_settings.mailchimp_list_id, {
                'email_address': email,
                'status': 'subscribed',
            })
        finally:
            return super(ContactPage, self).process_form_submission(form)

    def ld_entity(self):
        return extend(super().ld_entity(), {
            '@type': 'Organization',
            'name': 'Forex Vouchers',
        })

    contact_title = models.CharField(max_length=200, blank=True, default=None, null=True)
    Thank_you_box = models.CharField(max_length=300, blank=True, default=None, null=True)
    Thank_you_follow = models.CharField(max_length=150, blank=True, default=None, null=True)
    Thank_you_mail = models.CharField(max_length=100, blank=True, default=None, null=True)

    content_panels = AbstractEmailForm.content_panels + [
        InlinePanel('form_fields', label='Form Fields'),
        FieldPanel('contact_title'),
        FieldPanel('Thank_you_box'),
        FieldPanel('Thank_you_follow'),
        FieldPanel('Thank_you_mail'),

        MultiFieldPanel([
            FieldRowPanel([
                FieldPanel('from_address', classname="col6"),
                FieldPanel('to_address', classname="col6"),
            ]),
            FieldPanel("subject"),
        ], heading="Email Settings"),
    ]


class NotificationBackend(EmailBackend):

    def __init__(self, host=None, port=None, username=None, password=None,
                 use_tls=None, fail_silently=False, use_ssl=None, timeout=None,
                 ssl_keyfile=None, ssl_certfile=None,
                 **kwargs):
        site_settings = GeneralSettings.for_site(Site.objects.get(is_default_site=True))
        email_use_tls = site_settings.smtp_use_tls
        email_host = site_settings.smtp_host
        email_port = site_settings.smtp_port
        email_host_user = site_settings.smtp_username
        email_host_password = site_settings.smtp_password
        email_use_ssl = site_settings.smtp_use_ssl

        super().__init__(host=email_host, port=email_port, username=email_host_user, password=email_host_password,
                         use_tls=email_use_tls, fail_silently=False, use_ssl=email_use_ssl, timeout=None,
                         ssl_keyfile=None, ssl_certfile=None,
                         **kwargs)
