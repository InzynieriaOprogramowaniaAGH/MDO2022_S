#!/bin/bash

kubectl apply -f httpd-deployment.yaml

sleep 60

check=$(kubectl rollout status  deployment/httpd)

if [[ $check == *"successfully"* ]];
then
	echo "The implementation was successful"
else
	echo "The implementation was not on time"
	kubectl rollout undo deployment httpd
fi