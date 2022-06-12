FROM builder:latest
WORKDIR /mle_out/mle
RUN make test