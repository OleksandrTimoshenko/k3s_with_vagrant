#!/bin/bash

# Deploy Nginx
kubectl apply -f /vagrant/k3s_conf/nginx/

# Deploy Postgresql
kubectl apply -f /vagrant/k3s_conf/psql/

# Deploy Adminer
kubectl apply -f /vagrant/k3s_conf/adminer/

# Deploy Django
kubectl apply -f /vagrant/k3s_conf/django/