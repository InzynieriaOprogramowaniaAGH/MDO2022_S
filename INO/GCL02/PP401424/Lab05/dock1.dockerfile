FROM node:latest

RUN git clone https://github.com/Virtuoso0/Bitcoin-Blockchain-Explorer2.git
WORKDIR /Bitcoin-Blockchain-Explorer2/

RUN npm install
RUN npm run build

