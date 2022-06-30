FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install npm
RUN git clone https://github.com/actionsdemos/calculator
WORKDIR calculator/
RUN npm install
RUN npm audit fix --force
