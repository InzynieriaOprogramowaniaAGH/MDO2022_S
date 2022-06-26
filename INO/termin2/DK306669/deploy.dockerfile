FROM nginx:stable-alpine
WORKDIR /nodejs.org/
RUN echo $(ls)
COPY /build/ /usr/share/nginx/html
