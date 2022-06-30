# SPRAWOZDANIE LAB02 
Patrycja Pstrąg 401409

1. Wyświetlenie zawartości katalogu hooks

![PLOT](Screenshot01.png)

2. Przygotowanie git hooka sprawdzającego czy w tytule commita znajduje się PP401409, oraz czy w treści commita znajduje się numer laboratorium.

![](SCreenshot02.png)

```sh
#!/bin/sh
if [ "$(grep -E -w -o 'PP401409' "$1" | wc -l)" != "1" ]
then
    echo INCORRECT_TITLE
    exit 1
fi
if [ $(grep -E -w -o 'Lab[0-20]*' "$1" | wc -l) != "1" ]
then
    echo  INCORRECT_DESC
    exit 1
fi
exit 0
```

Przykład działania
a) niewłaściwy tytuł commita - poprawione

![](Screenshot03.png)

b) właściwy tytuł commita ale niewłaściwa treść commita - poprawione

![](Screenshot04.png)

c) właściwy tytuł i treść - poprawione

![](Screenshot05.png)

3. Przygotowanie środowiska Dockerowego:

`sudo dnf install docker` Instalacja dockera

`docker --version` Sprawdzenie wersji dockera

![](Screenshot06.png)

`systemctl status docker` Sprawdzenie czy docker jest uruchomiony

![](Screenshot07.png)

`ifconfig` Wyświetlenie interfejsu sieciowego w celu nawiąznia połączenia z Windowsem

![](Screenshot08.png)

4.Łączenie za pomocą ssh

a) `sudo systemctl status sshd` sprawdzenie statusu ssh

b) `sudo systemctl enable sshd`

c) `sudo systemctl start sshd` uruchomienie ssh

d) ponowne sprawdzenie statusu

![](Screenshot09.png)

WYSTĄPIŁ BŁĄÐ PRZEZ FAKT, ŻE DO SIECI AKADEMIKOWEJ TRZEBA SIĘ LOGOWAĆ I MASZYNA WIRTUALNA NIE MIAŁA DOSTĘPU DO INTERNETU GDY SIEĆ BYŁA USTAWIONA NA BRIDGET

5. Uruchomienie obrazu fedory w kontenerze

`sudo docker image pull fedora`
Pobranie obrazu fedory

![](Screenshot10.png)

` sudo docker run fedora`

Uruchomienie obrazu fedory

`sudo docker ps -a`

`sudo docker images`

![](Screenchot11.png)


6. Założenie konta na Docker Hub

![](Screenshot12.png)



