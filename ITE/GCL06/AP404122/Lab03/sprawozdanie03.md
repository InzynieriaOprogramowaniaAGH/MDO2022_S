## Klonowanie repozytorium
![Screen1](01-klonowanie.png)
## Przeprowadzenie build'u
![Screen2](02-build.png)
## Przeprowadzenie testów
![Screen3](03-testy.png)
## Stworzenie konetenera i sklonowanie w nim repo
![Screen4](04-docker_i_klon.png)
## Build wewnątrz kontenera
![Screen5](05-build_in_docker.png)
## Testy wewnątrze kontenera
![Screen6](06-test_in_docker.png)
## Stworzenie Dockerbuild
```docker
FROM openjdk:11
RUN git clone https://github.com/spring-projects/spring-petclinic.git
RUN cd spring-petclinic && ./mvnw package
```
## Odpalenie Dockerbuild
![Screen7](07a-dockerbuild.png)
![Screen8](07-dockerbuild.png)
## Stworzenie Dockertest
```docker
FROM pet:latest
RUN cd spring-petclinic && ./mvnw test
```
![Screen9](08a-dockertest.png)
![Screen10](08b-dockertest.png)