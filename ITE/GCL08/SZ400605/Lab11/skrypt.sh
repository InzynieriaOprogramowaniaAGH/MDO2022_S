#!/bin/bash

cmd() {
  kubectl rollout status deployments/devops-chat-deployment
}

if cmd | grep -q 'deployment "devops-chat-deployment" successfully rolled out'; then
  echo "Deployment running"
else
  echo "Something went wrong"
fi              