from django.contrib.auth.models import User
from django.db import models
import datetime
from django.core.validators import MaxValueValidator, MinValueValidator


class CustomUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    verify_token = models.CharField(("Verify token"), max_length=255, null=True)
    avatar = models.URLField(null = True)

class Shop(models.Model):
    shop_id = models.AutoField(primary_key=True)
    shop_name = models.CharField(max_length=255)
    location = models.CharField(max_length=255)

class Category(models.Model):
    category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=255)
    parent_category = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE)

class Product(models.Model):
    product_id = models.AutoField(primary_key=True)
    product_name = models.CharField(max_length=255)
    categories = models.ManyToManyField(Category, through='ProductCategory')
    images = models.ManyToManyField('ProductImage')
    description = models.TextField(null= False, default="no description")

class ProductCategory(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('product', 'category')

class ProductShop(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    shop = models.ForeignKey(Shop, on_delete=models.CASCADE)
    stock_quantity = models.PositiveIntegerField(default=0)

    price = models.DecimalField(max_digits=10, decimal_places=2, default =0)



class ProductImage(models.Model):
    image_id = models.AutoField(primary_key=True)
    image_url = models.URLField()


class Review(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    rating = models.IntegerField(
        validators=[MinValueValidator(1), MaxValueValidator(5)]
    )
    review_comment = models.TextField(blank=True, null=True) 
    created_at = models.DateTimeField(auto_now_add=True)
    

 
    


class ReviewImage(models.Model):
    review = models.ForeignKey(Review, related_name='images', on_delete=models.CASCADE)
    image_url = models.URLField()

class PriceHistory(models.Model):
    product_shop = models.ForeignKey(ProductShop, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=2, default =0)
    updated_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.product_shop.product.product_name} - {self.product_shop.shop.shop_name} - Price: {self.price} at {self.updated_at}"
    

