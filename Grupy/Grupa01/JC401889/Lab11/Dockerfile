FROM node:lts

RUN apt-get update; apt-get upgrade -y; apt-get install -y rpm; 
RUN export LINUX_TARGET=deb; 
RUN git clone https://github.com/wireapp/wire-webapp.git; 
WORKDIR /wire-webapp
RUN yarn; 
RUN mv .env.localhost .env 
CMD yarn start; 