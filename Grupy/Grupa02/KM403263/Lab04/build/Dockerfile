FROM node:16

RUN apt-get update
RUN apt-get install yarn -y
RUN apt-get install git -y 

RUN git clone https://github.com/wireapp/wire-webapp app

WORKDIR /app

RUN yarn
RUN yarn build:prod