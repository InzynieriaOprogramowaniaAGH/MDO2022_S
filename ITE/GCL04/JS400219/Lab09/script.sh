#!/bin/sh
mkdir -p /deploy/jenkins
wget https://raw.githubusercontent.com/bsponge/gomodifytags/main/jenkins/example -O /deploy/jenkins/example
wget https://raw.githubusercontent.com/bsponge/gomodifytags/main/jenkins/expected-output -O /deploy/expected
wget https://raw.githubusercontent.com/bsponge/gomodifytags/main/Dockerfile-test-deploy -O /deploy/Dockerfile-test-deploy

cd /deploy

docker build -t deploy-test -f Dockerfile-test-deploy --build-arg image=bsponge/deployment-image:latest .
docker run --name test-deployment deploy-test
docker logs test-deployment >> testoutput.log
diff testoutput.log expected && touch success
