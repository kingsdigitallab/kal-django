# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2018-06-06 13:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0018_alter_field_image_file_on_researcher'),
    ]

    operations = [
        migrations.AddField(
            model_name='researcher',
            name='notes',
            field=models.TextField(blank=True, null=True),
        ),
    ]
