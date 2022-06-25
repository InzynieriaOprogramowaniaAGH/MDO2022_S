
FROM debian:10

RUN apt update
RUN apt install -y git gcc make
RUN git clone https://github.com/lz4/lz4.git
WORKDIR lz4
CMD make install