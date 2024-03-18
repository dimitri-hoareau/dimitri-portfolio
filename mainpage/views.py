from django.shortcuts import render
from mainpage.models import Project


def index(request):
    project = Project.objects.all()
    return render(request, 'mainpage/index.html', {'project': project})
