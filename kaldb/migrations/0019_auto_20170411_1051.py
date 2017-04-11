# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-11 09:51
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0018_auto_20170403_2115'),
    ]

    operations = [
        migrations.CreateModel(
            name='Module',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=1024, verbose_name='Module Title')),
                ('description', models.TextField(blank=True, verbose_name='Description')),
                ('assessment', models.TextField(blank=True, verbose_name='Assessments')),
                ('teaching_pattern', models.TextField(blank=True, verbose_name='Teaching                                        Pattern')),
                ('url', models.CharField(blank=True, max_length=512, null=True, verbose_name='Module URL')),
                ('convenors', models.ManyToManyField(blank=True, to='kaldb.Researcher', verbose_name='Module Convenors')),
                ('department', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='kaldb.Department')),
            ],
        ),
        migrations.CreateModel(
            name='ModuleLevel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=120, verbose_name='Module Level')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.AddField(
            model_name='module',
            name='level',
            field=models.ManyToManyField(blank=True, to='kaldb.ModuleLevel', verbose_name='Module Level'),
        ),
    ]
