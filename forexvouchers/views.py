from django.http import HttpResponseRedirect

def savecomments(request):
    print(request.POST)
    return HttpResponseRedirect('/services/' + request.POST['slug'])
