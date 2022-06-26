FROM nginx:stable-alpine

ADD /var/jenkins_home/workspace/PipeLine/INO/termin2/DK306669/build /usr/share/nginx/html
