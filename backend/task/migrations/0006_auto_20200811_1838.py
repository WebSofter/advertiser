# Generated by Django 3.0.8 on 2020-08-11 18:38

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('task', '0005_auto_20200811_1838'),
    ]

    operations = [
        migrations.AlterField(
            model_name='note',
            name='date_end',
            field=models.DateTimeField(default=datetime.datetime(2020, 8, 18, 18, 38, 45, 939700)),
        ),
        migrations.AlterField(
            model_name='task',
            name='date_end',
            field=models.DateTimeField(default=datetime.datetime(2020, 8, 11, 18, 38, 45, 938972)),
        ),
    ]
