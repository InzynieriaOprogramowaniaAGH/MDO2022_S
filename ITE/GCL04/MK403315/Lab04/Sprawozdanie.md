# Sprawozdanie Lab04
## Mateusz Kwiecień, Informatyka Techniczna 
### Realizacja laboratorium

1. Stworzono wolumin wejściowy za pomocą komendy `sudo docker create --name temp -v in_volume:/data busybox` oraz wolumen wyjściowy, zmieniając delikatnie komendę.

![wolumeny](create_volumes.png)

2. Z wolumenu stworzono kontener.

![kontenerzwolumenu](kontener_z_wolumenu.png)

4. Stworzono kontener z dwoma wolumenami `sudo docker run -v in_volume:/data -v out_volume:/app --name lab4 -it ubuntu`.

3. Następnie skopiowano do app z build `sudo docker cp . temp:/data`.

![cp](copy_data_to_app_build_run.png)

4. Uruchomiono testy.

![tests](tests.png)

5. Stworzono sieć za pomocą `docker network create NETWORK`.

6. Następnie korzystając z iperf3 stworzono serwer `docker run --name lab4_serwer  --network NETWORK  -p 5201:5201  -it networkstatic/iperf3 -s`.

![serwwer](iperf3_serwer_running.png)

7. Stworzono także klienta łączącego się z serwerem `sudo docker run --name lab4_klient   --network NETWORK  -it networkstatic/iperf3 -c lab4_serwer`.

![klient](iperf_klient.png)

8. Następnie połączono sie z lokalnej maszyny z serwerem `iperf3 -c 172.21.0.2`.

![fromlocal](iperf_from_local.png)

9. Logi serwera.

![logs](serwer_logs.png)

10. Zauważono, że prędkość transferu była szybsza w przypadku łączenia się z maszyny lokalnej niż z kontenera.

11. Stworzono "bridge network" za pomocą `docker network create jenkins`. 

12. Pobrano i uruchomiono docker:dind za pomocą poniższej komendy `docker run \
  --name jenkins-docker \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind \
  --storage-driver overlay2`

13. Stworzono następujący Dockerfile oraz zbudowano go za pomocą komendy: `docker build -t myjenkins-blueocean:2.332.2-1 .
`

![jenkins_dockerfile](jenkins_dockerfile.png)

14. Następni wywołano następujący docker run:

![jenkins_blue](jenkins_blue.png)

15. Po zalogowaniu się do Jenkinsa zainstalowano wtyczki a następnie dodano pierwszego administratora.

![admin](jenkinsadmin.png)

16. Działający jenkins na maszynie.

![j](jenkins.png).