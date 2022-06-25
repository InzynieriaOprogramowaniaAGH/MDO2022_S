# Sprawozdanie Lab nr 4

## 1. Zachowywanie stanu

Utworzono dwa woluminy (wejściowy i wyjściowy) o nazwach `input` i `output`.

![Volume create](1.png)

```
docker volume create input
docker volume create output
docker volume ls
```

Uruchomiono bazowy kontener `golang:1.17-bullseye` oraz podłączono do niego wcześniej utworzone woluminy pod takimi samymi nazwami.

![Container](2.png)

```
docker run -it -v input:/input -v output:/output --name go golang:1.17-bullseye
```

Następnie w nowym okine terminalu, sklonowane zostało repozytorium z projektem.

![Clone](3.png)

oraz zostało ono skopiowane za pomocą Dockerowego cli do woluminu we wcześniej utworzonym kontenerze.

![Cp](4.png)

```
git clone https://github.com/containerd/nydus-snapshotter
docker cp nydus-snapshotter/ go:/input
```

Skopiowane repozytrium jest teraz widoczne w kontenerze.

![Repo](5.png)

Uruchomiono build oraz skopiowano zbudowany plik do woluminu wyjściowego

![Build](6.png)
![Cp bin](7.png)

```
cd /input/nydus-snapshotter/
make build
cp bin/containerd-nydus-grpc /output
```

Skopiowany plik jest widoczny na maszynie host.

![Host](8.png)
#
## 2. Eksponowanie portu

Utworzono kontener z serwerem `iperf3` na bazie obrazu `ubuntu:20.04`. Zainstalowano wymagane paczki oraz sprawdzono adres ip kontenera z utworzonym serwerem.

![Iperf3 server](10.png)

```
docker run -it -p 5201:5201 ubuntu:20.04
apt-get update > /dev/null
apt-get -y install iperf3 net-tools > /dev/null
ifconfig
```

Serwer `iperf3` był uruchamiany na standardowym porcie 5201.

![Server Run](11.png)

```
iperf3 -s
```

Połączenie klienta wykonywane było za pomocą komendy

```
iperf3 -c <server-ip>
```

# a) Połączenie z kontenera

![Container client](12.png)

# b) Połączenie z hosta

![Host client](13.png)

# c) Połączenie z innej maszyny

![Another machine client](15.png)

Przepustowość w pierwszych dwóch przypadkach była porównywalna z lekką przewagą dla połączenia z kontenera. Jest to spowodowane tym, że Docker działa w systemie jako serwis co sprawia, że posiada on większy priorytet. Połączenie nr 3 wykonane było z laptopa w sieci lokalnej, który połączony był do sieci przez Wi-Fi, odbiło się to znacząco na przepustowości.

## 3. Instancja Jenkins

Uruchomiono kontener na podstawie obrazu `docker:bind`.

![Docker dind](18.png)

Następnie według zaleceń stworzono Dockerfile

![Docker Jenkins Dockerfile](19.png)

oraz po zbudowaniu go został uruchomiony

![Docker Jenkins run](20.png)

Uruchomiono stronę konfiguracyjną Jenkins

![Jenkins configuration](16.png)

Odpowiedni kod został pozyskany z logów kontenera Jenkinsa.

![Jenkins register](17.png)

![Jenkins main page](21.png)

![Jenkins containers](22.png)

```
docker network create jenkins

docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2

# prepare Dockerfile

docker build -t myjenkins-blueocean:2.332.1-1 .
docker run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.332.1-1

docker logs <jenkins-container-id> # find password for jenkins configuration
```