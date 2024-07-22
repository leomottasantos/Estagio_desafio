from django.contrib import admin
from django.urls import path

from desafio.views import lista_list

urlpatterns = [
    path('admin/', admin.site.urls),
    path("", lista_list),

]
