## Pipeline - Sprawozdanie
## Wiktor Młynarczyk

Projektem, do którego pisałem pipeline był nodejs.org. Jak sama nazwa mówi jest to projekt na bazie nodejs, a więc wszystkie komendy w tym środowisku były wykonywane przez **npm**. Projekt zakłada, że mamy już gotowego jenkinsa, włączonego w kontenerze. 

1. Pierwszą rzeczą jaką należy zrobić, jest **sforkowanie repozytorium,** do którego chcemy napisać pipeline. Link do repozytorium:
   ### https://github.com/nodejs/nodejs.org
2. Po zrobieniu forka repozytorium, powinniśmy miec już projekt w naszym repozytroium. Dzięki temu możemy w dowolny sposób edytować ten projekt.
3. Aby zintegrować jenkinsa z naszym nowym repozytorium, należ dodać do projektu **jenkinsfile**. W moim przypadku, stworzyłem folder jenkins, a w nim plik jenkinsfile:
# ![Alt text](1-jenkinsfile.PNG?raw=true)
4. W następnym kroku przechodzimy już do samego Jenkinsa. Po zalogowaniu powinniśmy utworzyć nowy projekt i wybrac opcję **pipeline**:
## ![Alt text](2-nowy-pipeline-jenkins.PNG?raw=true)
5. Nastpęnie przechodzimy do konfiguracji. W tym korku musimy zdefiniować, z jakiego repozytorium będziemy korzystać oraz z którego z dostępnych gałęzi. W moim przypadku było to:
## ![Alt text](3-konfiguracja.PNG?raw=true)
**Należy także pamiętać o zaznaczeniu odpowiedniego brancha - defaultowa wartość to master, jednak musimy wybrać gałąź main!**

**Uwaga**: to nie jest jedyna możliwa opcja integracji z repozytorium. Możemy pisać skrypt bezpośrednio w Jenkinsie, używając linku do repozytorium. Wystarczy, że zmienimy wartość "Definition" na **pipeline script.**
6. Po wstępnym skonfigurowaniu pipeline, możemy przystąpić do pisania skryptu. Nasz pipeline będzie składać się z czterech głównych stage'ów: 
* build
* test
* deploy
* publish

Pipeline będzie zawierał również sekcję **post**, w której zdefiniujemy czynności po określonych zakończeniach pipeline. Przykładowo, w przypadku sukcesu wyświetlimy odpowiedni komunikat.

Skorzystamy także ze zmiennej środowiskowej, którą w późniejszej fazie dodamy do konfiguracji. Zmienną tą bedzie **appVersion**, którą bedziemy wpisywać przed każdym wykonaniem pipeline.
7. Do poprawnego wykonania naszego pipeline, będą nam potrzebne **dockerfile**. Należy dodać dockerfile do **każdego** stage, ponieważ za każdą część będziemy wykonywać w izolowanym środowisku. Na moim repozytorium znajdują się wszystkie potrzebne dockerfile.
8. definicja agenta oraz parametrów
```
pipeline {
    agent any
	parameters {
		string(name: 'version', defaultValue: '', description: 'app version')
	}
	...
```
Każdy pipeline musimy zacząć od sekcji **pipeline**, w której definiujemy **całą** zawartość procesu.

Jenkins został stworzony w taki sposób aby łatwo rozszerzać jego możliwości. Dotyczy to także sprzętu na którym działa. Zastosowano tutaj architekturę master-slave, to znaczy, że jeden centralny serwer zarządza działaniem podległych mu maszyn.

Instancję slave nazywamy Agentem. Uruchamiana jest na dowolnym urządzeniu – serwer, maszyna wirtualna lub nawet minikomputer taki jak RaspberryPi. Na maszynie może być dowolny system operacyjny: Linux, Windows lub środowisko do uruchamiania kontenerów Dockera. Agent odpowiada za wykonywanie zadań. To tutaj przeprowadzana jest kompilacja, uruchamiane są testy, pakowanie aplikacji itp

Sekcja „agent” konfiguruje, na których węzłach można uruchomić proces. Określenie „agent any” oznacza, że Jenkins uruchomi zadanie na dowolnym z dostępnych węzłów.

Następnie mamy sekcję parameters i definiujemy tam nasze parametry, do których możemy się odwołac w dowolnym miejscu. W naszym przypadku, nasza zmienna określa werjsę aplikacji, będziemy ją wykorzystywać w stage publish i po prostu wydrukujemy wartość opublikowanej paczki. Parametr ten nie ma realnego wpływu na cały proces - użyłem go tylko po to, żeby pokazać możliwośći Jenkinsa.

