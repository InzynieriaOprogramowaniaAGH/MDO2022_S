FROM bitnami/git:latest AS git
WORKDIR volume_in
RUN rm -rf /volume_in/*
RUN git clone https://github.com/DiscordSRV/DiscordSRV.git
