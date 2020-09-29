# Generated by Django 3.0.8 on 2020-08-12 05:57

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('task', '0007_auto_20200811_1839'),
    ]

    operations = [
        migrations.AddField(
            model_name='task',
            name='auto_join',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='note',
            name='date_end',
            field=models.DateTimeField(default=datetime.datetime(2020, 8, 19, 5, 57, 22, 970068)),
        ),
        migrations.AlterField(
            model_name='note',
            name='task',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='notes', to='task.Task', verbose_name='tasks'),
        ),
        migrations.AlterField(
            model_name='note',
            name='user',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='users'),
        ),
    ]