FROM builder:latest

WORKDIR /node-red

COPY ./ /node-red

RUN npm run test