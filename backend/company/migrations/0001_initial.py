# Generated by Django 2.2.12 on 2020-07-15 12:35

from django.conf import settings
import django.contrib.postgres.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=40)),
                ('members', django.contrib.postgres.fields.ArrayField(base_field=models.IntegerField(), blank=True, size=None)),
                ('date_created', models.DateTimeField(auto_now=True)),
                ('description', models.TextField(blank=True)),
                ('status', models.IntegerField(choices=[(1, 'Public'), (2, 'Private'), (3, 'Protected')], verbose_name='Status')),
                ('theme', models.IntegerField(choices=[(1, 'Finance'), (2, 'IT'), (3, 'Develop'), (4, 'Building')], verbose_name='Theme')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='User')),
            ],
        ),
    ]
