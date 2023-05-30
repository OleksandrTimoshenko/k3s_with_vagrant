#!/bin/bash

# Deploy Nginx
kubectl apply -f /vagrant/nginx/

# Deploy Postgresql
kubectl apply -f /vagrant/psql/

# Deploy Adminer
kubectl apply -f /vagrant/adminer