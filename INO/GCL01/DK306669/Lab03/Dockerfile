FROM node:latest

RUN apt update

WORKDIR /usr/app

RUN cd /usr/app

RUN git clone https://github.com/nexe/nexe.git

RUN cd nexe

RUN cd nexe && npm init -yes

RUN cd nexe && npm i

RUN cd nexe && npm install --global mocha

RUN cd nexe && npm install ts-node --save-dev

RUN cd nexe && npm test
