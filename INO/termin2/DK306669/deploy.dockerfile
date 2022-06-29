FROM nginx:stable-alpine
FROM build1:latest
RUN ls
COPY /build/ /usr/share/nginx/html
