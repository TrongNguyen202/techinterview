# Generated by Django 4.2.7 on 2024-01-07 05:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_pricehistory'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productshop',
            name='stock_quantity',
            field=models.PositiveIntegerField(default=0),
        ),
    ]