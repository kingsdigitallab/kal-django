# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-03 18:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0009_auto_20170403_1859'),
    ]

    operations = [
        migrations.AlterField(
            model_name='interest',
            name='name',
            field=models.CharField(max_length=1024, verbose_name='Interest Name'),
        ),
    ]
