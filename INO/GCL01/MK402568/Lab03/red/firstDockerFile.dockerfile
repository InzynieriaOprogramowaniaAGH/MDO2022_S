FROM node:latest 

RUN git clone https://github.com/node-red/node-red.git
WORKDIR /node-red/
RUN npm install
RUN npm build
