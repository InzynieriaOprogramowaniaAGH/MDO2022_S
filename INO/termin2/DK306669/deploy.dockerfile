FROM nginx:stable-alpine
RUN ls
COPY /build/ /usr/share/nginx/html
