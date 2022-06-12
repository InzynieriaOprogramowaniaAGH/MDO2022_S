FROM ubuntu:latest

RUN mkdir -p mle/DEBIAN
RUN mkdir -p mle/usr/bin

COPY ./Publish.sh /
ENTRYPOINT ["sh", "./Publish.sh"]
