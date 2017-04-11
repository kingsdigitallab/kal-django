from django.contrib import admin
from kaldb.models import (Interest, OutReachEvent, Researcher, Specialism,
                          Module)
from kaldb.models_authlists import (Department, Faculty, JobPosition,
                                    JobRole, OutReachCity, OutReachCountry,
                                    OutReachFrequency, OutReachLocation,
                                    OutReachMedium, Title)


# Inline for OutReachEvent
class OutReachEventInline(admin.TabularInline):
    model = OutReachEvent


# Researcher Admin Panel
class ResearcherAdmin(admin.ModelAdmin):
    filter_horizontal = ('research_interests', 'teaching_interests',
                         'specialisms',)
    inlines = [
        OutReachEventInline,
    ]


# Module Admin Panel - avoid conflicting name
class ModuleAdmin(admin.ModelAdmin):
    filter_horizontal = ('convenors', 'level',)


# Models
admin.site.register(Interest)
admin.site.register(Module, ModuleAdmin)
admin.site.register(OutReachEvent)
admin.site.register(Researcher, ResearcherAdmin)
admin.site.register(Specialism)


# Authlists
admin.site.register(Department)
admin.site.register(Faculty)
admin.site.register(JobPosition)
admin.site.register(JobRole)
admin.site.register(OutReachCity)
admin.site.register(OutReachCountry)
admin.site.register(OutReachLocation)
admin.site.register(OutReachMedium)
admin.site.register(OutReachFrequency)
admin.site.register(Title)
