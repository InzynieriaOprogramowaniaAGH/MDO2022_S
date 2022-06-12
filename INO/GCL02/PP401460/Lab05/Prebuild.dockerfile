FROM ubuntu:latest

RUN apt-get update && apt-get install -y git
CMD ["sh", "-c",  "git clone --recursive https://github.com/adsr/mle.git && cp -r mle /mle_src"]
