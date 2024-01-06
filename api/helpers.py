from uuid import uuid4

from django.core.mail import send_mail
from django.urls import reverse
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode

from techinterview.settings import EMAIL_HOST_USER
from .models import CustomUser




def check_token(user, token):
    return user.customuser.verify_token == token




def send_mail_verification(request, new_user):
    verify_token = uuid4()
    CustomUser.objects.create(user=new_user, verify_token=verify_token)
    mail_subject = "Activate your account."
    verify_url = reverse(
        "verify",
        kwargs={
            "uidb64": urlsafe_base64_encode(force_bytes(new_user.pk)),
            "token": str(verify_token),
        },
    )
    mail_message = (
        f"Hi {new_user.username}, Please use this link to verify your account\n"
        f"{request.build_absolute_uri(verify_url)}"
    )
    from_email = EMAIL_HOST_USER
    send_mail(
        mail_subject,
        mail_message,
        from_email,
        [new_user.email],
        fail_silently=False,
    )

