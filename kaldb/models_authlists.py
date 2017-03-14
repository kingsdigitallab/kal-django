from __future__ import unicode_literals

from django.db import models


# Faculty/School
class Faculty(models.Model):
    name = models.CharField(verbose_name='Faculty Name', max_length=120)


# Department within a Faculty
class Department(models.Model):
    name = models.CharField(verbose_name='Department Name', max_length=120)
    faculty = models.ForeignKey(Faculty, verbose_name='Faculty')


# Job position
class JobPosition(models.Model):
    name = models.CharField(verbose_name='Job Position', max_length=120,
                            help_text='Research Assistant, Lecturer,\
                            Professor...')


# Job Role
class JobRole(models.Model):
    name = models.CharField(verbose_name='Job Role', max_length=120,
                            help_text='e.g. \'in Roman Sculpture\'')


# Location of outreach activity
# Could be useful for geolocation
class OutReachCountry(models.Model):
    name = models.CharField(verbose_name='City Name',
                            max_length=120, blank=True, help_text='Not\
                            needed if City is known, country will be\
                            automatically populated')


# Location of outreach activity
# Could be useful for geolocation
class OutReachCity(models.Model):
    name = models.CharField(verbose_name='City Name', max_length=120,
                            blank=True)
    country = models.ForeignKey(OutReachCountry)


# Frequency of outreach activity (e.g. Once, occasionally, often...)
# Could be useful for finding people who are active often
class OutReachFrequency(models.Model):
    name = models.CharField(verbose_name='Name', max_length=120,
                            help_text='Once, Cccasionally, Often...')


# Location of outreach activity
# Could be useful for geolocation
class OutReachLocation(models.Model):
    city = models.ForeignKey(OutReachCity, verbose_name='City')
    country = models.ForeignKey(OutReachCountry, verbose_name='OR Country')
    coord_lat = models.CharField(verbose_name='Lat.', max_length=120,
                                 blank=True, help_text='If known')
    coord_long = models.CharField(verbose_name='Long.', max_length=120,
                                  blank=True, help_text='If known')


# Medium of outreach activity (e.g. Radio, TV, Talk)
class OutReachMedium(models.Model):
    name = models.CharField(verbose_name='Medium', max_length=120,
                            help_text='Radio, TV, Talk...')


# Personal Title (e.g Mr, Ms, Dr...)
class Title(models.Model):
    name = models.CharField(verbose_name='Title', max_length=120,
                            help_text='e.g. Mr, Ms, Dr...')
