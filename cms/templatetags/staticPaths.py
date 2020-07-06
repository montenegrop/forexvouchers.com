from django.template import Library
from django.templatetags.static import StaticNode


register = Library()


class CustomStaticNode(StaticNode):
    def url(self, context):
        path = self.path.resolve(context)
        full_path =  self.handle_simple(path)
        return full_path.replace('/fonts/', '/dist/styles/')

@register.tag('distRoute')
def distRoute(parser, token):
    return CustomStaticNode.handle_token(parser, token)

