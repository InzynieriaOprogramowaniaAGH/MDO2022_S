FROM builder:latest

RUN tar cfJ archive.tar.xz build
