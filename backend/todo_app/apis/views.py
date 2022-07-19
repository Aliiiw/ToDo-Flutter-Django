from django.shortcuts import render
from todos import models
from rest_framework import generics

from .serializers import TodoSerializier


class ListTdo(generics.ListCreateAPIView):
    queryset = models.Todo.objects.all()
    serializer_class = TodoSerializier
    

class DetailTodo(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Todo.objects.all()
    serializer_class = TodoSerializier