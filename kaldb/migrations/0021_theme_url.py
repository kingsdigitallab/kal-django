# -*- coding: utf-8 -*-
# Generated by Django 1.11.13 on 2018-06-21 13:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0020_alter_field_notes_on_researcher'),
    ]

    operations = [
        migrations.AddField(
            model_name='theme',
            name='url',
            field=models.URLField(blank=True, max_length=512, null=True),
        ),
    ]
