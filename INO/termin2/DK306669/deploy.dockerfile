FROM nginx:stable-alpine
WORKDIR /nodejs.org/
RUN ls
COPY /build/ /usr/share/nginx/html
