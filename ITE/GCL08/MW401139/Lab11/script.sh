#!/bin/zsh

DEPLOY='deployments/node-red-deploy'

timeout 60 /usr/local/bin/minikube kubectl rollout status $DEPLOY

if [ $? -eq 0 ]; then
	echo "done faster than 60 s"
    exit 0
else
	echo "failure"
    exit 1
fi

