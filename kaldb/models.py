from __future__ import unicode_literals

import os
import urllib

from django.core.files import File
from django.core.urlresolvers import reverse
from django.db import models
from models_authlists import (AwardType, Department, Faculty,
                              InstitutionCategory, InstitutionSector,
                              JobPosition, JobRole, ModuleLevel,
                              OutReachFrequency, OutReachLocation,
                              OutReachMedium, StageType, Title)
from tinymce import models as tinymce_models

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


# A generic institution model
class Institution(models.Model):
    name = models.CharField(max_length=1024)
    description = models.TextField(null=True, blank=True)
    category = models.ForeignKey(InstitutionCategory, null=True)
    sector = models.ForeignKey(InstitutionSector, null=True)
    location = models.ManyToManyField("OutReachLocation", blank=True)

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Specialisms
class Specialism(models.Model):
    name = models.CharField(verbose_name='London Specialism', max_length=1024,
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

    image_file = models.ImageField(
        upload_to='researchers', blank=True, null=True)
    image_url = models.URLField(blank=True, null=True)

    # Department
    department = models.ForeignKey(Department, null=True, blank=True)

    # Job
    position = models.ForeignKey(JobPosition, verbose_name='Job Position',
                                 help_text='e.g. Lecturer, Professor...',
                                 blank=True, null=True)
    role = models.ForeignKey(JobRole, help_text='e.g. \'in Roman Sculpture\'',
                             blank=True, null=True)

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
    institutions = models.ManyToManyField(Institution,
                                          verbose_name='Institutions',
                                          blank=True)
    locations = models.ManyToManyField(OutReachLocation,
                                       verbose_name='Locations',
                                       blank=True)
    external = models.BooleanField(verbose_name="External To Kings",
                                   default=False)

    notes = tinymce_models.HTMLField(blank=True, null=True)

    class Meta:
        ordering = ['last_name', 'first_name', 'middle_name']

    def save(self, *args, **kwargs):
        self._get_remote_image()
        super(Researcher, self).save(*args, **kwargs)

    def _get_remote_image(self):
        if self.image_url:
            name = os.path.basename(self.image_url).lower()
            result = urllib.urlretrieve(self.image_url)
            self.image_url = None

            self.image_file.save(name, File(open(result[0])))

    def get_themes(self):
        ret = []
        for s in self.specialisms.all():
            for t in s.theme_set.all():
                if t not in ret:
                    ret.append(t)
        return ret

    def get_name(self):
        name = None

        if self.middle_name:
            name = "{} {} {}".format(self.first_name, self.middle_name,
                                     self.last_name)
        else:
            name = "{} {}".format(self.first_name, self.last_name)

        if self.title:
            return "{} {}".format(self.title.name, name)

        return name

    def get_absolute_url(self):
        return reverse('researcher_detail', None, [str(self.id)])

    def __unicode__(self):
        return self.get_name()


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
    locations = models.ManyToManyField("OutReachLocation",
                                       blank=True)
    institutions = models.ManyToManyField("Institution",
                                          blank=True)

    def get_absolute_url(self):
        return reverse('module_detail', None, [str(self.id)])

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
    active = models.BooleanField(default=True)
    short_name = models.CharField(blank=True, null=True, max_length=50)
    url = models.URLField(max_length=512, blank=True, null=True)
    description = tinymce_models.HTMLField(verbose_name="Description",
                                           blank=True)
    short_desc = models.TextField(verbose_name="Short description",
                                  blank=True)
    image = models.ImageField(blank=True)
    main_image = models.ImageField(blank=True)
    roles = models.ManyToManyField(JobRole, verbose_name="Related\
                                   Job Roles", blank=True)
    modules = models.ManyToManyField(Module, verbose_name="Related\
                                   Modules", blank=True)

    specialisms = models.ManyToManyField(Specialism, verbose_name="Related\
                                   London Specialisms", blank=True)

    def get_absolute_url(self):
        return reverse('theme_detail', None, [str(self.id)])

    def get_researchers(self):
        res = []

        for s in self.specialisms.all():
            for r in s.researcher_set.all():
                if r not in res:
                    res.append(r)
        res.sort(key=lambda x: x.last_name + '::' + x.first_name)

        return res

    def __unicode__(self):
        return self.name


# A collaboration:
class Collaboration(models.Model):
    name = models.TextField(blank=True, verbose_name='Project Title')

    award_type = models.ForeignKey(AwardType, verbose_name='Award Type',
                                   blank=True)
    date_d = models.IntegerField(blank=True, verbose_name='Day')
    date_m = models.IntegerField(blank=True, verbose_name='Month')
    date_y = models.IntegerField(blank=False, verbose_name='Year')
    stage_type = models.ForeignKey(StageType, verbose_name='Stage Type',
                                   blank=True)
    value = models.DecimalField(max_digits=20, decimal_places=2, blank=True,
                                verbose_name='Value of Collaboration')

    # Investigator Info.
    pi = models.ManyToManyField(Researcher, related_name='pi')
    coinv = models.ManyToManyField(Researcher, related_name='coinv')
    extcoapp = models.ManyToManyField(Researcher, related_name='extcoapp')
    accholder = models.ManyToManyField(Researcher, related_name='accholder')

    faculty = models.ForeignKey(Faculty, verbose_name="Faculty/School",
                                blank=True, null=True)

    # Partner:
    partner = models.ForeignKey(Institution, blank=False)
    partner_is_lead = models.BooleanField(default=False,
                                          verbose_name="Was the partner lead?")

    def __unicode__(self):
        return self.name
