FROM builder:latest

WORKDIR /2048.c/

RUN make test