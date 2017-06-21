from django.shortcuts import get_object_or_404, render

from kaldb.models_authlists import Department, Faculty
from kaldb.models import Module, Researcher, Theme
from haystack.query import SearchQuerySet
from haystack.inputs import AutoQuery

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


# Module faceted search
def module_search(request):

    if 'q' in request.GET:
        search_query = request.GET['q']
    else:
        search_query = None

    # sqs of modules
    sqs = SearchQuerySet().models(Module)

    # query - this isn't used at the moment, but futureproofing
    if search_query:
        sqs = sqs.filter(content=AutoQuery(request.GET['q']))

    # Check if we need to narrow it down...
    for facet in request.GET.getlist('selected_facets'):
        sqs = sqs.narrow(facet)

    # Facet
    sqs = sqs.facet('themes')

    facets = sqs.facet_counts()

    full_path = request.get_full_path()
    if '?' not in full_path:
        full_path = "{}?q=".format(full_path)

    context = {
        'search_results': sqs,
        'search_query': search_query,
        'facets': facets,
        'full_path': full_path,
    }
    return render(request, 'kaldb/module_search.html', context)
