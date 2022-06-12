# Sprawozdanie Lab 03

Sławomir Kotula

IT, DevOps, grupa lab 4

Data: 05.04.2022




# Stworzenie woluminów
![docker volume create](01.png)

# Uruchomienie ubuntu z podpiętymi woluminami
![docker run](02.png)

# Woluminy są widoczne w systemie plików
![ls](03.png)

# Instalacja wymaganych zależności bez gita
![apt update](04.png)
![apt install](05.png)

- Sklonuj repozytorium na wolumin wejściowy
# Sprawdzenie lokacji woluminu
![docker volume inspect](06.png)

# Odmowa wejścia do katalogu z kontenerem
![ls](07.png)

## Po zalogowaniu na roota można wejść do folderu
![cd](08.png)

# sklonowanie repozytorium
![git clone](09.png)

# irssi jest teraz widoczne na dockerze
![ls](10.png)

# Skopiowanie irssi z woluminu na kontener
![cp](11.png)

# Zbudowanie projektu
![meson setup build](12.png)
![meson setup build](13.png)

# Skopiowanie zbudowanych plików do woluminu wyjściowego
![cp](14.png)

# Pliki są widoczne na maszynie wirtualnej
![ls](15.png)

# Uruchomienie kontenera z przekierowaniem portów
![sudo docker run](22.png)

# Sprawdzenie ip kontenera
![docker inspect](18.png)

# Instalacja i uruchomienie iperf3 w konenerze
![apt install](16.png)
![iperf3 -s](17.png)


## Utworzono nowy kontener, zainstalowano na nim iperf3. Następnie uruchomiono klienta i połączono się z drugim kontenerem
![iperf3 -c](19.png)

# Połączenie z hosta
![iperf3 -c](21.png)

# Połączenie z poza hosta(Windows)
![iperf3 -c](23.png)

# Logi po stronie serwera
## Od góry: Windows, inny kontener, Host
![iperf3 -slogi](24.png)
![iperf3 -slogi](25.png)

# Po zamknięciu kontenera można sprawdzić jego zmiany w logach
![docker logs](26.png)

- Instalacja Jenkinsa

# Utworzenie sieci jenkins w dockerze
![docker network](27.png)

# Utworzenie kontenera z dockerem
![docker run](28.png)

# Stworzenie Dockerfile
![nano Dockerfile](29.png)

# Zbudowanie obrazu
![docker build](30.png)

# Utworzenie kontenera z jetkinsem
![docker run](31.png)

# Mam teraz dostęp do strony jetkinsa
![firefox na Windows](32.png)

# W logach dockera znajduje się hasło
![docker logs](33.png)
![docker logs](34.png)

# Jenkins został zainstalowany
![firefox Windows](35.png)