FROM dependencies:latest

RUN git clone https://github.com/DeNatur/retrofit

WORKDIR retrofit

RUN ./gradlew assemble