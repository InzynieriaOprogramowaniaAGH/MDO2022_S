#!/bin/bash
kubectl apply -f config-nginx.yml
sleep 60
kubectl rollout status deployment.apps/nginx-dep3
if [ $? -eq 0 ]; then
	echo "Everything is fine!"
else
	echo "Something went wrong!"
fi