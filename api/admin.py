from django.contrib import admin
from .models import CustomUser, Shop, Category, Product, ProductCategory, ProductShop, Comment, CommentImage, ProductImage

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
    list_display = ['product_id', 'product_name', 'price']

admin.site.register(Product, ProductAdmin)

class ProductCategoryAdmin(admin.ModelAdmin):
    list_display = ['product', 'category']

admin.site.register(ProductCategory, ProductCategoryAdmin)

class ProductShopAdmin(admin.ModelAdmin):
    list_display = ['product', 'shop', 'stock_quantity']

admin.site.register(ProductShop, ProductShopAdmin)

class CommentAdmin(admin.ModelAdmin):
    list_display = ['comment_id', 'product', 'user', 'text', 'created_at', 'parent_comment']

admin.site.register(Comment, CommentAdmin)

class CommentImageAdmin(admin.ModelAdmin):
    list_display = ['comment', 'image_url']

admin.site.register(CommentImage, CommentImageAdmin)

class ProductImageAdmin(admin.ModelAdmin):
    list_display = ['image_id', 'image_url']

admin.site.register(ProductImage, ProductImageAdmin)
