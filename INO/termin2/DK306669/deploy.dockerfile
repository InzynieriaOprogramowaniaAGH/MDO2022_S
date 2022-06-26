FROM nginx:stable-alpine
FROM build1:latest
WORKDIR /nodejs.org/
RUN ls
