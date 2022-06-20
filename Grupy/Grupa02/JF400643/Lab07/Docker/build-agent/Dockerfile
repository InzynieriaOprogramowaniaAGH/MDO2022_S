FROM node:latest
RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/Namuennov/deltachat-desktop
WORKDIR deltachat-desktop
RUN npm install
RUN npm run build
