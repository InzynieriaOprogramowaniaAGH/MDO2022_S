FROM node:14.16.1-buster
RUN apt-get update
RUN apt-get install -y --no-install-recommends git nano
RUN git clone https://github.com/BuiDuyThanh/node-chat-app
WORKDIR ./node-chat-app
RUN npm install
EXPOSE 3000
ENTRYPOINT npm run start
