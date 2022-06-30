## Część pierwsza - wolumeny + klon
Stworzyłem wolumeny: wejściowy i wyjściowy
![volumes](volumes.png)
Zbudowałem kontener w oparciu o ostatni release Ubuntu podając utworzone dwa wolumeny
  sudo docker run -it -v "volume_in:/volume_in" -v "volume_out:/volume_out" ubuntu:latest
Zainstalowałem **npm** potrzebny do zbudowania projektu. Wykazałem nieobecność **git**'a w kontenerze
![npm ok git missing](npmgit.png)
Na hoście sklonowałem repo na mountpoint wolumenuu wejściowego
![clone to volume_in](clone.png)
W tym momencie w kontenerze jest widoczny katalog z repozytorium
![lsls](lsls.png)
Zbudowanie zależności przez
  npm install
i przeniesienie wszystkiego w obrębie kontenera na wolumen wyjściowy pozwala na dostęp z poziomu hosta do aplikacji i uruchomienie serwera.
![lsout](lsout.png)


## Część druga - ekspozycja portów
Zainstalowałem wymagany pakeit **iperf3** oraz **iproute2** do wyświetlenia listy interfejsóœ sieciowych
Połączyłem się z serwerem z poziomu kontenera klienta
![connection gut](connect.png)
oraz z hosta
![connection also gut](conn_host.png)
Niewyeksponowany w trakcie uruchamiania port gwarantuje, że wyłącznie host kontenera będzie się w stanie z nim łączyć "z zewnątrz"
![failed conn](failed.png)
Uruchamiam serwer ponownie, explicite eksponując port 9001 w obie strony
![rest](restart.png)
Teraz możliwe jest połączenie z kontenerem-serwerem również z poziomu sieci hosta
![very good conection on locaklhost](verigut.png)
Zmierzony bitrate
* klient->serwer  :37.8 Gbits/sec
* host->serwer    :45.7 Gbits/sec
* host_lan->serwer:28.2 Gbits/sec

## Część trzecia - Jenkins
Stworzyłem sieć dockera dla Jenkinsa
![jenk](net_create.png)
Pobrałem i uruchomiłęm obraz dind dockera wg dokumentacji dockera
![docker is amazing](ref.png)
![cóż to była za linijka](download_and_run.png)
Uruchomiłem kontener i odnalazłem hasło
![kolejna duża](runit.png)
Skonfigurowałem instalację Jenkinsa
![jenkins is home](jenkins.png)
