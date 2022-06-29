FROM nrbuild:latest

WORKDIR /node-red_fork/

RUN npm run test
