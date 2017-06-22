from django.conf.urls import url

from kaldb.views import (department_detail, faculty_detail,
                         module_detail, researcher_detail,
                         theme_detail, module_search,
                         iframe_lander, iframe_theme,
                         iframe_module)

urlpatterns = [
    url(r'^faculty/(?P<pk>\d+)/$', faculty_detail, name='faculty_detail'),
    url(r'^department/(?P<pk>\d+)/$', department_detail,
        name='department_detail'),
    url(r'^modules/$', module_search, name='module_search'),
    url(r'^modules/(?P<pk>\d+)/$', module_detail, name='module_detail'),
    url(r'^researcher/(?P<pk>\d+)/$', researcher_detail,
        name='researcher_detail'),
    url(r'^theme/(?P<pk>\d+)/$', theme_detail, name='theme_detail'),
    url(r'^landing/$', iframe_lander, name='landing_page'),
    url(r'^landing/themes/(?P<name>\w+)/$', iframe_theme, name='theme_page'),
    url(r'^module/(?P<pk>\d+)/$', iframe_module, name='module_page'),
]
