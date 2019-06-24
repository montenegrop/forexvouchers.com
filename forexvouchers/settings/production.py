from .base import *

SECRET_KEY = 'l3l=c@)xb2wid_q9upki$ggwi^nj85)z^lie9qt*q0ojc&68+%'
ALLOWED_HOSTS = ['*'] 
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
DEBUG=False

try:
    from .local import *
except ImportError:
    pass
