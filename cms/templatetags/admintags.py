from django.template import Library
from django.utils.html import mark_safe

from cms.models import Comment

register = Library()

template_comment = '''
<div class="comment_template">
    <b>Answering comment by {name}:</b>
    <li>Starred: {stars}</li>
    <li>Created: {created}</li>
    
    <pre>{review}</pre>

</div>
'''

@register.simple_tag(takes_context=True)
def loadparentcomment(context, answer_comment):
    if answer_comment:
        parent_id = int(answer_comment)
        parent = Comment.objects.get(pk=parent_id)
        return mark_safe(template_comment.format(name=parent.name, review=parent.review, stars=parent.stars, created=parent.created_at.strftime("%b %d %Y %H:%M:%S")))

    return ""

@register.simple_tag(takes_context=True)
def loadanswer(context, id):
    try:
        ans = Comment.objects.get(parent_comment_id=int(id))
        return mark_safe(f"<a class='button' href='/admin/cms/comment/edit/{ans.id}/'>See answer<a/>")
    except:
        return mark_safe(f"<a class='button' href='/admin/cms/comment/create/?answer_comment={id}'>Answer this comment<a/>")



