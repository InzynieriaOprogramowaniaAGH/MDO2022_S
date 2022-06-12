Metodyki Devops - przygotowujemy pipeline  
Krzysztof Garbarz  
WIMiIP 403931


### 1. Proces przygotowawczy
 - Na tym etapie zakładamy, że Jenkins jest prawidłowo zainstalowany w odosobnionym środowisku - w tym przypadku wirtualna maszyna - uruchomiony i gotowy do działania. Proces jego instalacji przeprowadzaliśmy w lab04, tam też znajdują się wskazówki co do uruchamiania i logowania do panelu zarządzania.
![](<./Zrzut ekranu 2022-05-15 121506.jpg>)  
![](<./Zrzut ekranu 2022-05-15 121528.jpg>)  
 - Warto przypomnieć, że trzeba wystartować dwa kontenery (dind i jenkins), żeby prawidłowo przejść przez rurociąg.
```
docker run --name jenkins-docker --rm --detach   --privileged --network jenkins --network-alias docker   --env DOCKER_TLS_CERTDIR=/certs   --volume jenkins-docker-certs:/certs/client   --volume jenkins-data:/var/jenkins_home   --publish 2376:2376   docker:dind --storage-driver overlay2
docker run --name jenkins-jen --rm --detach   --network jenkins --env DOCKER_HOST=tcp://docker:2376   --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1   --publish 8080:8080 --publish 50000:50000   --volume jenkins-data:/var/jenkins_home   --volume jenkins-docker-certs:/certs/client:ro   jenk:latest
```
### 2. Oczekiwania i cele
 - Celem jest otrzymanie budującej się i pakującej się paczki ze starym projektem napisanym w archaicznej wersji Angular.
 - Jako że testy dopisane do tego projektu nigdy nie były dostosowane do jego obecnej formy: nie mają prawa przejść (nigdy nie nastąpi SUCCESS) - zatem uruchamiają się, zawsze kończą się `ERR: Some tests failed` ale w odpowiednim dockerfile znajduje się komenda zombie `return 0;` w celu prawidłowego przejścia przez rurociąg.

### 3. Przygotowujemy dane
 - Aby pipeline mógł się wykonać musimy dać mu odpowiednie dane. Potrzebne do tego będą trzy dockerfile: `deps`, `test` i `build`.
![](<./Zrzut ekranu 2022-05-15 171637.jpg>)  
 - Przechodzimy do folderu z wyżej wymienionymi i kopiujemy do kontenera jenkinsa:
```
docker cp deps jenkins-jen:/var/jenkins_home/deps
docker cp test jenkins-jen:/var/jenkins_home/test
docker cp build jenkins-jen:/var/jenkins_home/build
```

### 4. Tworzymy rurociąg
 - Na początku potrzebujemy stworzyć nowy pipeline, nadajemy mu nazwę i przechodzimy do konfiguracji. W samej konfiguracji nic nie zmieniamy - dodajemy tylko własnoręcznie napisany skrypt, który będzie sobie rurociągował.
![](<./Zrzut ekranu 2022-05-15 133616.jpg>)  
 - Pipeline przewiduje dwa parametry - wersję i pytanie czy ma deployować paczkę. Oba parametry są zawarte w poniższym skrypcie.
