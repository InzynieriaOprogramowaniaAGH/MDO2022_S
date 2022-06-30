FROM gcc:latest

ENV CC=/usr/local/bin/gcc
ENV CXX=/usr/local/bin/g++

RUN apt -y update; \
	apt -y install cmake; \
	mkdir -p /usr/src/project

WORKDIR /usr/src/build

CMD cmake ../project && cmake --build .

