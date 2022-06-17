# Sprawozdanie

### Imię i nazwisko: Jędrzej Kożuch

### Temat: Przygotowanie Pipeline'a

## Cel zadania:
Przygotowanie pipeline'a z użyciem Jenkinsa. Pipeline realizuje cztery procesy:
- Build (budowanie) - instalacja odpowiedniego oprorgamowania oraz bibliotek umożliwiających poprawną kompilację i działanie docelowego programu.
                      Efektem tego etapu jest plik wykonywalny.
- Test (testowanie) - uruchomienie testów napisanych przez twórcę oprogramowania.
- Deploy (wdrażanie) - sprawdzenie poprawności działania programu w środowisku innym niż w etapie budowania (w tym przypadku w innym kontenerze).
- Publish (publikowanie) - w skutek pomyślnego przejścia wszystkich poprzednich etapów następuje wydanie programu. Oznacza to utworzenie publikowalnego artefaktu 
                      (w tym przypadku pliku JAR) z odpowiednim numerem wersji (niekoniecznie nowym).

Wykorzystany program:

https://github.com/sirjk/Hello-World-With-Tests-Maven

---

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

Konfiguracja projektu:

![general](Pictures/6.png?raw=true)

![pipeline 1](Pictures/7.png?raw=true)

![pipeline 2](Pictures/8.png?raw=true)

Po konfiguracji projektu można przejść do tworzenia Pipeline'a.

---

## Clone 
Etap clone odpowiada za usunięcie wszystkich istniejących woluminów, utworzenie nowego woluminu wejściowego i wyjściowego oraz podpięcie ich do kontenera, stworzenie obrazu na podstawie obrazu ubuntu i zainstalowanie Gita by finalnie sklonować repozytorium projektu.

Jenkinsfile:

![Jenkinsfile stage clone](Pictures/9.png?raw=true)

Dockerfile (docker-clone):

![docker-clone](Pictures/10.png?raw=true)

---

## Build
W tym etapie najpierw tworzony jest obraz z zainstalowanym Maven oraz Javą. Następnie wykonane zostaje polecenie `mvn package` na projekcie znajdującym na woluminie wejściowym - skutkuje to kompilacją programu i spakowaniem go do pliku JAR. 

Jenkinsfile:

![Jenkinsfile stage clone](Pictures/12.png?raw=true)

Dockerfile (docker-clone):

![docker-clone](Pictures/11.png?raw=true)

---

## Test
Etap uruchamia testy w kontenerze stworzonym na podstawie obrazu tego z etapu Build. Testy uruchamiane są poleceniem `mvn test` z podaniem ścieżki do projektu (wolumin wejściowy).

Jenkinsfile:

![Jenkinsfile stage clone](Pictures/13.png?raw=true)

Dockerfile (docker-clone):

![docker-clone](Pictures/14.png?raw=true)

---

## Deploy
Po przejściu testów działanie programu sprawdzane jest jeszcze w innym środowisku. W tym przypadku jest to kontener stworzony na podstawie obrazu Javy. Do kontenera podpięty zostaje wolumin wyjściowy, na którym znajduje się plik wynikowy z etapu Build czyli SimpleApp.jar. Polecenie `java -jar` uruchamia program. Dodatkowo utworzony zostaje katalog `artifact`, do którego z woluminu zostaje przeniesiony plik JAR.

Jenkinsfile:

![Jenkinsfile stage clone](Pictures/16.png?raw=true)

Dockerfile (docker-clone):

![docker-clone](Pictures/15.png?raw=true)

---

## Publish
Dotarcie do tego kroku informuje nas o tym, że aplikacja jest gotowa do opublikowania. Jako że nie każdy build musi kończyć się publikacją, wykonanie tego kroku zależy od parametru `promote` zadawanego przy uruchamianiu Pipeline'a. Jeśli parametr `promote` jest zaznaczony plik projektu (artefakt) zostaje zarchiwizowany - staje się dostępny do pobrania w naszym panelu Jenkinsa. 


Jenkinsfile:

![Jenkinsfile stage clone](Pictures/17.png?raw=true)
