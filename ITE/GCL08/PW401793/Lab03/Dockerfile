FROM ubuntu

WORKDIR app

RUN apt update && apt install -y git && apt install make
RUN git clone --recurse-submodules https://github.com/aristocratos/bashtop.git
RUN cd bashtop && make install
