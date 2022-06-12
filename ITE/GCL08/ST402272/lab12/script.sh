#!/bin/bash

if [ $# -ne 2 ]; then
	echo "This script requires exactly 2 arguments."
	exit 1
fi

name=$1
deployment=$2

kubectl apply -f $name
timeout 60 /usr/local/bin/minikube kubectl rollout status $deployment

if [ $? -eq 0 ]; then
	echo "SUCCESS."
    exit 0
else
	echo "FAILURE."
    exit 1
fi
