FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install git -y
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install npm -y
RUN git clone https://github.com/actionsdemos/calculator
WORKDIR "/calculator"
RUN npm install
# RUN npm install --save-dev nyc
# RUN npm install -g nyc
# RUN npm test