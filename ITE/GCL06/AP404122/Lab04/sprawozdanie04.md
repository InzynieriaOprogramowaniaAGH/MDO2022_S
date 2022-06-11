# Zachowwywanie stanu
## Przygotowanie woluminu wejściowego i wyjściowego
![Screen1](01-create_vols.png)
## Uruchomomienie konetenera
![Screen2](02-run-vol.png)
## Sklonowanie i zbudowanie repozytorium
![Screen3](03-clone.png)
![Screen4](03a-build_in.png)
![Screen5](03b-build_in.png)
## Zapisanie powstałych plików w woluminie wyjściowym
![Screen6](04-save_jar.png)
# Eksponowanie portu
## Uruchomienie kontenera i serwera iperf wewnątrze niego na porcie 8000
![Screen7](05-iperf3_server.png)
![Screen8](05b-listen.png)
## Podłączenie się za pomocą drugiego konetenera
![Screen9](06-connect_con.png)
## Podłączenie się z spoza kontenera
![Screen10](07-connect_host.png)
* Przepustowość kontener - kontener: 2.05 GB/s
* Przepustowość kontener - host: 1.78 GB/s
# Instancja Jenkins
## Tworzenie sieci Jenkins
![Screen11](08-jenkins.png)
## Stworzenie docker:dind według instrukcji
![Screen12](09-DIND.png)
## Stworzenie Dockerfile i zbudowanie obrazu z jego pomocą
```docker
FROM jenkins/jenkins:2.332.1-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyrings.asc https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyrings.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
```
![Screen13](09-docker_build.png)
## Uruchomienie Jenkinsa
![Screen13](10-run_jenkins.png)
## Instalacja dodatków oraz tworzenie admina
![Screen13](11-addons.png)
![Screen13](12-inst_addons.png)
![Screen13](13-create_admin.png)
![Screen13](14-complete.png)