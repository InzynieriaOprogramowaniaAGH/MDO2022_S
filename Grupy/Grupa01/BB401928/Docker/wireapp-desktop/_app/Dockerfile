FROM node:lts

WORKDIR /app

RUN apt-get update; apt-get upgrade -y; apt-get install -y rpm; \
    git config http.sslVerify false; \ 
    cd /app; \
    export LINUX_TARGET=deb; \
    git clone https://github.com/wireapp/wire-webapp.git; \
    cd ./wire-webapp; \
    yarn; \
    mv .env.localhost .env \
    yarn start; 



