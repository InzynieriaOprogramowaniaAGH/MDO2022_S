#!/bin/bash

cmd() {
  kubectl rollout status deployments/devops-golang-microservice-deployment
}

if cmd | grep -q 'deployment "devops-golang-microservice-deployment" successfully rolled out'; then
  echo "Deployment is up and running"
else
  echo "Deployment is not running"
fi             