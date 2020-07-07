from django.utils.html import format_html
from wagtail.contrib.modeladmin.views import CreateView
from cms.models import Comment
from wagtail.contrib.modeladmin.options import ModelAdmin


class CreatePlanningView(CreateView):
    def get_instance(self):
        instance = super().get_instance()

        answer_comment = self.request.GET["answer_comment"] if "answer_comment" in self.request.GET else None

        if answer_comment:
            parent_id = int(answer_comment)
            parent = Comment.objects.get(pk=parent_id)
            instance.parent_comment = parent
            instance.service = parent.service
            instance.active = True

        # dont forget to return the instance
        return instance


class CommentAdmin(ModelAdmin):
    create_template_name = 'admin/comments_create.html'
    edit_template_name = 'admin/comments_create.html'
    create_view_class = CreatePlanningView

    model = Comment

    list_display = ('id', 'answers', 'service', 'country', 'name', 'active', 'created_at')
    list_filter = ('active', 'created_at', 'country')
    search_fields = ('id', 'service__name', 'country', 'name', 'active')

    def get_queryset(self, request):
        return Comment.objects.filter(parent_comment__isnull=True)

    def answers(self, obj):
        try:
            ans = Comment.objects.get(parent_comment=obj)
            return format_html(
                f'<a href="/admin/cms/comment/edit/{ans.id}/">(1 answer)</a>'
            )
        except:
            return format_html(
                f'<a class="button" href="/admin/cms/comment/create/?answer_comment={obj.id}">Answer this comment</a>'
            )

