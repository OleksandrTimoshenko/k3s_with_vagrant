#!/bin/bash

source /vagrant/github.env

docker login -u "$GITHUB_USER" -p "$GITHUB_TOKEN" ghcr.io

# Deploy Nginx
kubectl apply -f /vagrant/k3s_conf/nginx/

# Deploy Postgresql
kubectl apply -f /vagrant/k3s_conf/psql/

# Deploy Adminer
kubectl apply -f /vagrant/k3s_conf/adminer/

# Deploy Django
kubectl apply -f /vagrant/k3s_conf/django/