FROM build1:latest
WORKDIR /nodejs.org/
RUN npm run test

