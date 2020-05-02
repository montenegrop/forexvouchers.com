from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver

from cms.helpers.cache import reset_cache_service, reset_cache_obj
from cms.models import Service, Comment, Offer, PromoCode, Discount


@receiver([post_save, post_delete], sender=Service)
def on_save(sender, instance, **kwargs):
   reset_cache_service(instance)

@receiver([post_save, post_delete], sender=Comment)
def on_save_comment(sender, instance, **kwargs):
   if instance.service:
      reset_cache_service(instance.service)
   reset_cache_obj(instance)

@receiver([post_save, post_delete], sender=Offer)
def on_save_offer(sender, instance, **kwargs):
   if instance.service:
      reset_cache_service(instance.service)
   reset_cache_obj(instance)

@receiver([post_save, post_delete], sender=Discount)
def on_save_dicount(sender, instance, **kwargs):
   if instance.service:
      reset_cache_service(instance.service)
   reset_cache_obj(instance)

@receiver([post_save, post_delete], sender=PromoCode)
def on_save_promocode(sender, instance, **kwargs):
   if instance.service:
      reset_cache_service(instance.service)
   reset_cache_obj(instance)