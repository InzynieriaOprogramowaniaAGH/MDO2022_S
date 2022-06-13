FROM node:latest
RUN npm install http-server -g
COPY dist /home/simple-tetris
WORKDIR /home/simple-tetris
RUN  mv ascii-runner-browser.html index.html
ENTRYPOINT ["http-server"]