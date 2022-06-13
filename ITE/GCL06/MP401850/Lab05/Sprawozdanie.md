
# Sprawozdanie 5

# Michael Paslawski, grupa nr 6


### Na samym poczatku potrzebujemy nowego repozytorium, ktore jest zaprezentowane pozniej i zawiera. 
 - Jenkinsfile definiujacy pipeline, 
 - Dockerfile, ktory bedzie użyty do jego wykonania 
 - Kod naszej aplikacji.

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-17%20at%2017.15.10.png)


### Nastepnie Logujemy sie do naszego Jenkinsa i sprawdzamy czy mamy odpowiednie pluginy, aby móc dodac Credentials do github. Jest to potrzebne do pobierania naszego repozytorium podczas wykonywania pipeline. 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-17%20at%2017.18.21.png)


### Kolejnym krokiem jest stworzenie nowego pipeline i nadanie mu wybranej przez siebie nazwy.
* wybieramy opcje pipeline, a nie freestyle project 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-17%20at%2017.20.44.png)


### Nastepnie pozostawiamy wszelkie check boxy odznaczone i nadajemy nazwe w sekcji pipeline "Pipeline script from SCM"

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-17%20at%2020.13.00.png)


### Kontynuujemy wybór odpowiednich opcji, w sekcji SCM wybieramy "Git" w miejscu na Repository URL, podajemy link do naszego nowo stworzonego repo.
### Dodajemy "Add" nowy credential, a w miejscu Branches to build ustawiamy brancha, z ktego chcemy zeby zaciagalo wszystkie pliki, w moim przypadku jest to main. 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-17%20at%2020.13.16.png)

### Na sam koniec wybieramy miejsce naszego scriptu, czyli "Jenkinsfile" 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-17%20at%2020.13.31.png)

### Po wybraniu odpowiednich ustawień, przejdziemy do omówienia poszczególnych plików, bedzie to potrzebne do zrozumienia procesu przygotwania pipeline.

* Plik Dockerdep
Aplikacja uzyta do tego laboratoium jest napisana w Javie i wykorzystuje Spring oraz Maven. Zatem plik Dockerdep sluzy do pobierania dependencji.
* Na poczatek jest podanie bazy kontenera 
* następnie kopiuję pliki aplikacji do kontenera 
* ostatnim krokiem jest przejście do katalogu z plikami źródłowymi, ustawienie odpowiednich uprawnien oraz uruchomienie polecenia pobierającego dependencje aplikacji

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-18%20at%2012.41.30.png)

* Plik Dockerbuild 
  Bazuje na poprzednio zbudowanym obrazie i buduje aplikację z kodów źródłowych oraz dependencji pobranych wcześniej. 
  Ostatnim polecenie jest odpowiedzialne za ustawienie ENTRYPOINT tak, aby po uruchomieniu kontenera zbudowany plik .jar został skopiowany na wolumen.
  Gdzie, w przypadku sukcesu naszego pipeline zostanie on zapisany jako artefakt.

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-18%20at%2012.41.54.png)

* Docker test, w duzym uproszczeniu, uruchamia testy naszej aplikacji.

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-18%20at%2012.42.17.png)

* Docker publish jest budowany bazując na czystym openjdk-alpine. Dzieki temu jestesmy w stanie przetestować, czy aplikacja jest w stanie uruchomić się tylko i wyłącznie na podstawie zbudowanego pliku .jar. 
Dodatkowo na samym poczatku dodawany jest bash, potem jest kopiowany zapisany wcześniej plik *.jar do naszego obrazu.
Jako ostatni krok jest ustawienie tak, aby przy starcie kontenera uruchamiana była nasza aplikacja.

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-18%20at%2012.42.32.png)


* Ostatnim krokiem jest przygotowanie pliku Jenkinsfile 
Na poczatku występuje budowanie z dodatkiem pobierania dependencji aplikacji.
Kolejna czesc to budowanie wraz z budowanie w srodku aplikacji 
Nastepnie zbudowaniu tworzony jest katalog, który podpina jako wolumen do uruchamianego konteneru, gdzie potem plik .jar jest kopiowany do tego katalogu.
Potem wystepuje faza test, czyli budowanie obrazu z uruchomieniem testow. 
Na samym koncu wystepuje faza Deploy, oznaczajaca tworzenie obrazu na bazie docker publish, potem juz tylko jest uruchamiany kontener, ktory jest po czasie "ubijany".
Gdy wszystko zostanie przetworzone pomyslnie to artefakt jest zapisywany. 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-18%20at%2012.43.02.png)
 * Kontynuacja zawartosci pliku 
![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-18%20at%2012.43.18.png)

### Poprawny Build 

![e.png](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MP401850/ITE/GCL06/MP401850/Lab05/Screenshot%202022-05-17%20at%2022.36.12.png)






















