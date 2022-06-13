FROM build_node:latest
WORKDIR /testing-node-apps/

RUN npm pack
