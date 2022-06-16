# Sprawozdanie
### Kamil Kruczek GL04

## Woluminy

1. Utworzenie woluminów wejściowych i wyjściowych 
``` sudo docker volume create input_vol ```   
``` sudo docker volume create output_vol ```

![](2022-06-15-16-53-56.png)

2. Uruchomienie kontenera w trybie interaktywnym
``` sudo docker run -it --name build --mount "source=input_vol,target=/in" --mount "source=output_vol,target=/out" starter /bin/bash ```

![](2022-06-16-15-16-02.png)

3. Sklonowanie repozytorium na wolumin wejściowy

![](2022-06-16-16-34-07.png)

4. Uruchomienie buildu w kontenerze

![](2022-06-16-16-38-52.png)

5. Skopiowanie plików do woluminu wyjściowego

![](2022-06-16-16-43-57.png)

## Porty

1. Uruchomienie serwera na nowym kontenerze ubuntu

![](2022-06-16-23-42-00.png)

2. Połączenie się za pomocą innego kontenera ubuntu

![](2022-06-16-23-44-05.png)
## Instalacja Jenkins

1. Wykonanie polecenia ``` sudo docker network create jenkins ```

![](2022-06-15-16-14-44.png)

2. Wykonanie polecenia ``` sudo docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2 ```

  ![](2022-06-15-16-17-21.png)

  3. Zbudowanie obrazu z pliku dockerfile:

  ![](2022-06-15-16-23-24.png)

  4. Wykonanie polecenia ``` sudo docker run --name jenkins-blueocean --restart=on-failure --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.332.3-1 ```

  ![](2022-06-15-16-25-01.png)

  5. Działający Jenkins

  ![](2022-06-15-16-44-23.png)

