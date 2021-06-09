"""board_manager URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/dev/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path, re_path
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated

SchemaViewClass = get_schema_view(
    openapi.Info(
        title="Django Architecture API",
        default_version='v1',
        description="The Django Architecture API",
    ),
    authentication_classes=(SessionAuthentication,),
    permission_classes=(IsAuthenticated,),
)

urlpatterns = [
    path('core/', include('board_manager.djangoapps.core.urls')),
    path('admin/', admin.site.urls),
    # re_path(r'^swagger(?P<format>\.json|\.yaml)$', SchemaViewClass.without_ui(cache_timeout=0), name='schema-json'),
    re_path(r'^swagger/$', SchemaViewClass.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    # re_path(r'^redoc/$', SchemaViewClass.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
]
