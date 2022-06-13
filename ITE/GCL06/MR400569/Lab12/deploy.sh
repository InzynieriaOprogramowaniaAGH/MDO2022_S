#!/bin/bash

minikube kubectl delete deployment nginx
minikube kubectl apply -- -f deployment.yaml
timeout 30 minikube kubectl rollout status -- -f deployment.yaml
if [ $? -eq 0 ]
then
    echo -e "\033[32m Successful deployment \033[m"
else
    echo -e "\033[31m ERROR! Deployment failed \033[m"
fi