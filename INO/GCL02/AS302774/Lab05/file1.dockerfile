FROM node:latest
RUN git clone https://github.com/cytoscape/cytoscape.js.git

WORKDIR /cytoscape.js/
RUN npm install
RUN npm run build
