FROM ubuntu:latest AS git
RUN apt-get -y update
RUN apt-get -y install git
RUN git clone https://github.com/Radglay/messaging-app
COPY ./init.sh ./Java-Simple-Messenger/init.sh

FROM git as java
RUN apt-get -y update
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get install -y tzdata


FROM java as app
RUN apt-get install -y default-jre && apt-get install -y default-jdk