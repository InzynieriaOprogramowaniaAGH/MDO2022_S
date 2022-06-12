FROM nginx:stable-alpine

COPY /build/en/ /usr/share/nginx/html
COPY /build/static/ /usr/share/nginx/html
