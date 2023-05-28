#!/bin/bash

curl -sfL https://get.k3s.io | sh -

# Deploy Nginx
sudo kubectl apply -f /vagrant/nginx/

# Deploy Postgresql
sudo kubectl apply -f /vagrant/psql/

# Deploy Adminer
sudo kubectl apply -f /vagrant/adminer