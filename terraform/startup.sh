#!/bin/bash
set -e
apt-get update -y
apt-get install -y docker.io curl apt-transport-https
usermod -aG docker ubuntu
systemctl enable docker && systemctl start docker
curl -LO https://dl.k8s.io/release/.../kubectl
chmod +x kubectl && mv kubectl /usr/local/bin/
curl -LO https://storage.googleapis.com/.../minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube
sudo -u ubuntu minikube start --driver=docker --cpus=4 --memory=12g