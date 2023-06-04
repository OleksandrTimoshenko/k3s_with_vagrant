from django.http import HttpResponse

def health_check_view(request):
    # You can perform additional health check logic here if needed
    return HttpResponse("OK")

def index(request):
    return HttpResponse("Hello, this is the default endpoint!")