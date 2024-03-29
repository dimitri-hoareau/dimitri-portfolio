from django.shortcuts import render
from mainpage.models import Project


def index(request):
    project = Project.objects.all()
    return render(request, 'mainpage/index.html', {'project': project})

def mentions(request):
    return render(request, 'mainpage/mentions.html')

def cookies(request):
    return render(request, 'mainpage/cookies.html')
