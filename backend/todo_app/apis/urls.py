from django.urls import path

from .views import ListTdo, DetailTodo

urlpatterns = [
    path('', ListTdo.as_view()),
    path('<int:pk>/', DetailTodo.as_view()),
]
