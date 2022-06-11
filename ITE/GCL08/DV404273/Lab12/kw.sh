#!/bin/bash
start=$SECONDS
current=$(minikube kubectl -- get deployment mysql | tail -n+2 | awk '{print $2}' | cut -d "/" -f1)
desired=$(minikube kubectl -- get deployment mysql | tail -n+2 | awk '{print $2}' | cut -d "/" -f2)

while [ "$current" != "$desired" ]
do
    current=$(minikube kubectl -- get deployment mysql | tail -n+2 | awk '{print $2}' | cut -d "/" -f1)
    desired=$(minikube kubectl -- get deployment mysql | tail -n+2 | awk '{print $2}' | cut -d "/" -f2)
done
duration=$(( SECONDS - start ))
echo "done in: $duration"


