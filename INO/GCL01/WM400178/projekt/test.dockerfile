FROM builder:latest

WORKDIR /nodejs.org/
RUN ls
RUN ls build
RUN npm run test
