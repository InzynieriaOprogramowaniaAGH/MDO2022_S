pipeline {
    agent any
    // Checkbox, który pyta dewelopera, czy pakiet ma zostać opublikowany w Docker Hubie.
    parameters {
       booleanParam(name: 'SHOULD_PUBLISH', defaultValue: false, description: 'Should publish?')
   }
    stages {
        stage('Build') {
            steps {
                // Budowa klasycznego kontenera (zawiera kod źródłowy)
                // Bazowy obraz to golang:1.12-alpine, zalecany obraz dla projektów w Go
                // Logi z budowy są dostępne w zakładce "Console Output" w Jenkinsie
                sh 'docker build -t adrlanek/cowyo:c$GIT_COMMIT .'
            }
        }
        stage('Test') {
            steps {
                // Uruchomienie testów automatycznych
                // Logi z budowy są dostępne w zakładce "Console Output" w Jenkinsie
                sh 'docker run --rm adrlanek/cowyo:c$GIT_COMMIT go test ./...'
            }
        }
        stage('Deploy') {
            steps {
                // Projekt może być dystrybuowany w postaci pliku binarnego jak i obrazu Dockera.
                // Wybrałem dystrybucję za pomocą obrazu Dockera, ponieważ w faktycznych środowiskach uruchomieniowych o wiele łatwiej i przewidywalniej jest dokonywać wdrożeń za pomocą ustandaryzowanych obrazów kontenerów. Pozwala to na proste wdrożenia w systemy orchestracji kontenerów (np. Kubernetes). Plik binarny jest trudniejszy do zarządzania w dużym środowisku wdrożeniowyym.

                // Budowa kontenera wieloetapowego (finalny obraz zawiera jedynie binarkę)
                // Ostatnie polecenie 'curl' sprawdza czy aplikacja poprawnie się uruchomiła
                // Obraz jest tagowany numerem commitu git
                sh '''docker build -t adrlanek/cowyo-runtime:c$GIT_COMMIT -f Dockerfile.multistage .
                                docker rm -f cowyo-app || exit 0
                                docker run -d --name cowyo-app -p 8050:8050 adrlanek/cowyo-runtime:c$GIT_COMMIT
                                sleep 10
                                curl \'http://localhost:8050/\''''
            }
        }
        stage('Publish') {
            when {
                expression { params.SHOULD_PUBLISH }
            }
            steps {
                // Wypchnięcie obrazu do Docker Huba
                sh 'docker push adrlanek/cowyo-runtime:c$GIT_COMMIT'
            }
        }
    }
}