#!/bin/bash

minikube kubectl apply -- -f nginx_deploy.yaml
timeout 60 minikube kubectl rollout status -- -f nginx_deploy.yaml
if [ $? -eq 0 ]
then
  echo "OK"
else
  echo "NOT OK"
fi
