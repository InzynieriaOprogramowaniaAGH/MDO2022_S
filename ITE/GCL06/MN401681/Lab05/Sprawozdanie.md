### Michał Nycz
### Informatyka-Techniczna
### Gr-lab 06
----
# Sprawozdanie
## Metodyki DevOps lab_nr_05
----
Tworzymy repozytorium na którym znajdzie się Jenkinsfile definiujący pipeline, Dockerfile potrzebne do jego wykonania, oraz kod aplikacji, której działanie chcemy przetestować.
Na początek utworzyłem nowe repozytorium na swoim koncie GitHub, w którym zamieściłem wszystkie potrzebne pliki: Jenkinsfile definiujący Pipeline, Dockerfile oraz kod aplikacji, która będzie testowana.
![image](https://user-images.githubusercontent.com/75485199/169030629-9306d078-ef02-4c2d-8a2a-8ec8e2486c13.png)
![image](https://user-images.githubusercontent.com/75485199/169030716-0349e52a-22fd-41d6-866e-1df033bb78bd.png)
----
Dalej zgodnie z poradnikiem, który znalazłem w Internecie, dodałem Credentialse w Jenkinsie, aby umożliwić pobieranie repozytorium w trakcie pracy pipelina.
Wykonałem również konfiguracje pipeline jak widać na załączonych screenach.
![image](https://user-images.githubusercontent.com/75485199/169036293-f8ffcfad-8f46-4ea2-b547-21b953fdcc65.png)
![image](https://user-images.githubusercontent.com/75485199/169031085-78b0755f-e899-475d-bf61-9cc37e2c03e0.png)
![image](https://user-images.githubusercontent.com/75485199/169031110-44e559b1-f50f-4cab-b2e1-a7f0d1e733bd.png)
----
- W miejscu Definition ustawiamy: Pipeline script from SCM  

- SCM: Git

- Etap Repositories jest bardzo ważny, wrzucamy tam ścieżkę do naszego repozytorium. 

- Branch w moim przypadku: */main

- Repository browser: Auto (domyślnie chyba tak się ustawia, natomiast warto się upewnić)

- Script Path: Jenkinsfile (u mnie właśnie taka jest ścieżka pliku Jenkinsfile natomiast to zależy od tego jak kto ma repozytorium ułożone)
Jest to po prostu ścieżka do pliku z opsem pipeline.

![image](https://user-images.githubusercontent.com/75485199/169031202-d80fe02e-74ea-40f2-873a-98d00e5b35be.png)
![image](https://user-images.githubusercontent.com/75485199/169031210-8753f98b-98d7-49a2-99b7-669bd0c84dbf.png)

W repozytorium można znaleźć folder zawierający Jenkinsfile, Dockerfile oraz pliki potrzebne do działania aplikacji. 
![image](https://user-images.githubusercontent.com/75485199/169040274-00d17a39-0eab-4bce-a53a-fd3e2f191404.png)

----

Dockerbuild: bazuje na poprzednio zbudowanym obrazie i buduje aplikację z kodów źródłowych oraz dependencji pobranych wcześniej. Ostatnia linijka kodu odpowiada za   ustawienie ENTRYPOINT tak, aby po uruchomieniu kontenera (z podłączonym do niego wolumenem) zbudowany plik .jar został skopiowany na wolumen.
W przypadku sukcesu naszego pipeline zostanie on zapisany jako artfekat co będzie widać na ostatnim zrzucie ekanu w sprawozdaniu.

Deockerdep: służy do pobrania dependencji aplikacji. Build rozpoczynam od podania bazy kontenera - openjdk:16-jdk-alpine, następnie kopiuję pliki aplikacji do kontenera poleceniem COPY app app, końcowym krokiem jest przejście do katalogu z plikami źródłowymi oraz uruchomienie polecenia pobierającego dependencje aplikacji.
Należało dodać chmod (polecenie zmiany zezwoleń dostępu do plików w systemach uniksowych), ponieważ wyrzucało errory.

Dockerpublish: budowany jest bazując na czystym openjdk-alpine, tak by przetestować, czy aplikacja jest w stanie uruchomić się tylko i wyłącznie na podstawie zbudowanego pliku .jar. Na starcie dodawany jest bash, następnie kopiujemy zapisany wcześniej plik *.jar do naszego obrazu. Na końcu ustawiamy ENTRYPOINT tak, aby przy starcie kontenera uruchamiana była nasza aplikacja.

Dockertest: bazuje na obrazie zbudowanym poprzez Dockerbuild, i uruchamia testy zbudowanej aplikacji.

 Każdy ze stage wykorzystuje jeden z przygotowanych wcześniej Dockerfile'i.
Pierwszy z nich buduje obraz z pobieranymi dependencjami aplikacji.
Kolejny buduje obraz budujący wewnątrz aplikację. Po zbudowaniu tworzy katalog shared_volume, który podpina jako wolumen do uruchamianego konteneru. W momencie uruchomienia kontenera zbudowany wcześniej plik .jar jest kopiowany do katalogu shared_volume.
Następnym stagem jest test, który buduje po prostu obraz, w którym uruchamiane są testy aplikacji.
Ostatnim stagem jest Deploy, w czasie którego tworzymy obraz na podstawie Dockerpublish. Następnie uruchamiany jest kontener i po czasie 5 sekund jest on ubijany. 5 sekund to czas, w którym aplikacja powinna zostać poprawnie uruchomiona.
Ostatnim krokiem jest zapisanie artefaktu w przypadku sukcesu pipeline.

Jenkinsfile krok po kroku (odpowiednie Dockerfile są odpowiedzialne za działanie):
- buduje obraz z pobieranymi dependancjami apki.
- buduje obraz budujący wewnątrz aplikację. Następnie jest tworzony katalog shared_volume, który podpina jako wolumen do uruchamianego konteneru. W momencie uruchomienia kontenera zbudowany wcześniej plik .jar jest kopiowany do katalogu shared_volume.
- Testy
- DEploy
- Kontener po uruchomieniu jest ubijany po czasie pięciu sekund, jest to wystarczający czas aby aplikacja mogła się poprawnie uruchomić.
- Zapisanie artfaktu (plik .jar)

![image](https://user-images.githubusercontent.com/75485199/169035478-7f3a30f9-d346-4ace-9e94-70f23d8f1421.png)

![image](https://user-images.githubusercontent.com/75485199/169035493-9313d2f5-38ca-4fea-9ac0-d9a4efb0aa3a.png)

![image](https://user-images.githubusercontent.com/75485199/169035528-64a03314-1046-4925-9ec7-2a5f225723c6.png)

![image](https://user-images.githubusercontent.com/75485199/169035560-06b0e6d9-9494-433d-b234-75b21099dfbf.png)

![image](https://user-images.githubusercontent.com/75485199/169035633-95757ed8-20d9-456b-96da-65bc45af4197.png)
![image](https://user-images.githubusercontent.com/75485199/169035685-574fa139-6c49-48a0-b156-605d7327cf42.png)
----
Na koniec pipeline, który finalnie po paru nieudanych próbach i poprawkach (sprawdzaono w logach jakie błędy zostały wyrzucone), uruchomił i zakończył się prawidłowo. Na zrzucie ekranu widać również otrzymany artefakt. 
![image](https://user-images.githubusercontent.com/75485199/169036073-d166dbf8-375e-44df-ae1f-d9453709b353.png)







