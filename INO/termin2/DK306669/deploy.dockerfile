FROM nginx:stable-alpine
WORKDIR /nodejs.org/
RUN echp $(ls)
COPY /build/ /usr/share/nginx/html
