#!/bin/bash
kubectl apply -f nginx-deployment.yml
sleep 60
kubectl rollout status deployment/nginx-deployment
if [ "$?" -ne 0 ]; then
    echo "Fail od deploy"
else
    echo "Worked"
fi
