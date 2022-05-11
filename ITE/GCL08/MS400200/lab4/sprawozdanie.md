# Sprawozdanie Lab04 Michał Szymański ITE-GCL08

## Przebieg cwiczenia

1. Przygotowano dwa woluminy (wejsciowy i wyjsciowy):
   ![1](Screenshots/1.png)

2. Utworzono kontener na podstawie obrazu ubuntu, zamontowano w nim stworzone powyzej woluminy:
   ![2](Screenshots/2.png)

3. Do woluminu wejsciowego sklonowano repozytotium https://github.com/opentracing/basictracer-python.git:
   ![3](Screenshots/3.png)

4. Zainstalowano potrzebne narzedzia, stworzono wirtualne srodowisko Python potrzebne do buildu i uruchomienia testow:
   ![4](Screenshots/4.png)
   ![5](Screenshots/5.png)
   ![6](Screenshots/6.png)


## Eksponowanie portu

1. Zainstalowano serwer ```iperf3``` oraz pakiet ```net-tools```:
   ![7](Screenshots/7.png)

2. Rozpoczeto nasluchiwanie na porcie ```2000``` i sprawdzono polaczenie host-kontener:
   ![8](Screenshots/host_kontener.png)

3. Rozpoczeto nasluchiwanie na porcie ```2000``` i sprawdzono polaczenie kontener-kontener:
   ![9](Screenshots/kontener_kontener.png)

4. ```ifconfig``` dla hosta:
   ![10](Screenshots/8.1.png)

5.  Zainstalowano serwer ```iperf3``` na system poza hostem, dokonano proby nasluchiwania portu ```2000```:
    ![11](Screenshots/9.png)
    Polaczenie zostalo odrzucone gdyz host nie naslchuowal naa tym porcie. Nalezy zatem uruchomienic kontener z opcja ```--publish```.

6. Uruchomiono kontener z opcja ```--publish``` i ustawiono zakres nasluchiwania na port 2000:
   ![12](Screenshots/10.png)

7.  Rozpoczeto nasluchiwanie na porcie ```2000``` i sprawdzono polaczenie host-system spoza hosta:
    ![13](Screenshots/11.png)

8. Porownano maksymalne wartosci birate dla 3 powyzszych typow polaczen:
    ||Container-container | Host-container  | Stranger-host|
    |---|--- | --- | ---|
    |Birate max (Gbits/sec)|36.2|45.5|0.57|

    Najszybsze jest polaczenie host-kontener, najbardziej skomplikowana trase pakiet musi pokonac z 'obcej' maszyny do hosta.


## Instalacja Jenkins

1. Stworzono siec na Dockerze za pomoca polecenia ```sudo docker network create jenkins```.

2. Pobrano i uruchomiono obraz ```docker:dind```:
   
   ```
    docker run --name jenkins-docker --rm --detach ^
    --privileged --network jenkins --network-alias docker ^
    --env DOCKER_TLS_CERTDIR=/certs ^
    --volume jenkins-docker-certs:/certs/client ^
    --volume jenkins-data:/var/jenkins_home ^
    --publish 3000:3000 --publish 2376:2376 ^
    docker:dind
    ```
3. Utworzono Dockerfile:

    ```
    FROM jenkins/jenkins:2.332.2-jdk11
    USER root
    RUN apt-get update && apt-get install -y lsb-release
    RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg
    RUN echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
    RUN apt-get update && apt-get install -y docker-ce-cli
    USER jenkins
    RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
    ```
4. Zbudowano obraz na podstawie Dockerfile:
    ![14](Screenshots/12.png)

5. Uruchomiono kontener na powyzszym obrazie, nastepnie poleceniem ```docker logs [ID_KONTENERA]``` wyswietlono logi w celu uzyskania hasla do Jenkins:
    ![15](Screenshots/13.png)

6. Zalogowano sie do Jenkins:
    ![16](Screenshots/14.png)


    