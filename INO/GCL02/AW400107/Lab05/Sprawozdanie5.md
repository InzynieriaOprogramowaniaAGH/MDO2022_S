# Przygotowanie Pipeline
### kwiecień/maj - 2022 
---
**1.** Pierwszym zadaniem do przygotowania Pipeline'u było uruchomienie naszego Jenkinsa oraz Dinda, zgodnie z dokumentacją ze strony internetowej, użyte komendy: 

 - Dind:
````
$ sudo docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2
````

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/DIND.PNG?raw=true)

 - Jenkins:
  ````
$ sudo docker run --name jenkins-blueocean --restart=on-failure --detach \
    --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
    --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
    --publish 8080:8080 --publish 50000:50000 \
    --volume jenkins-data:/var/jenkins_home \
    --volume jenkins-docker-certs:/certs/client:ro \
    myjenkins-blueocean:2.332.3-1
````
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/Jenkins.PNG?raw=true)

**2.** Następnym zadaniem było przygotowanie plików dockerfile potrzebnych do: inicjacji, buildu, testowania, deploy'a oraz publish'a.

 

 - **Deps-irssi** - dockerfile potrzebny do załadowania odpowiednich dependencji, zostały wpisane tylko te konieczne do poprawnego przeprowadzenia pipeline'u. Użyta `fedora:34` w celu uniknięcia błędów (pojawiły się kilkukrotnie błędy przy tworzeniu pipeline'u).
 
 ````FROM fedora:34
RUN yum install -y --skip-broken git gcc gcc-c++ make automake meson ca-c* libgcrypt* glib2* utf8proc* openssl-devel ncurses* libgcrypt* glib2-devel utf8proc* openssl-devel ncurses*`
````
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/deps_irssi.PNG?raw=true)
 
 - **Build-irssi** - dockerfile potrzebny do zbudowania programu, sklonowanie go z repozytorium, zbudowanie oraz przerzucenie go na wolumin wyjściowy
```
FROM deps-irssi:latest

RUN git clone https://github.com/irssi/irssi.git
WORKDIR irssi
RUN meson setup build
RUN ninja -C build
````
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/build_irssi.PNG?raw=true)

 - **Test-irssi** - dockerfile uruchamiający testy meson
 ````
 FROM build-irssi:latest
WORKDIR build
RUN meson test
````
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/test_irssi.PNG?raw=true)
 - **Deploy-irssi** - uruchomienie programu
 ````
 FROM build-irssi:latest
RUN ninja -C build install
````
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/deploy_irssi.PNG?raw=true)
 - **Publish-irssi** - uruchomiony program z woluminu wyjściowego zostaje spakowany w archiwum tar.gz
````
FROM fedora:34
WORKDIR output
````
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/publish_irssi.PNG?raw=true)

**3.** Wszystkie utworzone dockerfile kopiujemy do naszego kontenera z Jenkinsem:

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/kopiowanie.PNG?raw=true)

**4.** Kolejnym krokiem było przygotowanie pipeline'u. Na local hoście po zalogowaniu na jenkinsa należało wejśc w zakładkę -> New item -> Podać nazwę -> Pipeline oraz wprowadzić skrypt pipeline'a:
````
pipeline {
    agent any

	parameters {
        string(name: 'VERSION', defaultValue: '1.0', description: 'IRSSi version')
    }

    stages {
        stage('Init') {
            steps {
                echo 'Init'
                sh "docker build -t deps-irssi:latest . -f /var/jenkins_home/deps-irssi"
            }
        }
        stage('Build') {
            steps {
                echo 'Build'
                sh "docker build -t build-irssi:latest . -f /var/jenkins_home/build-irssi"
				sh "docker run -t -d --name build-irssi_2 -v output:/output build-irssi:latest"
				sh "docker cp build-irssi_2:/irssi/build ./build-irssi-super"
				sh "docker cp ./build-irssi-super build-irssi_2:/output/build"
				sh "docker stop build-irssi_2"
				sh "docker container rm build-irssi_2"
            }
        }
        stage('Test') {
            steps {
                echo 'Test'
                sh "docker build -t test-irssi:latest . -f /var/jenkins_home/test-irssi"
            }
        }
		stage('Deploy') {
            steps {
                echo 'Deploy'
                sh "docker build -t deploy-irssi:latest . -f /var/jenkins_home/deploy-irssi"
				sh "docker run -t -d -e TERM=xterm --name deploy-irssi_2 -v output:/output deploy-irssi:latest"
				sh "docker exec deploy-irssi_2 irssi"
				sh "docker stop deploy-irssi_2"
				sh "docker container rm deploy-irssi_2"
            }
        }
		stage('Publish') {
            steps {
                echo 'Publish'
                sh "docker build -t publish-irssi:latest . -f /var/jenkins_home/publish-irssi"
				sh "docker run -t -d --name publish-irssi_2 -v output:/output publish-irssi:latest"
				sh "docker exec publish-irssi_2 tar -czvf ${params.VERSION}.tgz ./build"
				sh "docker stop publish-irssi_2"
				sh "docker container rm publish-irssi_2"
            }
        }
    }
}
````
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/twoerzenie.PNG?raw=true)

**5.** Uruchomienie pipeline'u. Na początku należało wybrać wersje IRSSI. Wybrana została wersja 1.0 

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/build_parameters.PNG?raw=true)

 - Wyniki: 
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/uruchomienie.PNG?raw=true)

 - Output pokazujący success

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/succes.PNG?raw=true)

 - Utworzony Pipeline w kontenerze:

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab05/kontener.PNG?raw=true)

Napotkane problemy:

 - Wybranie wersji latest powodowało błędy w buildzie dlatego zdecydowałem się na wybranie fedora:34
 - Występowały kilka razy błędy z dockerfile'ami, za sprawą mojej niewiedzy, że nazwa dockerfile'a musi zaczynać się od małego znaku
 - Problemy z ponownym uruchomieniem Jenkinsa z poprzednich labów, po kilku próbach oraz dokumentacji Jenkinsa (blueoceans) udało się poprawnie postawić hosta.
 
 
