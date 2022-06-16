kubectl apply -f deployment.yml
sleep 60
kubectl rollout status -f deployment.yml
if [[ "$?" -ne 0 ]] then
	echo "deploy success"
else
	echo "deploy fail"
fi
