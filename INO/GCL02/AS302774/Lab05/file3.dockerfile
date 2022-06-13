FROM node

COPY /build/ .

RUN node cytoscape.min.js
