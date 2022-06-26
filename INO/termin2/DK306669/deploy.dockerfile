FROM nginx:stable-alpine
FROM build1:latest
WORKDIR /nodejs.org/
COPY /build/ /usr/share/nginx/html
