cmd() {
    kubectl rollout status deployment/mongo-database
}
if cmd | grep -q 'successfully rolled out'; then
  echo "Deployment is running"
else
  echo "Deployment is not running"
fi