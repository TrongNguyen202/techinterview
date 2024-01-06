from django.urls import path
from drf_spectacular.views import SpectacularAPIView, SpectacularSwaggerView
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from . import views

urlpatterns = [
    path("schema", SpectacularAPIView.as_view(), name="schema"),
    path(
        "schema/swagger-ui",
        SpectacularSwaggerView.as_view(url_name="schema"),
        name="swagger-ui",
    ),
    path("login", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("token/refresh", TokenRefreshView.as_view(), name="token_refresh"),
    path("signup", views.SignUp.as_view(), name="signup"),
    path("verify/<str:uidb64>/<str:token>", views.Verify.as_view(), name="verify"),
    path("shops/<int:shop_id>/products/<int:product_id>", views.ProductDetail.as_view(),name="product_detail")
  
 
]
