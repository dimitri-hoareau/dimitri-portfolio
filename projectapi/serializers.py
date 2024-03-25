from rest_framework.serializers import ModelSerializer
 
from mainpage.models import Project, Tool
 


class ToolSerializer(ModelSerializer):
    class Meta:
        model = Tool
        fields = ['id', 'name']


class ProjectSerializer(ModelSerializer):
    
    tools = ToolSerializer(many=True, read_only=True)
 
    class Meta:
        model = Project
        fields = ['id', 'name', 'short_description', 'long_description', 'tools', 'link', 'picture']



