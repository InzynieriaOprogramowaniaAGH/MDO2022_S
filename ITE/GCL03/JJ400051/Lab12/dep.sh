#!/bin/bash
kubectl apply -f dep.yaml
sleep 60
kubectl rollout status deployment/nginx-deployment
if [[ "$?" -ne 0 ]]; then
    echo "Failed"
else
    echo "Congrats - success"
fi

