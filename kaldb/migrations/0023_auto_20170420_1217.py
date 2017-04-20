# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-04-20 11:17
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('kaldb', '0022_auto_20170419_1113'),
    ]

    operations = [
        migrations.CreateModel(
            name='Institution',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=1024)),
                ('description', models.TextField(blank=True, null=True)),
            ],
            options={
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='InstitutionCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(help_text='e.g. Religious..', max_length=50)),
            ],
        ),
        migrations.AddField(
            model_name='module',
            name='locations',
            field=models.ManyToManyField(blank=True, null=True, to='kaldb.OutReachLocation'),
        ),
        migrations.AddField(
            model_name='module',
            name='themes',
            field=models.ManyToManyField(blank=True, null=True, to='kaldb.Theme'),
        ),
        migrations.AddField(
            model_name='outreachlocation',
            name='name',
            field=models.CharField(default='', max_length=50),
        ),
        migrations.AddField(
            model_name='institution',
            name='category',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='kaldb.InstitutionCategory'),
        ),
        migrations.AddField(
            model_name='institution',
            name='location',
            field=models.ManyToManyField(blank=True, to='kaldb.OutReachLocation'),
        ),
        migrations.AddField(
            model_name='module',
            name='institutions',
            field=models.ManyToManyField(blank=True, null=True, to='kaldb.Institution'),
        ),
    ]
