from django.contrib import admin
from .models import CustomUser, Shop, Category, Product, ProductCategory, ProductShop, ReviewImage , ProductImage,Review,PriceHistory

class CustomUserAdmin(admin.ModelAdmin):
    list_display = ['user', 'verify_token']

admin.site.register(CustomUser, CustomUserAdmin)

class ShopAdmin(admin.ModelAdmin):
    list_display = ['shop_id', 'shop_name', 'location']

admin.site.register(Shop, ShopAdmin)

class CategoryAdmin(admin.ModelAdmin):
    list_display = ['category_id', 'category_name', 'parent_category']

admin.site.register(Category, CategoryAdmin)

class ProductAdmin(admin.ModelAdmin):
    list_display = ['product_id', 'product_name']

admin.site.register(Product, ProductAdmin)

class ProductCategoryAdmin(admin.ModelAdmin):
    list_display = ['product', 'category']

admin.site.register(ProductCategory, ProductCategoryAdmin)

class ProductShopAdmin(admin.ModelAdmin):
    list_display = ['product', 'shop', 'stock_quantity','price']

admin.site.register(ProductShop, ProductShopAdmin)


class ReviewImageAdmin(admin.ModelAdmin):
    list_display = ['review', 'image_url']

admin.site.register(ReviewImage)

class ProductImageAdmin(admin.ModelAdmin):
    list_display = ['image_id', 'image_url']

admin.site.register(ProductImage, ProductImageAdmin)

admin.site.register(Review)
admin.site.register(PriceHistory)
