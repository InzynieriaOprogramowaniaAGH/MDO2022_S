kubectl apply -f project-2.yaml
timeout 60 kubectl rollout status deployment/node-project
if [ $? -eq 0 ]
then
    echo "Deployed successfully"
else
    echo "Something went wrong"
fi