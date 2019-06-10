#!/bin/bash
#This script will install kubeadm along with kubectl and kubelet

echo -e "staring the installation of kubeadm along with kubectl and kubelet"

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

echo -e "Installation of kubeadm along with kubectl and kubelet completed"