#!/bin/bash
if [ "$1" == "" ]; then
    echo "Podaj nazwe obrazu: "
    exit 1;
fi

mkdir -p nowyDeployment

text="${1//\//\\\/}"
echo $text
cat ./skrypt-komunikator.yaml | sed "s/nazwaObrazu/$text/g" > nowyDeployment/wygnereowanyDeploy.yaml

minikube kubectl -- apply -f nowyDeployment/wygnereowanyDeploy.yaml  

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
    echo "Blad! Przywracanie sesji..."
  fi
) &
killerpid=$!
wait $runnerpid
kill -SIGKILL $killerpid
echo "Zabito proces!"
)
