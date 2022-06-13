## **PIPELINE - Weronika Rusinek - ITE  403038 gr lab 7**


#   Kontenery

Zadanie rozpoczynam od zauważenia, że na poprzednich zajęciach zapomniałam o kontenerze DIND. Sprawiło mi to początkowo problemy na poziomie odnalezenia błędu przez który Pipeline nie wykonuje się poprawnie. Po zidentyfikowaniu błędu i postawieniu kontenera błąd znikł. 

![.](blad.png)

Tworzony przeze mnie Pipeline - multibranch, ponieważ jest tutaj możliwość rozróżnienia różnych gałęzi o konkretnym działaniu w projekcie. 

Jego efektem końcowym jest deploy i publish do nmp. Potrzebowałam 13 prób aby dojść do stanu, w którym cały pipeline wykonuje się bez błędów. Najwięcej problemu stworzył stage 'Publish', ponieważ kwestia klucza do npm i publisha była bardziej skomplikowana niż wydawała się na początku. 

![.](pipeline.png)

# Intro

1. Fork oryginalnego projektu na własne repo

 

3. Konfiguracja projektu
Ustawienia wstępne:
![.](conf.png)

4. Należało również stworzyć Webhooka, który nasłuchiwał na POST zmiany na repozytorium, wykonane pushe. Zapewnia to uruchomienie pipeline z każdym pushem na repo. W celu udostępnienia adresu Jenkinsa na zewnątrz użyto ngroka:

![.](ngrok.png)
![.](webhook.png)

4. Zródłem jest Jenkinsfile, który zostaje pobrany automatycznie w trakcie uruchamiania pipeline. 

![.](CI.png)



# Stages

Agent domyślny nie jest skonfigurowany, na każdym stage następuje dobór odpowiedniego.

**1. Checkout on volumine**

W tym kroku rozpoczynamy od pobrania kodu z SCM'a, co zostało wcześniej zdefiniowane i pobiera z GitHub. 
Dzięki `checkout scm` dokonywany jesy checkout - pozwala to uniknac git clone na moim projekcie multi-branch.
Jest to także plusem jeśli chodzi o korzystanie z woluminów. 
W skrócie ten stage tworzy nam dwa voluminy: wejściowy i wyjściowy poleceniem `docker volume create`. Następnie uruchamiam tymczasowy kontener, który jest tworzony jako detached i pracuje w tle. Podpinam do niego wolumin wejściowy.  

Przechodzimy do kroku checkoutu z scm, listuje elementy i wyświetlam package.json. Dokonuje tego w celu ewentulanego szybkeigo odnalezienia błędu. Kolejno kopiuje aktualny katalog roboczy do katalogu oznaczonego numerem builda w woluminie wejściowych. Dochodzimy do zastopowania kontenera dummy, którego celem było skopiowanie repo na wolumin wejściowy. 

```
 stage('Checkout on volumine') {
            agent any
            steps {
                script{
                    try{
                        sh 'docker volume create vol-in'
                        sh 'docker volume create vol-out'
                        sh 'rm * -r'
                        sh 'docker volume ls'

                        sh 'docker run -d --rm --name dummy -v vol-in:/vi alpine tail -f /dev/null'
                        dir('scm_cp') {
                            checkout scm
                            sh 'ls -al'
                            sh 'rm .git .github -r'
                            sh 'cat package.json'
                            sh 'docker cp . dummy:/vi/$BUILD_NUMBER'
                            sh 'docker stop dummy'
                        }
                    }
                    catch (Exception e) {
                        sh 'docker stop dummy'
                        echo 'Stopping dummy container...'
                        throw new Exception(e.toString())
                    }
                }
            }
```



**2. Build**

W katalogu BLD kopiuję zawartość katalogu roboczego do aktualnego katalogu, przechodzimy do instalacji pakietów npm i rozpoczynamy build. Wyświetlam zbudowane elementy i pozostałe pliki wyprowadzam do katalogu pckg w katalogu roboczym jenkinsa. 

```
 stage('Build') {
            agent {
                docker {
                    image 'node'
                    args '-v vol-in:/vi -v vol-out:/vo -v $WORKSPACE:/output'

                }
            }
            steps {
                sh 'ls /vi/$BUILD_NUMBER -al'
                dir('BLD') {
                    sh 'cp /vi/$BUILD_NUMBER/ . -r'
                    sh 'npm install --save --legacy-peer-deps'
                    sh 'npm run build'
                    sh 'ls -al'
                    sh 'cp . /output/pckg -r'
                }
            }
        }
```

**3. Test**

Tak jak w poprzednim kroku używam agenta dockerowego na obrazie z nodem. Na plikach w katalogu BLD uruchamiam manualnie testy zamiast `npm test` aby w przypadku błędu mieć ułatwione zadanie odnalezienia go. Tecty które są uruchamiane:
* jednostkowe
* lintowe - sprawdzenie składni.

