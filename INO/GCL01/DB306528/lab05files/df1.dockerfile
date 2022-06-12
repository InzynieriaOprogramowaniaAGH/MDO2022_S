FROM node:latest
RUN git clone https://github.com/nodejs/nodejs.org.git
WORKDIR /nodejs.org/
RUN npm install -f
RUN npm run build
