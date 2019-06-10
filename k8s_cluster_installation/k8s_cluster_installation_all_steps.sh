#!/bin/bash
#This script will install k8s cluster using kubeadm

#please provide the public of pod to
public_ip=$1

echo -e "starting the k8s cluster installation using kubeadm"

# Installing CRI
./cri_installation.sh

# Installing kubeadm,kubeclt & kubeadm
./kubeadm_installation.sh

#intializing kubeadm
kubeadm init --apiserver-advertise-address=$1

# Installing a WEAVE pod network
./pod_network_installation.sh


echo -e "completed the k8s cluster installation using kubeadm"
