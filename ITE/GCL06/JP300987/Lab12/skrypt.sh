#!/bin/bash
kubectl apply -f d.yml
sleep 60
kubectl rollout status deployment/jp-nginx-deployment
if [[ "$?" -ne 0 ]]; then
    echo "ERROR"
else
    echo "OK"
fi
