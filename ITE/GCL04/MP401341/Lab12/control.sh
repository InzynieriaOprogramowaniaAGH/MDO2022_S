#!/bin/bash
minikube kubectl apply -- -f $1
timeout 30 minikube kubectl rollout status -- -f $1
if [ $? -eq 0 ]
then 
  echo "Deployment OK"
else
  echo "Deployment FAILED"
fi
