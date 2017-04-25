from django.conf.urls import url

from kaldb.views import (department_detail, faculty_detail,
                         module_detail, researcher_detail,
                         theme_detail, module_search)

urlpatterns = [
    url(r'^faculty/(?P<pk>\d+)/$', faculty_detail, name='faculty_detail'),
    url(r'^department/(?P<pk>\d+)/$', department_detail,
        name='department_detail'),
    url(r'^modules/$', module_search, name='module_search'),
    url(r'^modules/(?P<pk>\d+)/$', module_detail, name='module_detail'),
    url(r'^researcher/(?P<pk>\d+)/$', researcher_detail,
        name='researcher_detail'),
    url(r'^theme/(?P<pk>\d+)/$', theme_detail, name='theme_detail'),
]
