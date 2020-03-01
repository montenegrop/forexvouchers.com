from django.core.management.base import BaseCommand

from cms.models import NewsSource, NewsItem
import feedparser
from time import mktime
from datetime import datetime

class Command(BaseCommand):
    help = 'Update news'

    def handle(self, *args, **options):
        sources = NewsSource.objects.filter(active=True)
        NewsItem.objects.all().delete()

        for source in sources:
            print('Fetching ' + source.title)
            feed = feedparser.parse(source.url)

            for entry in feed['entries']:
                if entry:
                    item = NewsItem(source=source)
                    item.title = entry.title
                    item.description = entry.description
                    item.link = entry.link
                    item.date = datetime.fromtimestamp(mktime(entry.published_parsed))
                    item.save()





