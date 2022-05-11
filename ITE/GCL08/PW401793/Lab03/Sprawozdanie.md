# Lab 03 - Paweł Waresiak

### Repo

https://github.com/apollographql/apollo-server

### Uruchomienie kontenera z node i połączenie się na tty
![tty](./screenshots/tty.png)

### Instalowanie aplikacji
#### Konfiguracja środowiska
![apk_update](./screenshots/apk_update.png)
![apk_add_git](./screenshots/apk_add_git.png)
![git_clone](./screenshots/git_clone.png)
![cd_folder](./screenshots/cd_folder.png)

#### Instalacja dependencji
![npm_i](./screenshots/npm_i.png)

#### Uruchomienie testów
![finished_tests](./screenshots/finished_tests.png)

### Utworzenie z poprzednich kroków Dockerfile'ów

#### Dockerfile - build
![dockerfile_build](./screenshots/dockerfile_build.png)

#### Dockerfile - test
![dockerfile_test](./screenshots/dockerfile_test.png)

### Sprawdzenie czy obrazy się budują
#### Apollo build
![build_build](./screenshots/build_build.png)

#### Apollo test
![build_test_1](./screenshots/build_test_1.png)
![build_test_2](./screenshots/build_test_2.png)

Obrazy zbudowały się poprawnie i testy również wykonały się w 100%.  
Uruchomienie z nich kontenerów zakończy się powodzeniem i zakończą one swoją pracę zaraz po uruchomieniu.  
Niestety nie jest to aplikacja web'owa i nie mogę uruchomić jej poprzez 'npm start', dlatego wytłumaczę tylko różnicę między obrazem a kontenerem.  
Obraz - stanowi podstawę do stworzenia kontenera.  
Kontener - pozwala na uruchomienie programu w odizolowanym środowisku zawierającym wszystkie zależności wymagane do jego działania.  

