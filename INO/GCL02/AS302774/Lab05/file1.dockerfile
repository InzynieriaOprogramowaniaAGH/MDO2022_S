FROM node:16.15.0
RUN git clone https://github.com/cytoscape/cytoscape.js.git

WORKDIR /cytoscape.js/
RUN npm install
RUN export NODE_OPTIONS=--openssl-legacy-provider

RUN npm run build
