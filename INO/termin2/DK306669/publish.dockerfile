FROM builder:latest
WORKDIR /nodejs.org/
RUN tar cfJ nodejs_archive.tar.xz build
