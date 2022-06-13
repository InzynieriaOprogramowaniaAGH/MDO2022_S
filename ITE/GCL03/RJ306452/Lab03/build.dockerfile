FROM node:latest
RUN git clone https://github.com/deltachat/deltachat-desktop.git
WORKDIR /deltachat-desktop/
RUN npm install
RUN npm run build
