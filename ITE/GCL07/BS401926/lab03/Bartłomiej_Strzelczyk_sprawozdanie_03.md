# Devops - Laboratorium nr 3

## Wykonanie laboratorium:

**1. Repozytorium** 

a) link do repozytorium: https://github.com/nexe/nexe.git

b) pobranie obrazu

![pull](./docker-pull.png)

c) uruchomienie kontenera i podłączenie TTY

![tty](./tty.png)

d) sklonowanie repozytorium

![clone](./clone.png)

e) uruchomienie buildu

![npm-install](./npm-install.png)

f) uruchomienie testów

![npm-test](./npm-test.png)

**2. Dockerfile** 

a) dockerfile przeprowadzający wszystkie kroki do builda

![build-file](./build-file.png)

![build-terminal](./build-terminal.png)

![build-terminal2](./build-terminal2.png)

b) dockerfile bazujący na pierwszym i wykonujący testy

![test-file](./test.png)

![test-terminal](./test-terminal.png)

c) docker images

![sudo-docker-images](./sudo-docker-images.png)

**3. Wykazanie poprawności**

a) stworzenie kontenera na bazie stworzonych obrazów

![poprawnosc](./poprawnosc.png)

**4. Pytania**

a) obraz dockera to szablon/wzorzec używany do zbudowania kontenera. Obrazy są przechowywane lokalnie lub w zdalnym repozytorium. Jeden obraz może być użyty do utworzenia wielu kontenerów. Kontener zaś jest to utworzone odseparowane środowisko dla danej aplikacji, zbudowane na podstawie obrazu. Można go porównać to instancji obrazu.

b) w kontenerze pracuje odizolowany od systemu obraz




