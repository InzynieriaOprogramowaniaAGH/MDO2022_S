# syntax=docker/dockerfile:1
FROM node:16.15.0
RUN git clone https://github.com/kentcdodds/testing-node-apps.git
WORKDIR /testing-node-apps/
RUN npm install
RUN npm run build
