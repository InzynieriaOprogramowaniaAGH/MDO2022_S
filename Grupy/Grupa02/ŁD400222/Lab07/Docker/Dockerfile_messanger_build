FROM ubuntu:latest AS git
RUN apt-get -y update
RUN apt-get -y install git
RUN git clone https://github.com/Radglay/messaging-app

FROM git as java
RUN apt-get -y update
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get install -y tzdata
RUN apt-get install -y default-jre && apt-get install -y default-jdk
RUN apt-get install -y maven

FROM java as redis
RUN apt-get install -y redis-server
WORKDIR /messaging-app
RUN mvn clean install
ENTRYPOINT redis-server