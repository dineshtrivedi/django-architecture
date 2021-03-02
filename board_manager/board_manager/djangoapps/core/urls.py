from django.urls import path

from . import views

urlpatterns = [
    path('hello-world-view-dataclass', views.HelloWorldViewDataclass.as_view(), name='hello_world_view'),
    path('hello-world-many-view-dataclass', views.HelloWorldManyViewDataclass.as_view(), name='hello_world_many_view'),
]