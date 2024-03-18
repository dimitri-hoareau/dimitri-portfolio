from django.db import models
from django.contrib.postgres.fields import ArrayField

class Project(models.Model):
    name = models.CharField(max_length=100)
    short_description = models.CharField(max_length=200)
    long_description = models.TextField()
    tools = ArrayField(models.CharField(max_length=100))
    link = models.URLField()
    picture = models.ImageField(upload_to='project_pictures', default='Untitled.png')

    def __str__(self):
        return self.name

