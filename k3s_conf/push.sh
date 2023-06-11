#!/bin/bash

source /vagrant/github.env

NGINX_CONTAINER_IN_HUB="ghcr.io/oleksandrtimoshenko/nginx-app:latest"
DJANGO_CONTAINER_IN_HUB="ghcr.io/oleksandrtimoshenko/django-app:latest"

docker login -u "$GITHUB_USER" -p "$GITHUB_TOKEN" ghcr.io

docker build -t "$DJANGO_CONTAINER_IN_HUB"  /vagrant/django

docker build -t "$NGINX_CONTAINER_IN_HUB"   /vagrant/nginx

docker push "$DJANGO_CONTAINER_IN_HUB"

docker push "$NGINX_CONTAINER_IN_HUB"