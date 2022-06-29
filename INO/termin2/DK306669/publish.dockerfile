FROM builder:latest
WORKDIR /nodejs.org/
RUN tar cfJ archive.tar.xz build