```
 stage('Test') {
            agent {
                docker {
                    image 'node'
                    args '-v vol-in:/vi -v vol-out:/vo'

                }
            }
            steps {

                dir('BLD') {
                    sh 'npm run test:lint:md'
                    sh 'npm run test:lint:stylelint'
                    sh 'npm run test:lint:lockfile'
                    sh 'npm run test:html'
                    sh 'npm run test:unit'
                }

            }
        }
```

**4. Deploy**

Tutaj również działamy na node. Cały problem rozwiązuje w bloku try-catch. Uruchamiam `npm start` i w bloku łapię wyzwolony błąd gdzie podejmuje decyzję co dalej. Jeśli jest ti wzorcowy błąd wyzwolony poprzez interrupt to idę dalej, a jeśli inny to pipeline kończy się z błędem. 

```
stage('Deploy') {
            agent {
                docker {
                    image 'node'
                    args '-v vol-in:/vi -v vol-out:/vo'

                }
            }
            steps {

                dir('BLD') {
                    script {
                        try {
                            timeout(time: 1, unit: 'MINUTES') {
                                sh 'npm start'
                            }
                        } catch (Exception e) {
                            echo e.toString()
                            if(e.toString()=="org.jenkinsci.plugins.workflow.steps.FlowInterruptedException")
                            {
                                echo 'Deployed successfully!'
                            }else{
                                throw new Exception(e.toString())
                            }
                        }
                    }

                }

            }
        }
```

**5. Publish**

Z tym stage miałam najwięcej problemów, które dotyczyły walidacji npm oraz dobrania odpowiedniego tokena. Googlowanie problemów z logów i kilkugodzinne próby zakończyły się sukcesem. Przechodząc do kolejnych kroków:
Rozpoczynam od sprawdzenia wersji w celu dopisania numeru builda do deployowanej wersji do npma i git taga. Przez zmienną NPMJS_TOKEN, w któej znajduje się token npmowy dokonuję autoryzacji w kontenerze. Kolejno przechodzę do standardowej konfiguracji maila i gita. Sprawdzam też tutaj nazwę brancha i jeśli jest zgodna to wykonuje publish na npm registry. 

```
stage('Publish') {
            agent {
                docker {
                    image 'node'
                    args '-v vol-in:/vi -v vol-out:/vo'
                }
            }
            when { branch "CI" }
            steps {
                dir('pckg/$BUILD_NUMBER') {
                        script{
                            env.VERSION = sh( script: "npm view . version",returnStdout: true).trim()
                            echo "VERSION: ${env.VERSION}"
                        }
                        sh 'ls . -al'                    
                        withEnv(["TOKEN=${NPMJS_TOKEN}"]) {
                            sh 'echo "//registry.npmjs.org/:_authToken=${TOKEN}" >> ~/.npmrc'
                        }
                        sh 'git config --global user.email "werruse@gmail.com"'
                        sh 'git config --global user.name "weronika_rusinek"'
                        withEnv(["TOKEN=${GH_TOKEN}"]) {
                            sh 'git config remote.origin.url "https://${TOKEN}@github.com/werruse/nodejs.org.git"'
                        }
                        withEnv(["VER=${VERSION}"]){
                            sh 'npm version ${VER}-build$BUILD_NUMBER'
                            sh 'git tag -a "${VER}-build$BUILD_NUMBER" -m "${VER}-build$BUILD_NUMBER"'
                        }
                        sh 'npm publish'
                        sh 'git push --tags'
                }
                sh 'ls'
            }
        }
```
![.](variable.png)
	
Dzięki tym zmiennym mój pipeline zyskuje możliwość uruchomienia na dowolnym sprzęcie. 

Publikacja pakietu npm: 

![.](npm.png)


**6. Post** 

Jeśli wystąpi błąd następuje informacja o niepowodzeniu przejścia poprzez maila. Używam do tego pluginu Email Extension w ustawieniach Jenkinsa i wywołuje funkcje `emailtext` z wymaganymi parametrami: nazwa zadania, nr builda oraz url do aktualnego builda. Wysyłam przy użyciu SMTP Gmail. 

```
post{
        failure{
                emailext subject: "Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' failed",
                body: "FAIL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':\n Check console output at ${env.BUILD_URL}",
                to: 'werruse@gmail.com'
        }
    }
```
Jeśli chodzi o informację z sukcesem również została zaplanowana przez ustawienia Jenkinsa.
![.](success.png)

# Diagramy

1. Diagram aktywności:
![.](activity.png)

2. Diagram wdrożenia
![.](dep.png)

# Podsumowanie 

Zadania wykonywane na poprzednich laboratoriach są zastępowane Jenkinsfilem, który jest lepszym rozwiązaniem jeśli chodzi o tematykę tego projektu głównie ze względu na woluminy.