# Sprawozdanie Krystian Zapart Lab03

1. Link do open-source'owego repo użytego w ramach labolatorium.

```https://github.com/actionsdemos/calculator```
 
2. Uruchomienie kontenera

![cont_run](./screenshots/cont_run.png)

3. Podpięcie się do kontenera

![attach](./screenshots/attach.png)

4. Zaopatrzenie kontener w wymagane pakiety 

![update](./screenshots/update.png)

5. Klonowanie repozytorium 

![git](./screenshots/git.png)

6. Build & Test

![install_test](./screenshots/install_test.png)

7. Napisanie i uruchomienie Dockerfile'a do buildowania 

```
FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install git -y
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install npm -y
RUN git clone https://github.com/actionsdemos/calculator
WORKDIR "/calculator"
RUN npm install
```
![docker_build](./screenshots/docker_build.png)

8. Napisanie i uruchomienie Dockerfile'a do Testowania

```
FROM oi:latest
WORKDIR "/calculator"
RUN npm test
```
![docker_test](./screenshots/docker_test.png)


W kontenerze stworzonym za pomocą naszego obrazu pracuje nasz program,który dzięki kontenerowi jest odizolowany od głównego systemu. 
