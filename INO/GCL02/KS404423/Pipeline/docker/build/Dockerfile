FROM node:latest
WORKDIR /home 
RUN git clone https://github.com/robertrypula/simple-tetris.git
WORKDIR /home/simple-tetris
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm install
RUN npm run-script build