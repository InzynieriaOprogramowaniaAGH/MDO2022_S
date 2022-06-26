FROM nginx:stable-alpine
FROM build1:latest
WORKDIR /nodejs.org/
RUN cp /var/jenkins_home/workspace/PipeLine/INO/termin2/DK306669/build /usr/share/nginx/html
