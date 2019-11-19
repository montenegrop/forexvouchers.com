import os
from .base import *

SECRET_KEY = 'l3l=c@)xb2wid_q9upki$ggwi^nj85)z^lie9qt*q0ojc&68+%'
ALLOWED_HOSTS = ['*']
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
DEBUG = False

MEDIA_ROOT = '/var/www/media'


MYSQL_DATABASE_NAME = os.environ.get('MYSQL_DATABASE_NAME', 'fxvouchers')
MYSQL_USER = os.environ.get('MYSQL_USER', 'fxvouchers')
MYSQL_PASSWORD = os.environ.get('MYSQL_PASSWORD', 'password')
MYSQL_HOST = os.environ.get('MYSQL_HOST', '127.0.0.1')
MYSQL_PORT = os.environ.get('MYSQL_PORT', '3306')
MEMCACHED_LOCATION = os.environ.get('MYSQL_PORT', '127.0.0.1:11211')

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': MYSQL_DATABASE_NAME,
        'USER': MYSQL_USER,
        'PASSWORD': MYSQL_PASSWORD,
        'HOST': MYSQL_HOST,
        'PORT': MYSQL_PORT,
    }
}


LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse',
        },
        'require_debug_true': {
            '()': 'django.utils.log.RequireDebugTrue',
        },
    },
    'formatters': {
        'django.server': {
            '()': 'django.utils.log.ServerFormatter',
            'format': '[%(server_time)s] %(message)s',
        }
    },
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/forexvouchers-debug.log',

        },
        'console': {
            'level': 'INFO',
            'filters': ['require_debug_true'],
            'class': 'logging.StreamHandler',
        },
        # Custom handler which we will use with logger 'django'.
        # We want errors/warnings to be logged when DEBUG=False
        'console_on_not_debug': {
            'level': 'WARNING',
            'filters': ['require_debug_false'],
            'class': 'logging.StreamHandler',
        },
        'django.server': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'formatter': 'django.server',
        },
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        '': {
            'handlers': ['console', 'file'],
            'level': 'INFO',
        },
        'django': {
            'handlers': ['console', 'mail_admins', 'console_on_not_debug'],
            'level': 'INFO',
        },
        'django.server': {
            'handlers': ['django.server'],
            'level': 'INFO',
            'propagate': False,
        },
    }
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
        'LOCATION': MEMCACHED_LOCATION,
    }
}

try:
    from .local import *
except ImportError:
    pass
