#!/bin/bash

if [ "$1" == "" ]; 
then
    echo "Brak nazwy obrazu!"
    exit 1;
fi

text="${1//\//\\\/}"
echo $text
cat deploytemplate.yaml | sed "s/XXXXXXXXXX/$text/g" > tmp_deploytemplate.yaml


minikube kubectl -- apply -f tmp_deploytemplate.yaml   


timeout=60
shift
(
minikube kubectl -- rollout status deployment/komunikator-deployment &
runnerpid=$!
trap -- '' SIGTERM
(
  sleep $timeout
  if ps -p $runnerpid > /dev/null; then
    kubectl rollout undo deployment/komunikator-deployment
    kill -SIGKILL $runnerpid 2>/dev/null
    echo "Zabito proces wznowiono przywracanie wersji"
  fi
) &
killerpid=$!
wait $runnerpid
kill -SIGKILL $killerpid
echo "Zabito proces, wznowiono przywracanie wersji"
)