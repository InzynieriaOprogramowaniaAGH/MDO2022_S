#!/bin/bash

kubectl apply -f nginx-deployment.yaml

sleep 60

check=$(kubectl rollout status deployment/nginx-deployment)

if [[ "$check" = *"successfully"* ]];
then 
	echo "Ok"
else 
	echo "Error"
	kubectl rollout undo deployment/nginx-deployment
fi
