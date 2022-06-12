
# Sprawozdanie 5

## Przygotowujemy pipeline

* Sama konfiguracja oraz zapewnienie dzialania Jenkins'a byla omawiana w Lab04, dlatego ten etap tutaj pomine.

* Pierwsza rzecza potrzebna do przygotowania tego zadania to uruchomienie Docker in Docker:

 `docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2`
  
* Kolejno uruchamiamy jenkinsa:

`docker run \
  --name jenkins-blueocean \
  --rm \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  jenk`, gdzie jenk jest to nazwa obrazu dockera.
  
* Obraz z dependencjami do builda (dodalem yum update, bo wyskakiwal blad `yum install returned a non-zero code 1`).

![Deps](https://i.imgur.com/jk8rmoL.png)

* Obraz budujacy nasz program, bazujacy na poprzednim.

![Build](https://i.imgur.com/LXUvOP1.png)

* Obraz testujacy, bazujacy na poprzednim.

![Test](https://i.imgur.com/egtrQCS.png)

* Teraz, aby moc uzyc powyzszych Dockerfile'i, musimy je przetransportowac do wnetrza Jenkinsa. Do tego sluzy komenda:

`docker cp "nazwa dockerfile" "nazwa kontenera":/var/jenkins_home/"ewentualna nazwa utworzonego folderu na dockerfile"`

W moim przypadku sa to komendy:

docker cp DOCKER-BUILDER jenkins-blueocean:/var/jenkins_home/Dockerfiles

docker cp DOCKER-DEPENDENCIES jenkins-blueocean:/var/jenkins_home/Dockerfiles

docker cp DOCKER-TEST jenkins-blueocean:/var/jenkins_home/Dockerfiles

Teraz tworzymy nowy rurociag:

![ppl creation](https://i.imgur.com/vFNEqU5.png)

W Pipeline scripcie wklejamy:

```
pipeline {
    agent any
    stages {
        stage('Start') {
            steps {
                echo 'Hello'
                sh "docker build -t dependencies:latest . -f /var/jenkins_home/Dockerfiles/DOCKER-DEPENDENCIES"
            }
        }
        stage('Build') {
            steps {
                echo 'Build'
                sh "docker build -t build:latest . -f /var/jenkins_home/Dockerfiles/DOCKER-BUILDER"
                sh "docker run -t -d --name irssi -v vol_out_irssi:/vol_out_irssi build:latest"
                sh "docker cp irssi:/irssi/build ./build-irssi"
                sh "docker cp ./build-irssi irssi:/vol_out_irssi/build"
                sh "docker stop irssi"
                sh "docker container rm irssi"
            }
        }
        stage('Test') {
            steps {
                echo 'Test'
                sh "docker build -t test:latest . -f /var/jenkins_home/Dockerfiles/DOCKER-TEST"
            }
        }
    }
}
```

W tym momencie mozemy sprawdzic poprawnosc dzialania powyzszych dockerfiles'ow, patrzac czy przechodza testy.

![Pipeline](https://i.imgur.com/SZwWRVP.png)

![Konsola](https://i.imgur.com/jZ2qvVD.png)

Jak widac, testy przechodza poprawnie.

* Po zrobieniu sprawozdania zobaczylem, ze przydaloby sie, aby powyzsza czynnosc byla wykonywana za pomoca pipeline script from SCM, wiec zalaczam tez instrukcje jak zrobic to w drugi sposob:

Na poczatku fork'ujemy sobie projekt IRSSI do nas do osobnego repo, wrzucamy do srodka WSZYSTKIE PLIKI z dockerfilami oraz jenkinsfile, ktory rowniez jest dostepny tutaj na branchu.

W konfiguracji pipeline scriptu mozemy zmienic ja na Pipeline script from SCM. Potem zaznaczamy opcje GIT, przekazujemy adres naszego sforkowanego repo, brancha zostawiamy na master, poniewaz
glowny branch IRSSI to wlasnie master, nie main (w przypadku innych repo trzebaby ta sciezke zmienic).

![SCM](https://i.imgur.com/8J57JwH.png)

Ja swoj Jenkinsfile wrzucilem dodatkowo do folderu, ktory nazwalem jenkins, wiec nizej sama lokacje Jenkinsfile tez trzeba sprecyzowac.

![jpath](https://i.imgur.com/zAxf0f1.png)

## Deploy oraz Publish

* Tworzymy dwa nowe Dockerfile, aby moc obsluzyc funkcjonalosci:

Deploy - uruchomienie programu w kontenerze.

Publish - utworzenie archiwum ze skompilowanym programem.

* W tym momencie przekopiowywujemy obydwa Dockerfile po raz kolejny na Jenkinsa za pomoca komendy `docker cp` (ten krok pomijamy, jezeli korzystamy z SCM).

docker cp DOCKER-DEPLOY jenkins-blueocean:/var/jenkins_home/Dockerfiles

![Deploy](https://i.imgur.com/pD2jSTK.png)

docker cp DOCKER-PUBLISH jenkins-blueocean:/var/jenkins_home/Dockerfiles

![Publish](https://i.imgur.com/1qXMMBs.png)

* Dopisujemy funkcjonalnosci Deploy oraz Publish w Jenkinsfile:

```
        stage('Deploy') {
    steps {
        echo 'Deploy'
        sh "docker build -t deploy:latest . -f /var/jenkins_home/Dockerfiles/DOCKER-DEPLOY"
		sh "docker run -t -d -e TERM=xterm --name deploy -v vol_out_irssi:/vol_out_irssi deploy:latest"
		sh "docker exec deploy irssi"
		sh "docker stop deploy"
		sh "docker container rm deploy"
    }
}
        stage('Publish') {
    steps {
        echo 'Publish'
        sh "docker build -t publish:latest . -f /var/jenkins_home/Dockerfiles/DOCKER-PUBLISH"
		sh "docker run -t -d --name publish -v vol_out_irssi:/vol_out_irssi publish:latest"
		sh "docker exec publish tar -czvf ${params.VERSION}.tgz ./build"
		sh "docker stop publish"
		sh "docker container rm publish"
    }
}
```

* Rezultat

![Result](https://i.imgur.com/CdLUyLa.png)

![Result2](https://i.imgur.com/rWjQqYu.png)

* SCM

![SCMRES](https://i.imgur.com/n5fJXQ8.png)









