#!/bin/bash
kubectl apply -f deployment.yml
sleep 60
kubectl rollout status deployment/mc
if [[ "$?" -ne 0 ]]; then
    echo "deployment failed!"
else
    echo "deployment succeeded"
fi