# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-04-19 10:13
from __future__ import unicode_literals

import django.contrib.gis.db.models.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0021_auto_20170411_1509'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='outreachlocation',
            name='coord_lat',
        ),
        migrations.RemoveField(
            model_name='outreachlocation',
            name='coord_long',
        ),
        migrations.AddField(
            model_name='outreachlocation',
            name='point',
            field=django.contrib.gis.db.models.fields.PointField(default='POINT(0.0 50.0)', srid=32140),
            preserve_default=False,
        ),
    ]
