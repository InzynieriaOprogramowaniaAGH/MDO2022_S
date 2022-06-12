#!/bin/bash
kubectl apply -f mc-deployment2.yml
sleep 60

test=$(kubectl rollout status deployment/mc)
success="successfully"

if [[ $test == *"$success"* ]];
then
	echo "Poszlo"
else
	echo "Lipa panowie"
	kubectl rollout undo deployment mc
fi
