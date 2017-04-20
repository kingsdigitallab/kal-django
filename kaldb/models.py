from __future__ import unicode_literals

from django.db import models
from models_authlists import (Department, JobPosition, JobRole, ModuleLevel,
                              OutReachFrequency, OutReachLocation,
                              OutReachMedium, Title, InstitutionCategory)


# An interest. This can be teaching/research
# This has been left open to allow future links between interests...
# Perhaps this could be auto-complete free text in the admin?
class Interest(models.Model):
    name = models.CharField(verbose_name='Interest Name', max_length=1024,
                            blank=False)
    description = models.TextField(verbose_name='Description', blank=True,
                                   help_text='An optional description of the\
                                   interest, to aid in matching/searching')
    related_interests = models.ManyToManyField('self',
                                               verbose_name='Related\
                                               Interests')

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Specialisms
class Specialism(models.Model):
    name = models.CharField(verbose_name='Specialism Name', max_length=1024,
                            blank=False, help_text='Brief name given to the\
                            specialism')
    description = models.TextField(verbose_name='Description', blank=True,
                                   help_text="An optional description of\
                                   the specialism")
    london_related = models.BooleanField(verbose_name='London Related?',
                                         default=True, help_text='Is this\
                                         specialism related to London?')
    kcl_related = models.BooleanField(verbose_name='KCL Related?',
                                      default=True, help_text='Was this\
                                      research performed at KCL?')

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Main Person/Researcher Model
class Researcher(models.Model):
    # Personal
    title = models.ForeignKey(Title, verbose_name='Title',
                              blank=True, null=True)
    first_name = models.CharField(verbose_name='First Name', max_length=120,
                                  blank=False)
    middle_name = models.CharField(verbose_name='Middle Name(s)',
                                   max_length=120, blank=True)
    last_name = models.CharField(verbose_name='Last Name', max_length=120,
                                 blank=False)

    # Department
    department = models.ForeignKey(Department, null=True)

    # Job
    position = models.ForeignKey(JobPosition, verbose_name='Job Position',
                                 help_text='e.g. Lecturer, Professor...',
                                 blank=True, null=True)
    role = models.ForeignKey(JobRole, help_text='e.g. \'in Roman Sculpture\'',
                             blank=True, null=True)

    # Contact Details
    email = models.CharField(verbose_name='E-Mail Address', max_length=120,
                             blank=True)
    phone = models.CharField(verbose_name='Telephone Number', max_length=120,
                             blank=True, help_text="For KCL staff a 4 digit\
                             extension is sufficient")
    can_email = models.BooleanField(verbose_name='Can E-mail?', default=True,
                                    help_text='Is this person willing to be\
                                    contacted by e-mail?')
    can_phone = models.BooleanField(verbose_name='Can Phone?', default=True,
                                    help_text='Is this person willing to be\
                                    contacted by phone?')

    # URLS
    pure_url = models.CharField(verbose_name='Pure URL', max_length=512,
                                blank=True, help_text='Link to pure profile')
    profile_url = models.CharField(verbose_name='KCL Profile URL',
                                   max_length=512, blank=True,
                                   help_text='Link to personal website\
                                   within KCL (e.g. departmental profile)')
    other_url = models.CharField(verbose_name='Non-KCL Profile URL',
                                 max_length=512, blank=True, help_text='Link\
                                 to personal website outside of KCL')

    # Interests
    research_interests = models.ManyToManyField(Interest,
                                                verbose_name='Research\
                                                Interests',
                                                related_name='research_int',
                                                blank=True)
    teaching_interests = models.ManyToManyField(Interest,
                                                verbose_name='Teaching\
                                                Interests',
                                                related_name='teaching_int',
                                                blank=True)

    specialisms = models.ManyToManyField(Specialism,
                                         verbose_name='Specialisms',
                                         blank=True)

    # Search fields
    #locations = models.ManyToManyField(OutReachLocation, blank=True)
    #themes = models.ManyToManyField('Theme', blank=True)
    #institution = models.ManyToManyField('Institution', blank=True)

    def __unicode__(self):
        if self.middle_name:
            return "{} {} {}".format(self.first_name, self.middle_name,
                                     self.last_name)
        else:
            return "{} {}".format(self.first_name, self.last_name)

    class Meta:
        ordering = ['last_name', 'first_name', 'middle_name']


# OutReach Event
class OutReachEvent(models.Model):
    researcher = models.ForeignKey(Researcher)
    name = models.CharField(verbose_name='Outreach Title', max_length=1024,
                            blank=False)
    description = models.TextField(verbose_name='Description', blank=True,
                                   help_text='An optional description of the\
                                   outreach, to aid in matching/searching')
    location = models.ForeignKey(OutReachLocation, verbose_name='Location',
                                 blank=True, null=True)
    frequency = models.ForeignKey(OutReachFrequency, verbose_name='Frequency',
                                  blank=True, null=True)
    medium = models.ForeignKey(OutReachMedium, verbose_name='Medium',
                               help_text='Medium (e.g. Radio, TV, Talk...)',
                               blank=True, null=True)

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# A teachng module
# Note - this can have links between departments - as the module
# and (potentially) teachers can have different departments
class Module(models.Model):
    name = models.CharField(verbose_name="Module Title", max_length=1024,
                            blank=False, null=False)
    description = models.TextField(verbose_name='Description', blank=True)
    assessment = models.TextField(verbose_name='Assessments',
                                  blank=True)
    convenors = models.ManyToManyField(Researcher,
                                       verbose_name='Module Convenors',
                                       blank=True)
    department = models.ForeignKey(Department, null=True)
    level = models.ManyToManyField(ModuleLevel,
                                   verbose_name='Module Level',
                                   blank=True)
    teaching_pattern = models.TextField(verbose_name='Teaching\
                                        Pattern', blank=True)
    url = models.CharField(verbose_name='Module URL', max_length=512,
                           blank=True, null=True)
    locations = models.ManyToManyField("OutReachLocation", null=True)
    themes = models.ManyToManyField("Theme", null=True)
    institutions = models.ManyToManyField("Institution", null=True)

    def __unicode__(self):
        if self.department:
            return "{} ({})".format(self.name, self.department)
        else:
            return self.name

    class Meta:
        ordering = ['name']


# A generic theme. This lets us link everything together nicely
class Theme(models.Model):
    name = models.CharField(verbose_name="Theme Name", max_length=1024,
                            blank=False, null=False)
    description = models.TextField(verbose_name="Description", blank=True)
    roles = models.ManyToManyField(JobRole, verbose_name="Related\
                                   Job Roles", blank=True)
    modules = models.ManyToManyField(Module, verbose_name="Related\
                                   Modules", blank=True)


# A generic institution model
class Institution(models.Model):
    name = models.CharField(max_length=1024)
    description = models.TextField(null=True, blank=True)
    category = models.ForeignKey(InstitutionCategory, null=True)
    location = models.ManyToManyField("OutReachLocation", blank=True)

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']
