#!/bin/bash
minikube kubectl -- apply -f hello-app-deployment2.yaml
gtimeout 60 minikube kubectl -- rollout status deployment hello-app-deployment

if [ "$?" -eq 0 ]
then
	echo "poprawnie wdrożono"
else
	echo "wdrożenie trwało więcej niż 60 sekund"
fi