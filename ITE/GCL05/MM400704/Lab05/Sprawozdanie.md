# Sprawozdanie 4

# Michał Mendrek, grupa nr 5 400704

Na początku potrzebujemy nowego repozytorium które będzie zawierało:
 - Jenkinsfile definiujący pipeline
 - dockerfile wykorzystywany do jego wykonania 
 - kod naszej apliakcji
 
![1](https://user-images.githubusercontent.com/101416219/169879056-0d7c1a7b-86c5-4bc8-a12a-b429e1b6c989.PNG)

Następnym krokiem jest zalogowanie się do naszego Jenkinsa utworzonego na Lab4 i sprawdzanie czy posiadane są odpowiednie pluginy aby moc dodać Credentialsów. Bedzie to wykorzystywane d=po pobrania naszego repozytorium podczas wykonywania pipeline

![2](https://user-images.githubusercontent.com/101416219/169879999-4212676a-6c37-4143-82cb-7c1d9bf3bb31.PNG)

W następnej kolejnosci tworzymy nowego pipelina i nadajemy mu swoją nazwe
 -przy wyborze rodzaju tworzonego itemu wybieramy Pipeline
 ( screen wykonany po utworzebniu wcześniej pipelina, jest on jedynie potwierdzeniem) 
 
![3](https://user-images.githubusercontent.com/101416219/169880236-4bba746f-1040-41fd-be53-c21148e11817.PNG)

Po wejściu w konfiguracje w General kazy z dostępnych checkboxów zostawiamy pusty.

![4](https://user-images.githubusercontent.com/101416219/169880528-29dd1a66-9a47-4d8d-ac66-3b2f98c69748.PNG)
 
W kolejnym miejscu przy wyborze Definition wybieramy opcję " Pipeline script from SCM" w miejscu SCM wybieramy "Git" i poniżej w miejscu na repozytorium wkejamy wzięty z naszego repo link w którym znajdują sie pliki.

![5](https://user-images.githubusercontent.com/101416219/169880864-15e1a0eb-78c0-46b6-85fb-af263c43274a.PNG)

W nastepnej sekcji Branch Specifer zmieniamy na "*/main" i w polu Script Path wpisujemy jenkinsfile

![6](https://user-images.githubusercontent.com/101416219/169881191-8b3ea473-c3fb-4f70-9e2e-26aca5a52f9b.PNG)

Całość zapisujmy i w konfiguracjach naszego Jenkinsa jest wszystko ustawione tak żeby całość działała poprawnie

Kolejnym krokiem będzie omówienie poszczególnych plików potrzebnych do przygotowania i zrozumienia procesu pipeline.

- Plik Dockerdep aplikacja użyta do tego laboratorium jest w języku Java i wykorzystuję Spring oraz Maven. Dockerdep służy do pobrania dependencji
- Na poczatku jest podana baza kontenera 
- nastepnie są kopiowane pliki aplikacji do kontenera
- ostanim krokiem jest przejście do katalogu z plikami źródłowymi, ustawienie odpowiednich uprawnień oraz uruchomienie polecenia pobierającego dependencję apliakcji.

![8](https://user-images.githubusercontent.com/101416219/169882074-a374b4bf-4eec-4b45-a67f-2bfe9bd7e837.PNG)

-Plik Dockerbuild bazuję na poprzednio zbudowanym obrazie i buduję apliakcję z kodów źródłowych oraz dependencji pobranych wcześniej. Ustwaienie ENTRYPOINT tak aby po uruchomieniu kontenera zbudowny plik .jar został skopiowany na woluminie. 

![15](https://user-images.githubusercontent.com/101416219/169882595-1ff12352-3184-4dc5-8ee7-caa3f14fdfa9.PNG)

-Dockertest odpowiada za uruchamianie testów dla naszej apliakcji

![10](https://user-images.githubusercontent.com/101416219/169882771-19934786-a67d-4ece-a8da-25a86aa7755b.PNG)

-Dockerpublish jest budowany bazując na czystym openjdk-alpine, Dzięki temu plikowi jesteśmy w stanie przetestować czy apliakcja jest w stanie uruchomić sie tylko i wyłącza na podstwaie zbudownego pliku .jar. Dodatkowym atutem tego pliku jest fakt zawierania przez niego basha odpowiedzialny za kopiowanie zapisanego wcześniej pliku .jar do naszego obrazu. 

![9](https://user-images.githubusercontent.com/101416219/169883294-3501b292-7e92-48b2-b707-4e126df6db40.PNG)

-Ostanim plikiem jest Jenkinsfile, na początku anszego pliku wystepuje budowanie z dodatkiem pobierania dependencji aplikacji. Następna część to budowanie wraz z budowaniem wewnątrz aplikacji. Po zbudowaniu tworzony jest katalog który podpina jako volumen do uruchomionego konteneru gdzie plik .jar jest kopiowany do tego katalogu. Potem występuje faza testu czyli budowanie obrazu z uruchomieniem testów. Koncowa faza to faza Deploy oznaczająca tworzenie obrazu na bazie docker publish potem już tylko jest uruchomiany kontener. Gdy proces przejdzie pomyślnie to artefakt jest zapisywany.
\
![12](https://user-images.githubusercontent.com/101416219/169884033-d581dec8-f7bc-4690-9cd3-c73b43c9d2a7.PNG)
![13](https://user-images.githubusercontent.com/101416219/169884048-3872c4b7-ce7f-4061-a3f6-b10a5d444e8c.PNG)
 
 Finalnym efektem jest poprawnie działający Pipeline
 
![14](https://user-images.githubusercontent.com/101416219/169884130-406082a0-ff3e-4fca-96f6-f436e779a8f1.PNG)





