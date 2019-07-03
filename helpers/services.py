class HomePage(RoutablePageMixin, Page):
    body = RichTextField(blank=True)

    def get_context(self, request):
        context = super(HomePage, self).get_context(request)
        context['table_rows'] = []
        for service in Service.objects.all():
            attrs = service.getAttributes()
            attrs['name'] = service.name
            context['table_rows'].append(attrs)
        return context

    content_panels = Page.content_panels + [
        FieldPanel('body', classname="full")
    ]

