# Generated by Django 3.0.8 on 2020-08-13 07:51

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('task', '0013_auto_20200813_0529'),
    ]

    operations = [
        migrations.AlterField(
            model_name='note',
            name='date_end',
            field=models.DateTimeField(default=datetime.datetime(2020, 8, 20, 7, 51, 9, 205869)),
        ),
    ]