kubectl apply -f $1

sleep 60
kubectl rollout status deployment/$2
if [ "$?" -ne 0 ]; then
    echo "deployment failed!"
else
    echo "deployment succeeded"
fi