# Generated by Django 3.0.8 on 2020-08-13 00:17

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('task', '0010_auto_20200812_0623'),
    ]

    operations = [
        migrations.AlterField(
            model_name='note',
            name='date_end',
            field=models.DateTimeField(default=datetime.datetime(2020, 8, 20, 0, 17, 30, 181589)),
        ),
    ]
