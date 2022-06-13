#!/bin/bash

if [ "$1" == "" ]; then
    echo "Podaj nazwę obrazu jako argument"
    exit 1;

fi


mkdir -p _compile


text="${1//\//\\\/}"
echo $text
cat ./deploy_auto.yaml | sed "s/XXXXXXXXXX/$text/g" > _compile/deploy.yaml


minikube kubectl -- apply -f _compile/deploy.yaml   


timeout=60
shift
(
minikube kubectl -- rollout status deployment/komunikator-deployment &
runnerpid=$!
trap -- '' SIGTERM
( # killer job
  sleep $timeout
  if ps -p $runnerpid > /dev/null; then
    kubectl rollout undo deployment/komunikator-deployment
    kill -SIGKILL $runnerpid 2>/dev/null
    echo "Zabito proces wznowopno przywracanie wersji"
  fi
) &
killerpid=$!
wait $runnerpid
kill -SIGKILL $killerpid
echo "Zabito proces, wznowiono przywracanie wersji"
)

