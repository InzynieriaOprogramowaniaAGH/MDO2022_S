FROM node:latest

RUN apt update

RUN git clone https://github.com/node-red/node-red

WORKDIR /node-red

COPY ./ /node-red

RUN npm install && npm run build