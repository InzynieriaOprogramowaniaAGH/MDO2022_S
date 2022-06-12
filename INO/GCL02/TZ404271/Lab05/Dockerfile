FROM node:latest AS build
RUN git clone https://github.com/avajs/ava.git
WORKDIR /ava
RUN npm install

FROM build AS test
WORKDIR /ava
RUN npm run test