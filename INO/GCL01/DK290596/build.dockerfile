FROM node:latest

RUN git clone https://github.com/DanielKabat97/node-red_fork

WORKDIR node-red_fork

RUN npm install
RUN npm run build
