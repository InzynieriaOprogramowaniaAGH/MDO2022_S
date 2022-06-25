#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Enter 2 arguments, yaml file and apiVersion"
	exit 1
fi

yaml=$1
name=$2

kubectl apply -f $yaml
timeout 59 /usr/local/bin/minikube kubectl rollout status $name

if [ $? -eq 0 ]; then
	echo "SUCCESS =)"
else
	echo "FAIL =("
fi
