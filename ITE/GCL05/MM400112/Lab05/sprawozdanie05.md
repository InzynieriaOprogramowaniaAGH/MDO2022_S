# Lab05
## Mikołaj Migacz
### Pipeline
1. Stworzyłem repozytorium na którym znajduje się Jenkinsfile z pipelinem, Dockerfile potrzebny do wykonania i kod aplikacji.
 ![img](./sc_dev_ops_5/1.PNG)
2. Dodałem w Jenkinsie Credentials do Github'a, aby w trakcie wykonywania pipeline'a był w stanie pobierać nasze repozytorium. Aby dokonać konfiguracji skorzystałem z poradników z wyszukiwarki Google.
3. Stworzyłem nowy pipeline.
 ![img](./sc_dev_ops_5/2.PNG)
4. Skonfigurowałem pipeline zostawiając wszystkie opcje puste. W zakładce 'Definition': 
   1. Pipeline script from SCM
   2. SCM ustawiłem na : git
   3. Repository URL : https://github.com/mikolajmigacz/petclinic_dev_ops.git
   4. Dodałem Credentials - klucz SSH
 ![img](./sc_dev_ops_5/3.PNG)
5. W reopozytorium umieściłem folder który zawiera pliki źródłowe naszej aplikacji, Dockerfile i Jenkinsfile.
6. Przygotowuje pipeline:
   1. Dockerdep
    ![img](./sc_dev_ops_5/5.png)
   Posłuży do pobrania dependencji aplikacji.
   2. Dockerbuild
    ![img](./sc_dev_ops_5/6.png)
   Bazuje na poprzednio zbudowanym obrazie, buduje aplikacje z kodów źródłowych i dependecji. Jeśli wszystko przejdzie poprawnie, zostanie zapisany artefakt.
   3. Dockertest
    ![img](./sc_dev_ops_5/8.png)
   Uruchamia testy
   4. Dockerpublish
    ![img](./sc_dev_ops_5/9.png)
   Budowany na czystym openjdk-alpine aby sprawdzic czy aplikacja uruchomi sie na pliku .jar.
      1. Dodajemy bash
      2. Kopiujemy plik .jar do obrazu
      3. Ustawiamy entrypoint
7. Tworzenie pipeline:
![img](./sc_dev_ops_5/10.png)
   Opis stage'ów:
   1. Buduje obraz z dependencjami
   2. Buduje obraz budujący wewnętrzną aplikacje. Po tym tworzy katalog 'shared_volume'. Podczas uruchomienia kontenera zbudowany plik .jar kopiowany jest do tego katalogu.
   3. Buduje obraz w którym uruchamiane są testy.
   4. Deploy - tworzony jest obraz bazujący na Dockerpublish.
   5. Zapisanie artefaktu w przypadku sukcesu.
![img](./sc_dev_ops_5/4.png)
   

