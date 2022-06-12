FROM ubuntu:latest

COPY ./2048 /usr/bin/
CMD ["/usr/bin/2048"]