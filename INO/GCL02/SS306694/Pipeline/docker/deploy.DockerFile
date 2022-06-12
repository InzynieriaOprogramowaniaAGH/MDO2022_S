FROM app-compiler:latest

RUN ./gradlew samples:run
