# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-06-13 10:44
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0005_auto_20170613_1143'),
    ]

    operations = [
        migrations.AlterField(
            model_name='outreachlocation',
            name='city',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='kaldb.OutReachCity', verbose_name='City'),
        ),
        migrations.AlterField(
            model_name='outreachlocation',
            name='country',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='kaldb.OutReachCountry', verbose_name='OR Country'),
        ),
    ]
