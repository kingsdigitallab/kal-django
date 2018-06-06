from django.conf.urls import url
from kaldb.views import (department_detail, faculty_detail, iframe_lander,
                         iframe_module, iframe_researcher, iframe_theme,
                         module_detail, researcher_detail,
                         theme_detail)

urlpatterns = [
    url(r'^landing/$', iframe_lander, name='landing_page'),
    url(r'^landing/themes/(?P<name>\w+)/$', iframe_theme, name='theme_page'),
    url(r'^department/(?P<pk>\d+)/$', department_detail,
        name='department_detail'),
    url(r'^faculty/(?P<pk>\d+)/$', faculty_detail, name='faculty_detail'),
    url(r'^modules/(?P<pk>\d+)/$', module_detail, name='module_detail'),
    url(r'^module/(?P<pk>\d+)/$', iframe_module, name='module_page'),
    url(r'^researchers/(?P<pk>\d+)/$', iframe_researcher,
        name='researcher_page'),
    url(r'^researcher/(?P<pk>\d+)/$', researcher_detail,
        name='researcher_detail'),
    url(r'^theme/(?P<pk>\d+)/$', theme_detail, name='theme_detail'),
]
