Sprawozdanie z laboratorium 4

Piotr Kulis GCL04

1. Volume
	Na początku został odpalony kontener bazowy podobnie jak na poprzednich  zajęciach i ponownie został doinsalowany maven, do czego konieczny był update apt.
	
	Następnie po wyjściu z kontenera zostały stworzone dwa woluminy:
	
	![volume](volume.png "voulme")
	
	Po sworzeniu wolumenów za pomocą polecenia sudo su przeszedłem na root-a.
	
	W odpowiednim katalogu został sklonowane repozytorium oraz przeniesione do katologu _data wolumenu wejściowego.
	
	![clone](clone.png "clone")
	
	![inVolume](inVolume.png "inVolume")
	
	Następnie z użyciem polecenia docker start został ponownie uruchomiony  kontener. Po uruchomieniu otwarto katalog inVolume/_data gdzie jest sklonowane repozytorium.
	W katalogu została uruchomina aplikacja poleceniem mvn clean package.
	
	![build](build.png "build")
	
	Następnie wynik, target, został przekopiowane do katalogu outVolume.
	
2. Porty
	Na dwóch kontenerach utworzonych z tego samego obrazu został  zainstalowany iperf3.
	
	Na pierwszym z kontenerów został odpalony server 
		iperf3 -s -p5566
	Natomiast na drugim
		iperf3 -c 172.17.0.4 -t 30 -p 5566
	
	![C-c iperf3](iperf3_conect.png "C-c iperf3")
	
	Następnie procedurę powtórzono łącząc Kontener z Maszyną Wirtualną.
	
	![C-VM iperf3](iperf3_VM_Kontener.png "C-VM iperf3")
	
	Przy próbie wyprowadzenie portu na zewnątrz i połączenie poza hostem  iperf3 zwracał błąd połączenia. Próba zmiany porto, protokołu a nawet  postawienia na nowo kontenera nie przyniosła powodzenia.
	
	Logi z dwóch udanych połączenie widać na poprzednich zrzutach ekranu.
	
3. Jenkins
	
	Instalacja Jenkinsa odbyłą się zgodnie z podlinkowaną dokumentacja.
	
	Został rozpoczęta od utworzenia sieci poleceniem
		docker network create jenkins
		
	![jenkins_network](jenkins_network.png "jenkins_network")
	
	Następnie został utworzony kontener w oparciu o obraz dind:
	
		docker run --name jenkins-docker --rm --detach \
  		--privileged --network jenkins --network-alias docker \
  		--env DOCKER_TLS_CERTDIR=/certs \
  		--volume jenkins-docker-certs:/certs/client \
  		--volume jenkins-data:/var/jenkins_home \
  		--publish 2376:2376 \
  		docker:dind --storage-driver overlay2
  		
  	![jenkins image](jenkins_image.png "jenkins image")
  	
  	Po utworzeniu kontenera, dla ułatwienia na przyszłość stworzony został Dockerfile:
  	
  		FROM jenkins/jenkins:2.332.1-jdk11
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
		RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:	1.28"
	
	Na podstawie Dockerfila został utworozny obraz a następnie uruchomiony kontener.
	
	![jenikins conteiner](jenkins_kontener.png "jenkins conteiner")
	
	Z wirtualnej maszyny został przekierowany port 8080 na zewnątrz.
	
	Następnie połączono się z Jenkinsem i zalogowana za pomocą uzyskanych danych z polecenia:
		docker logs jenkins-docker
		
	![jenkins](jenkins.png "jenkins")
