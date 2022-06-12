# Szymon Twardosz - Lab 09 DevOps


## Przygotowanie systemu pod uruchomienie

Najpierw pobrałem obraz Fedory w wersji 36 netinstall i zainstalowałem ją z następującymi parametrami:

- użytkownik

![screen1](./screenshots/1.png)

- minimalna instalacja

![screen2](./screenshots/2.png)

- ustawienia sieciowe

![screen3](./screenshots/3.png)

- ręczne partycjonowanie

![screen4](./screenshots/4.png)

- przesłanie pliku `anaconda-ks.cfg` za pomocą scp.

## Instalacja i konfiguracja serwera

- instalacja serwera http (`dnf install httpd`)

- dodanie portu 80 (`firewall-cmd --add-port=80/tcp`)

- konfiguracja pliku `/etc/httpd/conf/httpd.conf`

![screen5](./screenshots/7.png)
![screen6](./screenshots/8.png)

- wyłączenie SELinuxa

![screen7](./screenshots/9.png)

- uruchomienie serwera http (`systemctl start httpd`)

- przekopiowanie artefaktu na serwer

![screen8](./screenshots/11.png)

- skopiowanie artefaktu do katalogu `/var/artifacts`, który jest udostępiony w configu httpd

## Konfiguracja klienta

- instalacja pakietu wget

![screen9](./screenshots/6.png)

- pobranie artefaktu, używając wget, z serwera

![screen10](./screenshots/13.png)

- sprawdzenie czy działa (uruchomienie)

![screen11](./screenshots/12.png)


## Instalacja nienadzorowana

Dokonane zmiany w pliku `anaconda-ks.cfg`:

* zmiana trybu instalacji z graficznej na tekstową

* dodanie repozytoriów Fedory

* dodanie instalacji pakietu wget

* dodanie sekcji post, w której jest pobranie artefaktu z serwera

- komenda, którą należy użyć, aby podczas instalacji pobrać plik konfiguracyjny z serwera

![screen12](./screenshots/14.png)


## Infrastructure as a code

- zamontowanie w napędzie optycznym obrazu Fedory (urządzenia -> napędy optyczne na górnym pasku)

- utworzenie katalogu `/media/iso` i zamontowanie w nim obrazu z napędu

![screen13](./screenshots/15.png)

- utworzenie katalogu roboczego `/root/fedora_iso` i skopiowanie do niego obrazu z katalogu `/media/iso`

![screen14](./screenshots/16.png)

- skopiowanie pliku `anaconda-ks.cfg` do katalogu z obrazem i zmiana jego nazwy na `ks.cfg`

![screen15](./screenshots/17.png)

- modyfikacja pliku `isolinux.cfg`

![screen16](./screenshots/18.png)

- zainstalowanie pakietu genisoimage

![screen17](./screenshots/19.png)

- utworzenie nowego obrazu ISO (na dole komenda, a nad nią efekt jej wywołania)

![screen18](./screenshots/20.png)

- pobranie utworzonego obrazu ISO, utworzenie maszyny wirtualnej i uruchomienie instalacji z poprzednio pobranego obrazu
