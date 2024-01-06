from django.contrib.auth.models import User
from django.db import transaction
from django.forms import model_to_dict
from django.shortcuts import get_object_or_404
from django.utils.encoding import force_str
from django.utils.http import urlsafe_base64_decode
from drf_spectacular.utils import extend_schema
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import generics
from .helpers import send_mail_verification
from .serializers import (
    SignUpSerializers,
    VerifySerializers,
    ProductSerializer,
    ProductImageSerializer,
    ProductCategorySerializer,
    ShopSerializer
    
 
)
from django.http import HttpResponse
from django.http import JsonResponse
from .models import Product,Shop,CommentImage,Category,Comment,CustomUser,ProductShop,ProductImage,ProductCategory,Review,PriceHistory

class SignUp(APIView):
    permission_classes = [AllowAny]

    @extend_schema(
        request=SignUpSerializers,
        responses={
            201: {"description": "Please check your email to verify your account."},
        },
    )
    def post(self, request):
        serializer = SignUpSerializers(data=request.data)
        if serializer.is_valid():
            with transaction.atomic():
                serializer.save()
                new_user = serializer.instance
                send_mail_verification(request, new_user=new_user)
                data = {
                    "message": ("Please check your email to verify your account."),
                    "user": serializer.data,
                }

                return Response(data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class Verify(APIView):
    permission_classes = [AllowAny]

    def get(self, request, uidb64, token):
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
        user_dict = model_to_dict(
            user, ["pk", "username", "email", "first_name", "last_name"]
        )
        data = {
            "pk": uid,
            "verify_token": token,
        }
        serializer = VerifySerializers(user, data=data)
        if serializer.is_valid():
            serializer.save()
            data = {
                "message": (
                    "Thank you for your email confirmation. Now you can login your account."
                ),
                "user": user_dict,
            }
            return Response(data, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ProductDetail(APIView):

    def get(self, request, shop_id, product_id):
        product = get_object_or_404(Product, product_id=product_id)
        product_shop = get_object_or_404(ProductShop, shop_id=shop_id, product_id=product_id)
        quantity = product_shop.stock_quantity
        price = product_shop.price
        reviews = Review.objects.filter(product=product)

        # Calculate average rating
        total_ratings = reviews.count()
        if total_ratings > 0:
            average_rating = sum(review.rating for review in reviews) / total_ratings
        else:
            average_rating = 0

        # Add average rating and total ratings to the response data
        data = ProductSerializer(product).data
        data['stock_quantity'] = quantity
        data['average_rating'] = average_rating
        data['total_ratings'] = total_ratings
        data['price'] = price

        return Response(data=data, status=status.HTTP_200_OK)
    

class SearchProducts(APIView):

    def get(self, request, search_query):
        # Fetch all products that contain the specified search query in their names
        matching_products = Product.objects.filter(product_name__icontains=search_query)

        # Create a list to store information about each matching product
        result_data = []
        for product in matching_products:
            # Fetch the prices for each shop
            product_shops = ProductShop.objects.filter(product=product)
            shop_product_info = []

            for product_shop in product_shops:
                shop_product_info.append({
                    "shop_id": product_shop.shop.shop_id,
                    "shop_name": product_shop.shop.shop_name,
                    "price": product_shop.price,
                })

            # Append information about the product to the result list
            result_data.append({
                "product_id": product.product_id,
                "product_name": product.product_name,
                "infor": shop_product_info,
            })

        return Response(data=result_data, status=status.HTTP_200_OK)


class UpdateProductPrice(APIView):

    def post(self, request, shop_id, product_id):
        product_shop = get_object_or_404(ProductShop, shop_id=shop_id, product_id=product_id)
        new_price = request.data.get('price')

        # Save the current price to the price history
        PriceHistory.objects.create(product_shop=product_shop, price=product_shop.price)

        # Update the current price
        product_shop.price = new_price
        product_shop.save()
        PriceHistory.objects.create(product_shop=product_shop, price=product_shop.price)
        
        # You can return a response as needed
        data = ProductSerializer(product_shop.product).data
        data['stock_quantity'] = product_shop.stock_quantity
        data['price'] = product_shop.price

        return Response(data=data, status=status.HTTP_200_OK)   
    

        

