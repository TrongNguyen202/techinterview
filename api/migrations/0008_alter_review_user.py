# Generated by Django 5.0.1 on 2024-01-08 07:47

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_reviewimage_remove_commentimage_comment_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='review',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.customuser'),
        ),
    ]
