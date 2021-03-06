# Generated by Django 3.0.8 on 2020-08-16 12:02

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('task', '0019_auto_20200814_1245'),
    ]

    operations = [
        migrations.CreateModel(
            name='Link',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('link', models.SlugField(max_length=300)),
                ('title', models.CharField(max_length=120)),
                ('date', models.DateTimeField()),
            ],
        ),
        migrations.AlterField(
            model_name='note',
            name='date_end',
            field=models.DateTimeField(default=datetime.datetime(2020, 8, 23, 12, 2, 43, 105697)),
        ),
        migrations.AddField(
            model_name='task',
            name='links',
            field=models.ManyToManyField(blank=True, to='task.Link'),
        ),
    ]
