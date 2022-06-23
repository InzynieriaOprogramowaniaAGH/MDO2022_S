FROM node:16

RUN apt update -y
RUN apt install -y yarn git
RUN npm install rimraf -g

RUN git clone https://github.com/wireapp/wire-webapp.git

WORKDIR wire-webapp

RUN yarn
RUN yarn build:prod

