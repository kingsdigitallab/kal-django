# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-06-20 12:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0011_auto_20170613_1231'),
    ]

    operations = [
        migrations.AddField(
            model_name='theme',
            name='short_desc',
            field=models.TextField(blank=True, verbose_name='Short description'),
        ),
    ]
