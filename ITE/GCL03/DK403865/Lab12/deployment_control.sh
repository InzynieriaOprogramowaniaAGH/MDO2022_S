#!/bin/bash
minikube kubectl -- apply -f pod_todo.yaml
timeout 60 minikube kubectl -- rollout status deployment/todo-deployment

if [ "$?" -eq 0 ]
then
	echo "SUCCESS - poprawnie wdrożono aplikację z pliku yaml 🍉"
else
	echo "ERROR - wdrożenie zajęło zbyt długo 😭"
fi
