from django.contrib.gis import admin
from kaldb.models import (Collaboration, Institution, Interest, Module,
                          OutReachEvent, Researcher, Specialism, Theme)
from kaldb.models_authlists import (AwardType, Department, Faculty,
                                    InstitutionCategory, JobPosition, JobRole,
                                    OutReachCity, OutReachCountry,
                                    OutReachFrequency, OutReachLocation,
                                    OutReachMedium, StageType, Title)


class ThemeAdmin(admin.ModelAdmin):
    filter_horizontal = ('modules', 'specialisms')


class OutReachLocationAdmin(admin.OSMGeoAdmin):
    openlayers_url = 'https://openlayers.org/api/2.13.1/OpenLayers.js'


# Inline for OutReachEvent
class OutReachEventInline(admin.TabularInline):
    model = OutReachEvent
    classes = ['grp-collapse grp-closed']


class PIInline(admin.TabularInline):
    model = Collaboration.pi.through
    classes = ['grp-collapse grp-closed']
    verbose_name = 'Collaboration as PI'
    verbose_name_plural = 'Collaborations as PI'


class CIInline(admin.TabularInline):
    model = Collaboration.coinv.through
    classes = ['grp-collapse grp-closed']
    verbose_name = 'Collaboration as CI'
    verbose_name_plural = 'Collaborations as CI'


# Researcher Admin Panel
class ResearcherAdmin(admin.ModelAdmin):
    fieldsets = (
        ('Personal Information', {
            'fields': ('title', ('first_name', 'middle_name', 'last_name'),
                       'image_file', 'image_url')
        }),
        ('Job', {
            'fields': ('external', 'department', 'position', 'role')
        }),
        ('Links', {
            'classes': ('grp-collapse grp-closed',),
            'fields': ('pure_url', 'profile_url', 'other_url')
        }),
        ('Interests', {
            'classes': ('grp-collapse grp-closed',),
            'fields': ('research_interests', 'teaching_interests',
                       'specialisms')
        }),
        ('Connections', {
            'classes': ('grp-collapse grp-closed',),
            'fields': ('institutions', 'locations')
        }),
        ('Notes', {
            'classes': ('grp-collapse grp-closed',),
            'fields': ('notes',)
        })
    )
    filter_horizontal = ['research_interests', 'teaching_interests',
                         'specialisms', 'institutions', 'locations']

    list_display = ['__unicode__', 'department', 'position', 'role']
    list_filter = ['department', 'position', 'role']

    inlines = [
        OutReachEventInline,
        PIInline,
        CIInline,
    ]

    raw_id_fields = filter_horizontal
    related_lookup_fields = {
        'm2m': raw_id_fields
    }


class RoleThemeInline(admin.TabularInline):
    model = Theme.roles.through
    classes = ['grp-collapse grp-closed']


class ModuleThemeInline(admin.TabularInline):
    model = Theme.modules.through
    classes = ['grp-collapse grp-closed']


# Module Admin Panel
class ModuleAdmin(admin.ModelAdmin):
    filter_horizontal = ('convenors', 'level', 'locations',
                         'institutions')

    inlines = [
        ModuleThemeInline,
    ]

    raw_id_fields = filter_horizontal
    related_lookup_fields = {
        'm2m': raw_id_fields
    }

# Job Role Admin


class JobRoleAdmin(admin.ModelAdmin):
    inlines = [
        RoleThemeInline,
    ]


class CollaborationAdmin(admin.ModelAdmin):
    filter_horizontal = ('pi', 'coinv', 'extcoapp', 'accholder')

    raw_id_fields = filter_horizontal
    related_lookup_fields = {
        'm2m': raw_id_fields
    }


# Models
admin.site.register(Interest)
admin.site.register(Module, ModuleAdmin)
admin.site.register(OutReachEvent)
admin.site.register(Researcher, ResearcherAdmin)
admin.site.register(Specialism)
admin.site.register(Institution)
admin.site.register(Collaboration, CollaborationAdmin)

# Authlists
admin.site.register(Theme, ThemeAdmin)
admin.site.register(Department)
admin.site.register(Faculty)
admin.site.register(JobPosition)
admin.site.register(JobRole, JobRoleAdmin)
admin.site.register(OutReachCity)
admin.site.register(OutReachCountry)
admin.site.register(OutReachLocation, OutReachLocationAdmin)
admin.site.register(OutReachMedium)
admin.site.register(OutReachFrequency)
admin.site.register(Title)
admin.site.register(InstitutionCategory)
admin.site.register(AwardType)
admin.site.register(StageType)
