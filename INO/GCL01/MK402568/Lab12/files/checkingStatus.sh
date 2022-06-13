#!/bin/bash

kubectl apply -f apache-deployment.yaml

sleep 60

check=$(kubectl rollout status deployment/apache)

if [[ "$check" = *"successfully"* ]];
then
	echo "Accepted"
	kubectl rollout status deployment apache
else
	echo "Not accepted"
	kubectl rollout status deployment apache
	kubectl rollout undo deployment apache
fi		  
