FROM builder:latest
WORKDIR /nodejs.org/
RUN npm run test
