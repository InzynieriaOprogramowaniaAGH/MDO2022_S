## Sprawozdanie 4

---

### 1. Zachowywanie stanu
- Na początku ustawiono Docker jako non-root user aby nie musieć używać polecenia `sudo` podczas pracy z Dockerem. W tym celu użyto polecenia `sudo usermod -aG docker $USER`

- Następnie przygotowano woluminy: wejściowy i wyjściowy o nazwach *volumeIn* oraz *volumeOut*. W tym celu użyto polecenia `docker volume create <nazwa>`

![utworzone woluminy](./tworzenie_woluminow.png)

- do kontenera podłączono utworzone woluminy i uruchomiono go poleceniem: `docker run -it -v volumeIn:/volumeIn -v volumeOut:/volumeOut ubuntu:latest`

![dodanie woluminów](./dodanie_woluminow.png)

- w osobnym terminalu do katalogu Lab4 sklonowano repozytorium poleceniem: `git clone https://github.com/kentcdodds/testing-node-apps.git` 

![sklonowanie repozytorium](./git_clone.png)

- Poleceniem `docker cp testing-node-apps <id_uruchomionego_kontenera>:/volumeIn` przekopiowano repozytorium na wolumin wejściowy.

-![repozytorium w woluminie wejsciowym](./repo_w_woluminie.png)

- w kontenerze przy pomocy poniższych poleceń zainstalowano niezbędne wymagania wstępne umozliwiajace uruchomienie projektu:

`apt update`

`apt -y install npm git curl dirmngr apt-transport-https lsb-release ca-certificates`

`curl -sL https://deb.nodesource.com/setup_12.x | bash -`

`apt -y install nodejs`


- na wolumin wyjściowy skopiowano repozyturium z woluminu wejściowego i zbudowano je poleceniem `npm install`

![zbudowanie projektu](./uruchomienie_w_volumeout.png)  

- aby zweryfikować czy wszystko przebiegło pomyslnie uruchomiono testy dostępne dla projektu poleceniem `npm run test::final`

![uruchomienie testów](./testy.png)

- jak można zauważyć wszystko przebiegło pomyślnie i wszystkie testy wykonały się poprawnie

- sprawdzono takze czy po ponownym uruchomieniu kontenera pliki zawarte są w woluminach:

![sprawdzenie](./sprawdzenie.png)

---

### 2. Eksportowanie portu
- Na początku poleceniem `docker run -it -p 5201:5201 ubuntu:latest` uruchomiono kontener, który zostanie serwerem

![uruchomienie kontenera](./nowy_kontener.png)

- w kontenerze zainstalowano iperf3 poleceniem `app update && app install iperf3`

![instalacja iperf3](./instalacja_iperf3.png)

- przy pomocy polecenia `iperf3 -s` uruchomiono serwer

![uruchomienie serwera](./uruchomienie_servera.png)

- poleceniem `docker inspect <id_kontenera>` sprawdzono jego adres ip

- utworzono nowy kontener poleceniem `docker run -it ubuntu:latest` w którym także zainstalowano iperf3

![drugi kontener](./drugi_kontener.png)

- poleceniem `iperf3 -c <adres_ip_kontenera>` polaczono się z serwerem z drugiego kontenera

![polaczenie z innego kontenera](./laczenie_z_drugiego_kontenera.png)

- na maszynie wirtualnej zainstalowano iperf3 i połączono się z serwerem poleceniem `iperf3 -c <id_kontenera>`

![polaczenie z hostem](./laczenie_z_hosta.png)

- aby możliwe było połączenie się z serwerem spoza hosta w ustawieniach wirtualnej maszyny dodano dwa przekierowania portów

![ustawienia VM](./ustawienia_VM.png)

- w konsoli Windows'a poleceniem `ipconfig` znaleziono adres IP localhosta

- poleceniem `.\iperf3.exe -c  <id_hosta>` polaczono się z serwerem

![polaczenie spoza hosta](./laczenie_spoza_hosta.png)

- na koniec wyciągnięto log z kontenera poleceniem `docker logs <id kontenera>`

![wyciąganie logów z kontenera](./docker_logs.png)

---

### 3. Instalacja Jenkins
- przy pomocy dokumentacji znajdującej się na stronie `https://www.jenkins.io/doc/book/installing/docker/#setup-wizard` wykonano kolejne kroki instalacji Jenkinsa na Dockerze

- na początku poleceniem `docker network create jenkins` utworzono sieć

![utworzenie sieci](./tworzenie_sieci.png)

- następnie pobrano i uruchomiono *docker:dind*

![docker:dind](./docker_dind.png)

- na podstawie instrukcji przedstawionej na stronie stworzono Dockerfile

![Dockerfile](./dockerfile.png)

- utworzono nowy obraz Docker

![nowy_obraz_docker](./obraz.png)

- na koniec uruchomiono utworzony obraz jako kontener w Dockerze

![uruchomienie](./uruchomienie_obrazu.png)

- poleceniem `docker ps` sprawdzono działające kontenery

![sprawdzenie działających kontenerów](./uruchomienie_kontenera.png)

- po odczytaniu pliku z hasłem zalogowano się do Jenkinsa

![ekran logowania](./jenkins.png)
