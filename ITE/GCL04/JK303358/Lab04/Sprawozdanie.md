# Zajęcia 04
### 2022-03-28 -- 2022-04-01
---
# Dodatkowa terminologia w konteneryzacji, instancja Jenkins

## Zadania do wykonania
### Zachowywanie stanu
* Przygotuj woluminy wejściowy i wyjściowy, o dowolnych nazwach, i podłącz je do kontenera bazowego, z którego rozpoczynano poprzednio pracę

Aby utworzyć woluminy użyto polecenia `docker volume create`. Zostały nazwane vol-in i vol-out.

![volume create](Pictures/1.png?raw=true)

---

* Uruchom kontener, zainstaluj niezbędne wymagania wstępne (jeżeli istnieją), ale *bez gita*

Kontener uruchomiono w trybie interaktywnym nadając mu nazwe `L4` z zamontowaniem woluminów - użyto komendy `sudo docker run -it --name L4 --mount source=vol-in,destination=/input-volume --mount source=vol-out,destination=/output-volume ubuntu`

![docker run](Pictures/2.png?raw=true)

Zainstalowano niezbędne narzędzia - maven i java. Wykonano polecenia:

```
apt-get update
apt-get -y install maven
apt-get -y install openjdk-11-jdk
```

![maven install](Pictures/3.png?raw=true)

![java install](Pictures/4.png?raw=true)

---

* Sklonuj repozytorium na wolumin wejściowy

Z zewnątrz kontenera sklonowano repozytorium projektu na wolumin wejściowy do katalogu `repo`. Uruchomiono polecenie `sudo git clone https://github.com/sirjk/Hello-World-With-Tests-Maven.git ./var/lib/docker/volumes/vol-in/_data/repo/`

![git clone](Pictures/5.png?raw=true)

---

* Uruchom build w kontenerze

Przechodząc w kontenerze do katalogu repo uruchomiono build poleceniem `mvn install`

![mvn install](Pictures/6.png?raw=true)

![mvn install](Pictures/7.png?raw=true)

---

* Zapisz powstałe/zbudowane pliki na woluminie wyjściowym

Wynikowy folder `target` został skopiowany na wolumin wyjściowy (katalog output-volume). Komenda `cp -R target ../../output-volume/`

![copy target](Pictures/8.png?raw=true)

---

### Eksponowanie portu
* Uruchom wewnątrz kontenera serwer iperf (iperf3)

Uruchomiono kontener `L4_1` wiążąc jego port 5201 z portem 5201 hosta (parametr --publish). Polecenie `sudo docker run -it --name L4_1 --publish 5201:5201 ubuntu`
Zainstalowano w nim i uruchomiono serwer iperf3 -s. Polecenia:

```
apt-get update
apt install iperf3
iperf3 -s
```

![docker run](Pictures/9.png?raw=true)

![iperf3 start](Pictures/10.png?raw=true)

---

* Połącz się z nim z drugiego kontenera, zbadaj ruch

Uruchomiono drugi kontener `L4_2` wiążąc jego port 5201 z portem 5211 hosta. Polecenie `sudo docker run -it --name L4_2 --publish 5211:5201 ubuntu`
W nim także zainstalowano serwer iperf3.

![docker run](Pictures/11.png?raw=true)

Z zewnątrz sprawdzono adres pierwszego kontenera, na którym uruchomiono iperf3 - polecenie `sudo docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' L4_1` 

![ip check](Pictures/12.png?raw=true)

Z drugiego kontenera połączono się komendą `iperf3 -c 172.17.0.2 -t 30 -p 5201`. Przesłano łącznie 80,8Gb ze średnią prędkością 23,1Gb/s.

![transfer](Pictures/13.png?raw=true)

---

* Połącz się spoza kontenera (z hosta i spoza hosta)

Zainstalowano iperf3 na hoście połączono się z niego. Komenda `iperf3 -c 127.0.0.1 -t 30 -p 5201`. Przesłano łącznie 53,6Gb ze średnią prędkością 15,4Gb/s.

![transfer](Pictures/17.png?raw=true)

Podjęto próbę połączenia się spoza hosta. Uruchomiono PS jako administrator w folderze, w którym znajdował się plik wykonywalny iperf3.exe. Uruchomiono polecenie `./iperf3.exe -c 127.0.0.1 -t 30 -p 5211` jednak zwracało błąd `connection refused`. Wyłączenie zapory sieciowej nie pomogło.

![transfer](Pictures/18.png?raw=true)

---

* Przedstaw przepustowość komunikacji lub problem z jej zmierzeniem (wyciągnij log z kontenera)

| Źródło | Przepustowość | Transfer |
|---|---|---|
| Kontener | 23.1 Gbits/sec | 80.8 GBytes |
| Host | 15.4 Gbits/sec | 53.6 GBytes |

---

### Instancja Jenkins
* Zapoznaj się z dokumentacją  https://www.jenkins.io/doc/book/installing/docker/
* Przeprowadź instalację skonteneryzowanej instancji Jenkinsa z pomocnikiem DIND

Przeprowadzono instalację zgodnie z instrukcją.

* Zainicjalizuj instację, wykaż działające kontenery, pokaż ekran logowania

Uruchomiono kontener - polecenie:

```
 docker run --name jenkins-blueocean --rm --detach \
--network jenkins --env DOCKER_HOST=tcp://docker:2376 \
--env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
--publish 8080:8080 --publish 50000:50000 \
--volume jenkins-data:/var/jenkins_home \
--volume jenkins-docker-certs:/certs/client:ro \
myjenkins-blueocean:2.332.2-1
```

oraz sprawdzono działające kontenery `sudo docker ps`

![jenkins](Pictures/14.png?raw=true)

Dodano przekierowanie portu wirtualnej maszyny 8080 na port 8282 hosta.

![jenkins](Pictures/15.png?raw=true)

Ekran logowania:

![jenkins](Pictures/16.png?raw=true)
