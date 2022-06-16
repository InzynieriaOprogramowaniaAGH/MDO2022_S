#!/bin/bash

minikube kubectl apply -- -f deploy.yaml
timeout 60 minikube kubectl rollout status -- -f deploy.yaml
if [ $? -eq 0 ]
then
    echo "Wdrozenie przeszlo pomyslnie"
else
    echo  "Wdrozenie nieudane"
fi
