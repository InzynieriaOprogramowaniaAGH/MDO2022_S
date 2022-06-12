#!/bin/bash

kubectl apply -f nginx-deployment.yaml

sleep 60

check=$(kubectl rollout status deployment/nginx-deployment)

if [[ "$check" = *"successfully"* ]];
then
	echo "Udalo sie"
else
	echo "Nie udalo sie"
	kubectl rollout undo deployment/nginx-deployment
fi
