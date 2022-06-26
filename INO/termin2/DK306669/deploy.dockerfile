FROM nginx:stable-alpine

COPY /finalBuild/ /usr/share/nginx/html
