FROM nginx:stable-alpine
FROM build1:latest
WORKDIR /nodejs.org/
RUN ls
COPY build /usr/share/nginx/html
