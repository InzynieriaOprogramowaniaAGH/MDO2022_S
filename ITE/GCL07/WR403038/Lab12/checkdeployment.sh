#!/bin/bash

minikube kubectl delete deploy nginx
minikube kubectl apply -- -f deploy.yaml
timeout 60 minikube kubectl rollout status -- -f deploy.yaml
if [ $? -eq 0 ]
then
    echo "Successful deployment"
else
    echo  "Deployment failed"
fi
