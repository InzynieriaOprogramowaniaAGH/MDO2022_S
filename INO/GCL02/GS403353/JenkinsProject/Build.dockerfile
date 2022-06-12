FROM grrd2000/2048_dependencies:latest

RUN git clone https://github.com/mevdschee/2048.c.git

WORKDIR /2048.c/

RUN make