###1. Tworzenie volume

`docker volume create volume_in`

###2. Uruchamianie kontenera z podpiętymi volume'ami

`docker run -it --name builder_volume3 -v volume_in/pinia -v volume_out/build builder`

gdzie: /pinia to katalog, ktory przy wlaczaniu kontenera jest kopiowny do volume.

przejscie do volume 
```cd ..
cd volume_in
```

uruchomienie buildu
`yarn build`

###3. Test połączeń
instalacja iperf3
```apt-get update
apt-get install iperf3
```

włączenie iperf3 jako serwer
`iperf3 -s -f K`
-s - tryb serwera
-f K - format odpowiedzi (Kbit)

włączenie iperf3 jako klient i polaczenie do 172.17.0.2

`iperf3 -c 172.17.0.2 -f K`

###4. Instalacja jenkinsa

utworzenie sieci
`docker network create jenkins`

utworzenie obrazu wraz z DIND
```docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2
```

utworzenie obrazu jenkinsa - w pliku Dockerfile

uruchomienie obrazu z Dockerfile
```
docker run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.332.1-1
```

####po instalacji

polaczenie sie z jenkinsem przez http
`http://localhost:8080`

wyswietlenie secretu
`sudo docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword`



