minikube kubectl -- apply -f deployment-app-petclinic.yml
timeout 60 minikube kubectl -- rollout status  -f deployment-app-petclinic.yml
if [ $? -eq 0 ]
then
    echo "Deploy has been sucessfully finished."
else
    echo "Fail, something went wrong with deploy."
fi