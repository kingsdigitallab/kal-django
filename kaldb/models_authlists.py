from __future__ import unicode_literals

from django.contrib.gis.db import models
from django.core.urlresolvers import reverse


# Faculty/School
class Faculty(models.Model):
    name = models.CharField(verbose_name='Faculty Name', max_length=256)

    def __unicode__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('faculty_detail', None, [str(self.id)])

    class Meta:
        ordering = ['name']
        verbose_name_plural = 'Faculties'


# Department within a Faculty
class Department(models.Model):
    name = models.CharField(verbose_name='Department Name', max_length=120)
    faculty = models.ForeignKey(Faculty, verbose_name='Faculty')

    def __unicode__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('department_detail', None, [str(self.id)])

    class Meta:
        ordering = ['name']


# Job position
class JobPosition(models.Model):
    name = models.CharField(verbose_name='Job Position', max_length=120,
                            help_text='Research Assistant, Lecturer,\
                            Professor...')

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Job Role
class JobRole(models.Model):
    name = models.CharField(verbose_name='Job Role', max_length=120,
                            help_text='e.g. \'in Roman Sculpture\'')

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Module Levels
class ModuleLevel(models.Model):
    name = models.CharField(verbose_name='Module Level', max_length=120)

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Location of outreach activity
# Could be useful for geolocation
class OutReachCountry(models.Model):
    name = models.CharField(verbose_name='City Name',
                            max_length=120, blank=True, help_text='Not\
                            needed if City is known, country will be\
                            automatically populated')

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']
        verbose_name_plural = 'Out reeach countries'


# Location of outreach activity
# Could be useful for geolocation
class OutReachCity(models.Model):
    name = models.CharField(verbose_name='City Name', max_length=120,
                            blank=True)
    country = models.ForeignKey(OutReachCountry, blank=True, null=True)

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']
        verbose_name_plural = 'Out reach cities'


# Frequency of outreach activity (e.g. Once, occasionally, often...)
# Could be useful for finding people who are active often
class OutReachFrequency(models.Model):
    name = models.CharField(verbose_name='Name', max_length=120,
                            help_text='Once, Cccasionally, Often...')

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']
        verbose_name_plural = 'Out reach frequencies'


# Location of outreach activity
# Could be useful for geolocation
class OutReachLocation(models.Model):
    name = models.CharField(max_length=256, default='')
    city = models.ForeignKey(OutReachCity, verbose_name='City', null=True, blank=True)
    country = models.ForeignKey(OutReachCountry, verbose_name='OR Country', blank=True, null=True)
    point = models.PointField(srid=3214, null=True, blank=True)

    def __unicode__(self):
        return self.name


# Medium of outreach activity (e.g. Radio, TV, Talk)
class OutReachMedium(models.Model):
    name = models.CharField(verbose_name='Medium', max_length=120,
                            help_text='Radio, TV, Talk...')

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Personal Title (e.g Mr, Ms, Dr...)
class Title(models.Model):
    name = models.CharField(verbose_name='Title', max_length=120,
                            help_text='e.g. Mr, Ms, Dr...')

    def __unicode__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Institutional category
class InstitutionCategory(models.Model):
    description = models.CharField(max_length=128,
                                   help_text='e.g. Religious..')

    def __unicode__(self):
        return self.description


# Institutional Sector
class InstitutionSector(models.Model):
    description = models.CharField(max_length=128,
                            help_text='e.g. Higher Education..')

    def __unicode__(self):
        return self.description

# Award Type
class AwardType(models.Model):
    name = models.CharField(max_length=128,
                            help_text='e.g. Research Grant')

    def __unicode__(self):
        return self.name

# Stage Type
class StageType(models.Model):
    name = models.CharField(max_length=128,
                            help_text='E.g. award')

    def __unicode__(self):
        return self.name