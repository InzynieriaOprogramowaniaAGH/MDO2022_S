FROM builder:latest

WORKDIR /nodejs.org/
RUN ls
RUN npm run test