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
from .models import Product,Shop,Category,CustomUser,ProductShop,ProductImage,ProductCategory,Review,PriceHistory

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
        data['reviews'] = reviews.count()
 
        return Response(data=data, status=status.HTTP_200_OK)
    

class SearchProducts(APIView):

    def get(self, request, search_query):
        # Fetch all products that contain the specified search query in their names
        matching_products = Product.objects.filter(product_name__icontains=search_query)
        prices = []

        # Create a dictionary to store information about each shop and its products
        shop_data = {}

        for product in matching_products:
            # Fetch the prices for each shop
            product_shops = ProductShop.objects.filter(product=product)
            for item in product_shops:
                prices.append(item.price)

            for product_shop in product_shops:
                shop_id = product_shop.shop.shop_id

                if shop_id not in shop_data:
                    # If the shop is not already in the dictionary, add it
                    shop_data[shop_id] = {
                        "shop_id": shop_id,
                        "shop_name": product_shop.shop.shop_name,
                        "products": [],
                    }

                # Add product information to the shop's list of products
                shop_data[shop_id]["products"].append({
                    "product_id": product.product_id,
                    "product_name": product.product_name,
                    "price": product_shop.price,
                })

        # Convert the dictionary values to a list for the response
        result_data = list(shop_data.values())

        # Add the 'prices_range' key with the 'prices' list to the result_data
        result_data.append({"prices_range": prices})

        # Calculate total number of products
        total_products = matching_products.count()
        result_data.append({"total_products": total_products})

        # Calculate the minimum and maximum values in the prices list
        if prices:
            min_price = min(prices)
            max_price = max(prices)
            result_data.append({"min_price": min_price, "max_price": max_price})

        return Response(data=result_data, status=status.HTTP_200_OK)



class UpdateProductPrice(APIView):

    def post(self, request, shop_id, product_id):
        product_shop = get_object_or_404(ProductShop, shop_id=shop_id, product_id=product_id)
        new_price = request.data.get('price')

        

        # Update the current price
        product_shop.price = new_price
        product_shop.save()
        PriceHistory.objects.create(product_shop=product_shop, price=product_shop.price)
        
        # You can return a response as needed
        data = ProductSerializer(product_shop.product).data
        data['stock_quantity'] = product_shop.stock_quantity
        data['price'] = product_shop.price

        return Response(data=data, status=status.HTTP_200_OK)   
    

class CreateProduct(APIView):

    def post(self, request, shop_id):
        serializer = ProductSerializer(data=request.data)

        if serializer.is_valid():
            new_product = serializer.save()

            price = request.data.get('price')
            stock_quantity = request.data.get('stock_quantity', 0)  # Set a default value if not provided

            product_shop, created = ProductShop.objects.get_or_create(shop_id=shop_id, product=new_product)
            product_shop.price = price
            product_shop.stock_quantity = stock_quantity
            product_shop.save()
            PriceHistory.objects.create(product_shop=product_shop, price=price)

            return Response(data=serializer.data, status=status.HTTP_201_CREATED)

        return Response(data=serializer.errors, status=status.HTTP_400_BAD_REQUEST)





class PriceHistoryView(APIView):

    def get(self, request, shop_id, product_id):
        shop = get_object_or_404(Shop, shop_id=shop_id)
        price_history_entries = PriceHistory.objects.filter(product_shop__shop=shop, product_shop__product_id=product_id)

        history_data = []
        for entry in price_history_entries:
            history_data.append({
                "price": entry.price,
                "updated_at": entry.updated_at,
            })

        return Response({"price_history": history_data}, status=status.HTTP_200_OK)


# class ReviewsList(APIView):

#     def get(self, request, shop_id, product_id):

        




        

