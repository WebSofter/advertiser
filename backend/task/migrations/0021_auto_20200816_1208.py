# Generated by Django 3.0.8 on 2020-08-16 12:08

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('task', '0020_auto_20200816_1202'),
    ]

    operations = [
        migrations.AlterField(
            model_name='link',
            name='date',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='note',
            name='date_end',
            field=models.DateTimeField(default=datetime.datetime(2020, 8, 23, 12, 8, 35, 161237)),
        ),
    ]
