FROM node:16.0.0-alpine
RUN apk update
RUN apk add git
RUN git clone https://github.com/wireapp/wire-webapp app
WORKDIR /app
RUN yarn install
RUN yarn
RUN mv .env.localhost .env
RUN yarn build:prod
RUN cd server
