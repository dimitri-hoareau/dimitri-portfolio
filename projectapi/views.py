from rest_framework.views import APIView
from rest_framework.response import Response
 
from mainpage.models import Project
from projectapi.serializers import ProjectSerializer
 
class ProjectAPIView(APIView):
 
    def get(self, *args, **kwargs):
        projects = Project.objects.all()
        serializer = ProjectSerializer(projects, many=True)
        return Response(serializer.data)
