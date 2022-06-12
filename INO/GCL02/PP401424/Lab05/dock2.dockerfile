FROM builder:latest

WORKDIR /Bitcoin-Blockchain-Explorer2/
RUN npm run test
