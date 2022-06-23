FROM node:15.12.0-alpine3.10

RUN ln -snf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && echo Europe/Warsaw > /etc/timezone
RUN apk add  git

RUN git clone https://github.com/feathersjs/feathers-chat
WORKDIR /feathers-chat

EXPOSE 3030

RUN npm install
CMD [ "npm", "start" ]
