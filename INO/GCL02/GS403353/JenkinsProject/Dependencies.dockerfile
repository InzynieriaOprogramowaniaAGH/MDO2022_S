FROM ubuntu:latest

RUN apt-get update  -y
RUN apt-get install git -y
RUN apt-get install make -y
RUN apt install build-essential -y
