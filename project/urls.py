"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
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
#hello

from django.contrib import admin
from django.urls import path
from api import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('register/', views.register), 
    path('login/', views.login), 
    path('profile/',views.profile),
    path('edit/',views.edit),
    path('edit1/<email>',views.edit1),
    path('admin1/',views.getadmindata),
    path('admin2/<email>',views.deleteadmindata),
    path('email/',views.emailreq),
    path("home/",views.register_home),
    path("register1/",views.register_view)
]

if settings.DEBUG:
        urlpatterns+= static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)
        urlpatterns+= static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
