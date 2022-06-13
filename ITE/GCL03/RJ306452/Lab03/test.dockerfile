FROM node-build:latest
WORKDIR /deltachat-desktop/
RUN npm run test
