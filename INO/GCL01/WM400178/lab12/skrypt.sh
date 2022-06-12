kubectl apply -f deploy2.yaml
timeout 60 kubectl rollout status deployment/todo-app
if [ $? -eq 0 ]
then
    echo "OK"
else
    echo "ERROR"
fi