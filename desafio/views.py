from django.shortcuts import render
from .models import Lista

def lista_list(request):
    desafio = Lista.objects.all() 
    return render(request, "desafio/lista_list.html", {"variavel": desafio})
