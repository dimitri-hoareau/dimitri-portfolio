from rest_framework.serializers import ModelSerializer
 
from mainpage.models import Project
 
class ProjectSerializer(ModelSerializer):
 
    class Meta:
        model = Project
        fields = ['id', 'name', 'short_description', 'long_description', 'tools', 'link']



