FROM nginx:stable-alpine
WORKDIR /nodejs.org/
COPY /build/ /usr/share/nginx/html
