FROM ptrk00/mle_rt

RUN apt-get -y install build-essential libtool automake 

CMD ["sh", "-c", "cd /mle_src/mle && make && mkdir /mle_out && cp -r /mle_src/mle /mle_out && cp ./mle /build && make clean_quick"]
