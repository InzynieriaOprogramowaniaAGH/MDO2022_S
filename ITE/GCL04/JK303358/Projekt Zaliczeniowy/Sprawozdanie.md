# Sprawozdanie

### Imię i nazwisko: Jędrzej Kożuch

## Cel zadania:
Przygotowanie pipeline'a z użyciem Jenkinsa. Pipeline realizuje cztery procesy:
- Build (budowanie) - instalacja odpowiedniego oprorgamowania oraz bibliotek umożliwiających poprawną kompilację i działanie docelowego programu.
                      Efektem tego etapu jest plik wykonywalny.
- Test (testowanie) - uruchomienie testów napisanych przez twórcę oprogramowania.
- Deploy (wdrażanie) - sprawdzenie poprawności działania programu w środowisku innym niż w etapie budowania (w tym przypadku w innym kontenerze).
- Publish (publikowanie) - w skutek pomyślnego przejścia wszystkich poprzednich etapów następuje wydanie programu. Oznacza to utworzenie publikowalnego artefaktu 
                      (w tym przypadku pliku JAR) z odpowiednim numerem wersji (niekoniecznie nowym).

Wykorzystany program:

https://github.com/sirjk/bastimShop

Pipeline skupia się na wdrażaniu części back-endowej.

Oprogramowanie posiada licencję GNU GPL, która jest licencją typu Open Source.

---

- Wykaż uruchomiony build i testy poza kontenerem

Wykonano komendy budujące oraz uruchomiono testy:

`mvn clean package`

![](Pictures/1.png?raw=true)

![](Pictures/2.png?raw=true)

`mvn test`

![](Pictures/3.png?raw=true)

![](Pictures/4.png?raw=true)

Uruchomiono program `java -jar shopBastim-0.0.1-SNAPSHOT.jar`

![](Pictures/5.png?raw=true)

Połączono się z serwerem (z konkretnym endpointem) poleceniem `curl -i localhost:8080/api/v1/categories`, curl domyślnie wysyła zapytanie GET (flaga -i odpowiada za wyświetlenie nagłówka odpowiedzi, w którym znajduje się między innymi status odpowiedzi - 200 oznacza powodzenie).

![](Pictures/6.png?raw=true)

- Urucomienie aplikacji w kontenerze

Uruchomiono kontener ubuntu w trybie interaktywnym `sudo docker run -it ubuntu`
Do buildu potrzebne są:

maven:

`apt update`
`apt install maven`

![](Pictures/7.png?raw=true)

java:

`apt install openjdk-17-jdk`

![](Pictures/8.png?raw=true)

git (sklonowanie repozytorium):

`apt install git`
`git clone https://github.com/sirjk/bastimShop.git`

![](Pictures/9.png?raw=true)

![](Pictures/10.png?raw=true)

mysql-server oraz jego skonfigurowanie:
`apt install mysql-server`
`service mysql start`
`ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';`
`FLUSH PRIVILEGES;`

`mysql -u root -p`
`create database bastimdb;`

![](Pictures/11.png?raw=true)

![](Pictures/12.png?raw=true)

![](Pictures/13.png?raw=true)

powtórzenie kroków budowania i testowania:

`mvn clean package`

`mvn test`

![](Pictures/14.png?raw=true)

![](Pictures/15.png?raw=true)

![](Pictures/16.png?raw=true)


uruchomienie programu w tle:

`java -jar shopBastim-0.0.1-SNAPSHOT.jar &`

![](Pictures/17.png?raw=true)

sprawdzenie poprawności działania:

`curl -i localhost:8080/api/v1/categories`

![](Pictures/18.png?raw=true)


Uruchomiono kontener Jenkinsa oraz DIND zgodnie z poniższą instrukcją:

https://www.jenkins.io/doc/book/installing/docker/

![](Pictures/19.png?raw=true)

![](Pictures/20.png?raw=true)

Aby upewnić się, że kontenery działają można je wylistować poleceniem `docker ps`

![](Pictures/21.png?raw=true)

Aby zapewnić dostęp do Jenkinsa z zewnątrz maszyny wirtualnej hostującej Dockera dodano przekierowanie portu, na którym działa Jenkins:

