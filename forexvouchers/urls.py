from django.conf import settings
from django.conf.urls import include, url
from django.contrib import admin
from django.urls import path

from wagtail.admin import urls as wagtailadmin_urls
from wagtail.core import urls as wagtail_urls
from wagtail.documents import urls as wagtaildocs_urls
from wagtailautocomplete.urls.admin import urlpatterns as autocomplete_admin_urls

from forexvouchers.views.api.Likes import LikesView
from forexvouchers.views.api.Search import SearchView
from forexvouchers.views import CommentsView, cloakedlinks
from forexvouchers.views.api.Subscribe import SubscribeView
from forexvouchers.views.api.Vouchers import VouchersView
from cms.admin.views import import_services, export_services
from forexvouchers.views.api.ForexServices import ForexServicesView as ServicesView
from forexvouchers.views.api import Services as ApiServices
from wagtail.contrib.sitemaps.views import sitemap

urlpatterns = [

    url('^sitemap\.xml$', sitemap),
    url(r'^robots\.txt', include('robots.urls')),


    url(r'^out/(.+)/$', cloakedlinks),
    url(r'^visit/(.+)/$', cloakedlinks),
    url(r'^go/(.+)/$', cloakedlinks),

    url(r'^django-admin/', admin.site.urls),
    url(r'^admin/autocomplete/', include(autocomplete_admin_urls)),
    url(r'^admin/import_service/', import_services),
    url(r'^admin/export_services/', export_services),
    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),

    # url(r'^search/$', search_views.search, name='search'),
    url(r'^api/comments', CommentsView.as_view()),
    url(r'^api/search', SearchView.as_view()),
    url(r'^api/vouchers', VouchersView.as_view()),
    url(r'^api/forex-services', ServicesView.as_view()),
    url(r'^api/services', ApiServices.get_services),
    url(r'^api/partners', ApiServices.get_partners),
    url(r'^api/subscribe', SubscribeView.as_view()),
    url(r'^api/likes', LikesView.as_view()),

    # For anything not caught by a more specific rule above, hand over to
    # Wagtail's page serving mechanism. This should be the last pattern in
    # the list:
    url(r'', include(wagtail_urls)),

    # Alternatively, if you want Wagtail pages to be served from a subpath
    # of your site, rather than the site root:
    #    url(r'^pages/', include(wagtail_urls)),
]

if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns
    import debug_toolbar

    urlpatterns = [
                      path('__debug__/', include(debug_toolbar.urls)),

                      # For django versions before 2.0:
                      # url(r'^__debug__/', include(debug_toolbar.urls)),

                  ] + urlpatterns

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
