#!/usr/bin/env bash

#Redis master deployment
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-master-deployment.yaml -n development

#Redis master service deployment
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-master-service.yaml -n development

#Redis slave deployment
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-slave-deployment.yaml -n development

#Redis service deployment
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-slave-service.yaml -n development

#frontend deployment
kubectl apply -f https://k8s.io/examples/application/guestbook/frontend-deployment.yaml -n development

#frontend service deployment
kubectl apply -f https://k8s.io/examples/application/guestbook/frontend-service.yaml -n development