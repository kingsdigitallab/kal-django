from django.shortcuts import get_object_or_404, render
from kaldb.models import Module, Researcher, Theme
from kaldb.models_authlists import Department, Faculty


# Iframe landing page
def iframe_lander(request):

    context = {
        'themes': Theme.objects.all()
    }
    return render(request, 'kaldb/landing_page.html', context)


def iframe_theme(request, name):

    theme = get_object_or_404(Theme, short_name=name)
    context = {
        'theme': theme,
    }
    return render(request, 'kaldb/theme_page.html', context)


def iframe_module(request, pk):

    module = get_object_or_404(Module, pk=pk)
    context = {
        'module': module,
    }
    return render(request, 'kaldb/module_page.html', context)


def iframe_researcher(request, pk):

    researcher = get_object_or_404(Researcher, pk=pk)
    context = {
        'researcher': researcher,
    }
    return render(request, 'kaldb/researcher_page.html', context)

# Department view


def department_detail(request, pk):

    department = get_object_or_404(Department, pk=pk)
    context = {
        'department': department,
    }
    return render(request, 'kaldb/department_detail.html', context)


# Faculty view
def faculty_detail(request, pk):

    faculty = get_object_or_404(Faculty, pk=pk)
    context = {
        'faculty': faculty,
    }
    return render(request, 'kaldb/faculty_detail.html', context)


# module view
def module_detail(request, pk):

    module = get_object_or_404(Module, pk=pk)
    context = {
        'module': module,
    }
    return render(request, 'kaldb/module_detail.html', context)


# researcher view
def researcher_detail(request, pk):

    researcher = get_object_or_404(Researcher, pk=pk)
    context = {
        'researcher': researcher,
    }
    return render(request, 'kaldb/researcher_detail.html', context)


# theme view
def theme_detail(request, pk):

    theme = get_object_or_404(Theme, pk=pk)
    context = {
        'theme': theme,
    }
    return render(request, 'kaldb/theme_detail.html', context)
