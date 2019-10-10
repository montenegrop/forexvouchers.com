from .base import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'l3l=c@)xb2wid_q9upki$ggwi^nj85)z^lie9qt*q0ojc&68+%'

# SECURITY WARNING: define the correct hosts in production!
ALLOWED_HOSTS = ['*']

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'





try:
    from .local import *
except ImportError:
    pass