![](Pictures/22.png?raw=true)


## Wstęp
Przed przystąpieniem do tworzenia Pipeline'a należy uruchomić kontener Jenkinsa i DIND (docker in docker). W tym celu warto zapoznać się z poniższą instrukcją:

https://www.jenkins.io/doc/book/installing/docker/

Aby upewnić się, że kontenery działają można je wylistować poleceniem `docker ps` 

![docker ps](Pictures/3.png?raw=true)

Serwer Jenkinsa uruchomiony jest na porcie 8080, zatem po wpisaniu w przeglądarce `localhost:8080` powinien pojawić się panel użytkownika. Należy utworzyć nowy projekt Pipeline:

![jenkins new project](Pictures/4.png?raw=true)

*Uwaga:*
*Aby ułatwić sobie pracę port wirtualnej maszyny 8080 został przekierowany na port hosta 8282*
![port forwarding](Pictures/5.png?raw=true)

Konfiguracja projektu - musimy zapewnić ścieżki do projektu oraz repozytorium, wskazać brancha oraz nazwę pliku wdrożeniowego Jenkinsfile. Panel jest bardzo przejrzysty. Każde pole uzupełnione jest podpowiedzią.

![general](Pictures/6.png?raw=true)

![pipeline 1](Pictures/7.png?raw=true)

![pipeline 2](Pictures/8.png?raw=true)

Po konfiguracji projektu można przejść do tworzenia Pipeline'a.

---

## Clone 
Etap clone odpowiada za usunięcie wszystkich istniejących woluminów, utworzenie nowego woluminu wejściowego i wyjściowego oraz podpięcie ich do kontenera, stworzenie obrazu na podstawie obrazu ubuntu i zainstalowanie Gita by finalnie sklonować repozytorium projektu.

Jenkinsfile:



Dockerfile (docker-clone):



---

## Build
W tym etapie najpierw tworzony jest obraz z zainstalowanym Maven oraz Javą. Następnie wykonane zostaje polecenie `mvn package` na projekcie znajdującym na woluminie wejściowym - skutkuje to kompilacją programu i spakowaniem go do pliku JAR. 

Jenkinsfile:



Dockerfile (docker-clone):



---

## Test
Etap uruchamia testy w kontenerze stworzonym na podstawie obrazu tego z etapu Build. Testy uruchamiane są poleceniem `mvn test` z podaniem ścieżki do projektu (wolumin wejściowy).

Jenkinsfile:



Dockerfile (docker-clone):



---

## Deploy
Po przejściu testów działanie programu sprawdzane jest jeszcze w innym środowisku. W tym przypadku jest to kontener stworzony na podstawie obrazu Javy. Do kontenera podpięty zostaje wolumin wyjściowy, na którym znajduje się plik wynikowy z etapu Build czyli SimpleApp.jar. Polecenie `java -jar` uruchamia program. Dodatkowo utworzony zostaje katalog `artifact`, do którego z woluminu zostaje przeniesiony plik JAR.

Jenkinsfile:



Dockerfile (docker-clone):



---

## Publish
Dotarcie do tego kroku informuje nas o tym, że aplikacja jest gotowa do opublikowania. Jako że nie każdy build musi kończyć się publikacją, wykonanie tego kroku zależy od parametru `promote` zadawanego przy uruchamianiu Pipeline'a. Jeśli parametr `promote` jest zaznaczony plik projektu (artefakt) zostaje zarchiwizowany - staje się dostępny do pobrania w naszym panelu Jenkinsa. 


Jenkinsfile:



Przed użyciem parametrów należy je wcześniej zdefiniować - zostało to zrobione przed sekcją `stages`:



Gdy poprawnie zostały zdefiniowane parametry, w panelu Jenkinsa pojawia się opcja `Uruchom z parametrami` umożliwiająca nadanie im wartości. Teraz wystarczy kliknąć `Buduj`:



W zakładce `Console output` możemy na żywo śledzić wszystkie wykonywane kroki:



Po poprawnym przejściu Pipeline'a (z zaznaczonym parametrem promote) na stronie pojawia nam się zarchiwizowany artefakt do pobrania:


