FROM node:latest
RUN apt-get update
RUN git clone https://github.com/DTomArt/deltachat-desktop-fork.git
WORKDIR ./deltachat-desktop-fork
RUN npm i && npm run build