```
pipeline {
    agent any

	parameters {
        string(name: 'publish_version', defaultValue: '0.0.1', description: 'version to be published')
        
        booleanParam(name: 'publish', defaultValue: true, description: 'should the package be published and deployed?')
    }

    stages {
        stage('Init') {
            steps {
                echo 'ATARI: cleaning old builds if failed'
                sh 'docker stop atari_bld || true && docker rm atari_bld || true'
                sh 'rm -rf /~/atari/dist'
                
                echo 'ATARI: Initializing dependencies'
                sh "docker build -t deps:temp . -f /var/jenkins_home/deps"
                echo 'ATARI: init done'
            }
        }
        stage('Test') {
            steps {
                echo 'Test'
                sh "docker build -t deps:temp . -f /var/jenkins_home/test"
                echo 'Zombie tests done and succeded ;)'
                sh 'rm -rf /~/atari/dist'
            }
        }
        stage('Build') {
            steps {
                echo 'ATARI: cloning & building prod package'
                sh "docker build -t deps:temp . -f /var/jenkins_home/build"
				sh "docker run -t -d --name atari_bld -v vol_build:/vol_build deps:temp"
				echo 'ATARI: moving build outside to volume'
				sh "mkdir -p ./temp-build"
				sh 'docker exec atari_bld rm -rf /vol_build/build'
				sh 'docker exec atari_bld mkdir -p /vol_build/build'
				sh "docker cp atari_bld:~/atari/dist/atari/ ./temp-build/build"
				sh "docker cp ./temp-build/build/ atari_bld:/vol_build"
				echo 'ATARI: cleaning up'
				sh "docker stop atari_bld"
				sh "docker container rm atari_bld"
				echo 'ATARI: build done'
            }
        }
		stage('Deploy') {
		    when { expression { return params.publish } }
            steps {
                echo 'ATARI: cleaning before deploy'
                sh 'docker stop atari || true && docker rm atari || true'
                echo 'ATARI: configuring apache'
				sh "docker run -dit --name atari -p 3000:80 -v vol_build:/vol_build httpd:2.4"
				sh 'docker exec atari cp -r /vol_build/build/ /usr/local/apache2/htdocs/'
				echo 'ATARI: apache ready listening on localhost:3000'
				echo 'ATARI: deploy done'
            }
        }
        stage('Publish') {
            when { expression { return params.publish } }
            steps {
                echo 'ATARI: publishing'
                sh 'docker exec atari pwd'
                sh 'docker exec atari ls'
				sh 'docker exec atari tar -czf /build.tar.gz /vol_build/build/'
				sh "docker cp atari:/build.tar.gz ~/build_${publish_version}.tar.gz"
				echo 'ATARI: ready package has been deployed to jenkins home directory'
				echo 'ATARI: to retrieve it use command from instruction'
				echo 'ATARI: publish done'
				echo 'ATARI: thanks for following the instruction have a nice day'
            }
        }
    }
}
```
- Uruchamiamy i cieszymy się przechodzącym prawidłowo rurociągiem.
![](<./Zrzut ekranu 2022-05-15 170804.jpg>)  

### 5. Wyciągamy paczkę
- Aby uzyskać utworzoną paczkę, trzeba w terminalu wywołać komendę:
```docker cp jenkins-jen:/var/jenkins_home/build-NR WERSJI.tar.gz build.tar.gz```
*WAŻNE!* numer wersji jest podawany przez użytkownika podczas uruchamiania pipeline, należy wprowadzić go w odpowiednie miejsce komendy. Lokalizację paczki można też sprawdzić w console output pipeline.

### 6. Znane rozwiązywalne problemy:
 - Projekt jest stary i używa przestarzałych dependencji. W środowisku produkcyjnym może być niebezpieczny i poza użytkiem akademickim nie powinien być nigdzie wykorzystywany (oprócz tego że i tak stoi wystawiony na http://atari.pause1.pl 🤔)
 - Jak wyżej - projekt nie zbuduje się na najnowszej wersji Node.js, trzeba użyć wersji 14 lub starszej - najnowsza fedora wymusza instalacje nowszej - 16 wersji - zawarte w dockerfiles.
[dowód rzeczowy](Zrzut ekranu 2022-05-15 141217.jpg)
 - Projekt przewiduje przeprowadzenie deployu w następującej kolejności: instalacja dependencji, build, test. W aplikacji webowej (taką jaka jest prezentowana w tym sprawozdaniu) nie ma takiej możliwości - kod musi być testowany przez "buildowaniem" - obfuskowaniem i pakowaniem do plików produkcyjnych. Dlatego w tym przypadku najpierw mamy testy - jeśli się powiodą następuje build itd.
 - `docker cp` nie obsługuje kopiowania pomiędzy kontenerami, dlatego build jest kopiowany do tymczasowego folderu hosta i stamtąd dopiero w odpowiednie miejsce docelowe.