Aby można było sterować tym parametrem, należy przejść do konfiguracji projektu i dodać:

## ![Alt text](4-app-version.PNG?raw=true)

9. Stage build

```
  stage("build") {
            steps {
                echo "building.." 
		sh 'docker build . -f build.dockerfile -t builder'
            }
        }
```

W tym stage wykonujemy proces budowania projektu. Tak jak widać, posłużyłem się dockerem, aby zrobić to w odizolowanym środowisku.
Dockerfile dla buildu:
```
FROM node:latest

RUN git clone https://github.com/jokereey/nodejs.org.git
WORKDIR nodejs.org
RUN npm install
RUN npm run build
```

Tak jak widać, nasz kontener bazowy to node:latest. klonujemy repozytorium i wykonujemy w nim 
* npm install
* npm run build

dzięki tej akcji, nasz obraz będzie posiadał gotowy folder **build**, który jest kluczowy dla całego procesu.
10. Stage test
```
stage('test') {
            steps {
	     sh 'docker build . -f test.dockerfile -t tester'
	     sh' docker run tester'
            }
        }
        ...
```
Dockerfile testera:
```
FROM builder:latest

WORKDIR /nodejs.org/

RUN npm run test

```
Tak jak widać, korzystamu tutaj z kontenera build, z jego najnowszej wersji. przechodzimy do odpowiedniego folderu i wykonujemy komendę:
* npm run test

W zasadzie to nawet nie musimy włączać tego kontenera, ponieważ nie ma on przydzielonych żadnych zadań, więc od razu się wyłączy.

10. Stage deploy
```
stage('deploy') {
            steps {
                 echo 'deploying..'
                 sh  'docker build . -f deploy.dockerfile -t deploy'
		 sh 'docker stop $(docker ps -a -q)'
		 sh 'docker run  -d -p 3000:80 deploy '               
            }
        }
```
Jeżeli testy przeszły, możemy przystąpić do kolejnego kroku, jakim jest **deploy**.

Muszę przyznać, że krok ten przysporzył wiele kłopotów. To właśnie w tym kroku podjąłem decyzję,że **nie będę używał woluminów.** 

Bardzo trudno było mi sprawić, aby kontener depoloy mógł dostać się do woluminów kontenera builder. Początkowo tak było - **kontener build miał podpięty wolumin, w którym pozostawiał po sobie folder build**. 

Wygląda na to, że moje umiejętności dockerowe były zbyt małe na rozwiązanie tego problemu, więc zrobiłem to w inny sposób.

dockerfile deploya:
```
FROM nginx:stable-alpine

COPY --from=builder nodejs.org/build/en /usr/share/nginx/html
COPY --from=builder nodejs.org/build/static /usr/share/nginx/html/static
RUN ls /usr/share/nginx/html

```
Sprawa jest prosta - kopiuje poszczególne zawartości folderu build i przerzucam jest do odpowiedniego folderu **nginx**.

Warte zaznaczenia jest również t, że odpalamy kontener w trybie detach i mapujemy port 80 kontenera nginx, na port 3000 w jenkinsie. Przed tym jednak należy wyłączyć kontenery, tak abyśmy mogli zorbić "redeploy" podczas kolejnego procesu.

11. Stage publish

Jeżeli poprzedni krok się powiedzie, możemy przystąpić już do ostatniego kroku całego procesu.

```
stage('publish') {
		environment{
			version = "${params.version}"
		}
            steps {
               echo "publishing.."
	       sh 'docker build . -f publish.dockerfile -t publish'
	       sh "docker run --volume /var/jenkins_home/workspace/volumes:/final publish mv nodejs.tar.xz /final"
	       echo "NODEJS.ORG VERSION ${params.version} HAS BEEN PUBLISHED" 	
            }
        }
```
W przypadku tego konteneru używam woluminu, tak żebym miał paczkę z buildu w kontenerze jenkinsa.

Ponownie korzystam z kontenera builder - jak widać okazał się on najważniejszy dla całego procesu w takim podejściu.

```
FROM builder:latest

RUN tar cfJ nodejs.tar.xz build
```

Jeśli teraz udamy się pod podaną lokalizację woluminy, możemy dostrzec naszą paczkę:

## ![Alt text](5-paczka.PNG?raw=true)

