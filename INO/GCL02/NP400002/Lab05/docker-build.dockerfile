FROM node:14

RUN git clone https://github.com/Kisia123/testing-node-apps.git
WORKDIR /testing-node-apps/
RUN npm install
RUN npm run build
