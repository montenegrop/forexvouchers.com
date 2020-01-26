from django.apps import AppConfig


class CMSConfig(AppConfig):
    name = 'cms'
    verbose_name = 'CMS configuration'

    def ready(self):
        import cms.cache_hooks