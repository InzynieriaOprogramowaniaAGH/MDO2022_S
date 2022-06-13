FROM builder:latest

WORKDIR /cytoscape.js
RUN npm run test