12. Sekcja Post

Jeżeli udało nam się dotrwać do tego momentu - oznacza to, że nasz pipeline wykonał swoją pracę.

Możemy jednak dodatkowo obsłużyć poszczególne przypadku zakończenia procesu. Jeżeli cały proces się uda, na koniec logów wyświetlona będzie wiadomość:

``Finished: SUCCESS``

**Jednak istnieją jeszcze inne scenariusze**:

``Finished: FAILURE``

``Finished: UNSTABLE``

``Finished: CHANGED``

Na koniec chciałbym pokazać, jak możemy obsługiwać poszczególne scenariusze. Do pipeline dodajemy:
```
post {
    failure {
            //mail to: 'w.mlynarczyk20@gmail.com',
            //subject: "Failed Pipeline",
            //body: "Something is wrong with.."
	    echo 'Something went wrong!'
	}
	always {
            echo 'The end'
            // deleteDir() /* clean up our workspace */
        }
        success {
            echo 'Pipeline has been executed successfully.'
        }
    }
```
Jak widać, nic szczególnego tu się nie dzieje -  po prostu wypisujemy zwykłe komunikaty. 

Jednakże możemy zintegrować Jenkinsa z systemem wysyłania maili. Przykładowo, w przypadku niepowodzenia całego procesu, możemy wysłać maila do użytkownika odpowiedzialnego za włączenie builda, lub nawet do całego zespołu. Jest to bardzo powszechne rozwiązanie w korporacjach.

w sekcji failuire zakomentowałem odpowiednie keywordy, które w połączeniu z odpowiednią wtyczką, wyślą maila na podany adres email.

13. Jenkins blueocean
Nasz Pipeline został w całości skonfigurowany. Możemy więc teraz go uruchomić.

Po przejściu do menu głównego wybieramy opcję `Uruchom z parametrami`:

## ![Alt text](6-build-with-parameters.PNG?raw=true)

A następnie wpisujemy werjsę, odpalamy nasz pipeline i czekamy na wynik:

## ![Alt text](7-building.PNG?raw=true)

Jeżeli nic się nie "wykrzaczyło", to powinniśmy zobaczyć poniższy obrazek:

## ![Alt text](8-done.PNG?raw=true)

## ![Alt text](9-sukcesPNG.PNG?raw=true)

Cały proces przebiegł bardzo szybko, jednak dzieje się to dlatego, że kontenery używają pamięci cache. Gdybyśmy usunęli wszystkie obrazy, trwałoby to około 4-5 minut.

Należy pamiętać, że aby przetestować, że step deploy na pewno zadziałał, musimy dodać dodatkowe mapowanie portów kontenera jenkinsa. 

Aktualnie kontener jenkins na porcie 3000 nasłuchuje zagnieżdzony kontener **Nginx**, mapując jego port 8080.

Tak więc do naszego kontenera jenkins dodajemy port podczas uruchamiania:

```
docker run --name jenkins-docker --rm --detach ^
  --privileged --network jenkins --network-alias docker ^
  --env DOCKER_TLS_CERTDIR=/certs ^
  --volume jenkins-docker-certs:/certs/client ^
  --volume jenkins-data:/var/jenkins_home ^
  --publish 2376:2376 ^
  -p 8083:3000 ^
  docker:dind
```
Oczywiście korzystamy z tego samego obrazu, którego używaliśmy na poprzednich zajęciach.


Jeżeli dodamy port, teraz na localhost 8083, powinniśmy otrzymać ekran startowy nodejs.org:
![Alt text](10-ekarn.PNG?raw=true)

Widzimy, że działa tutaj podwójne przekierowanie portów:

`Windows: 8083 -> jenkins: 3000 -> nginx: 8080`
14. Podsumowanie

Uważam, ze pisanie Pipeline, to nie jest łatwa sprawa, jednakże jest to bardzo powszechne i ułatwiające życie rozwiązanie. Mój projekt pokazuje podstawy zarówno Jenkinsa jak i dockera, jednak w rzeczywistości nie jest to takie łatwe. Najczęściej używa sie integracji z chmurą, przechowuje się odpowiednie sekrety w konfiguracji.

Ważną sprawą jest, że cały pipeline, który napisałem, jest stworzony w **sposób deklaratywny**. Możemy również tworzyć skrypty w Groovym, które mają znacznie większy potencjał - przypomina to bardziej programowanie, niż pisanie prostych instrukcji.
