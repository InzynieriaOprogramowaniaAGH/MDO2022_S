FROM ubuntu:latest
WORKDIR app

RUN apt update && apt install -y --no-install-recommends \
    git ssh \
    && rm -rf /var/lib/apt/lists/*; \
    chmod 777 /app;
