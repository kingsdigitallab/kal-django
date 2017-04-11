# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-11 14:09
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0020_auto_20170411_1058'),
    ]

    operations = [
        migrations.CreateModel(
            name='Theme',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=1024, verbose_name='Theme Name')),
                ('description', models.TextField(blank=True, verbose_name='Description')),
                ('modules', models.ManyToManyField(blank=True, to='kaldb.Module', verbose_name='Related                                   Modules')),
                ('roles', models.ManyToManyField(blank=True, to='kaldb.JobRole', verbose_name='Related                                   Job Roles')),
            ],
        ),
        migrations.AlterModelOptions(
            name='faculty',
            options={'ordering': ['name'], 'verbose_name_plural': 'Faculties'},
        ),
        migrations.AlterModelOptions(
            name='outreachcity',
            options={'ordering': ['name'], 'verbose_name_plural': 'Out reach cities'},
        ),
        migrations.AlterModelOptions(
            name='outreachcountry',
            options={'ordering': ['name'], 'verbose_name_plural': 'Out reeach countries'},
        ),
        migrations.AlterModelOptions(
            name='outreachfrequency',
            options={'ordering': ['name'], 'verbose_name_plural': 'Out reach frequencies'},
        ),
    ]
