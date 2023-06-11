#!/bin/bash

function logger() {
  local delimiter="====================="
  local logs="$1"

  echo "========= $logs ========="
}

logger "Installing docker engine"
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker vagrant
sudo systemctl enable docker

logger "Installing k3s"

curl -sfL https://get.k3s.io | sh -
#curl -sfL https://get.k3s.io | sh -s - --docker # Uning docker engine (usefull if you want to use local docker images, not from hubs)

# Retrieve the cluster kubeconfig file
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/config
sudo chown vagrant:vagrant /home/vagrant/config

# Update permissions on kubectl executable
sudo chown vagrant:vagrant /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl

# Allow the 'vagrant' user to access the kubeconfig file
sudo chown vagrant:vagrant /etc/rancher/k3s/k3s.yaml
sudo chmod 644 /etc/rancher/k3s/k3s.yaml

# Set the KUBECONFIG environment variable for the 'vagrant' user
echo 'export KUBECONFIG=/home/vagrant/config' >> /home/vagrant/.bashrc

#  create configmap
kubectl create configmap postgres-config --from-env-file=/vagrant/k3s_conf/database.env

# setup credentials for the ghcr.io
logger "setup credentials for the ghcr.io"
source /vagrant/github.env
sed -i "s/GHCR_USERNAME/$GITHUB_USER/g" /vagrant/registries.yaml
sed -i "s/GHCR_PASSWORD/$GITHUB_TOKEN/g" /vagrant/registries.yaml

sudo cp /vagrant/registries.yaml /etc/rancher/k3s/registries.yaml

sed -i "s/$GITHUB_USER/GHCR_USERNAME/g" /vagrant/registries.yaml
sed -i "s/$GITHUB_TOKEN/GHCR_PASSWORD/g" /vagrant/registries.yaml

sudo systemctl restart k3s