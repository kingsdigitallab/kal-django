# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-03-14 20:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0004_auto_20170314_2026'),
    ]

    operations = [
        migrations.AlterField(
            model_name='interest',
            name='description',
            field=models.TextField(blank=True, help_text='An optional description of the                                   interest, to aid in matching/searching', verbose_name='Description'),
        ),
        migrations.AlterField(
            model_name='interest',
            name='related_interests',
            field=models.ManyToManyField(related_name='_interest_related_interests_+', to='kaldb.Interest', verbose_name='Related                                               Interests'),
        ),
        migrations.AlterField(
            model_name='researcher',
            name='can_email',
            field=models.BooleanField(default=True, help_text='Is this person willing to be                                    contacted by e-mail?', verbose_name='Can E-mail?'),
        ),
        migrations.AlterField(
            model_name='researcher',
            name='can_phone',
            field=models.BooleanField(default=True, help_text='Is this person willing to be                                    contacted by phone?', verbose_name='Can Phone?'),
        ),
        migrations.AlterField(
            model_name='researcher',
            name='other_url',
            field=models.CharField(blank=True, help_text='Link                                 to personal website outside of KCL', max_length=512, verbose_name='Non-KCL Profile URL'),
        ),
        migrations.AlterField(
            model_name='researcher',
            name='phone',
            field=models.CharField(blank=True, help_text='For KCL staff a 4 digit                             extension is sufficient', max_length=120, verbose_name='Telephone Number'),
        ),
        migrations.AlterField(
            model_name='researcher',
            name='profile_url',
            field=models.CharField(blank=True, help_text='Link to personal website                                   within KCL (e.g. departmental profile)', max_length=512, verbose_name='KCL Profile URL'),
        ),
        migrations.AlterField(
            model_name='researcher',
            name='research_interests',
            field=models.ManyToManyField(related_name='research_int', to='kaldb.Interest', verbose_name='Research                                                Interests'),
        ),
        migrations.AlterField(
            model_name='researcher',
            name='teaching_interests',
            field=models.ManyToManyField(related_name='teaching_int', to='kaldb.Interest', verbose_name='Teaching                                                Interests'),
        ),
    ]
