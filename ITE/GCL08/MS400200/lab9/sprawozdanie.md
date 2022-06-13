# Sprawozdanie Lab09 Michał Szymański ITE-GCL08


## Cel ćwiczenia
Przygotowanie systemu pod uruchomienie, Instalacja nienadzorowana, Infrastructure as a code

## Przygotowanie systemu pod uruchomienie
Pobrano obraz Fedory '''Fedora-Server-netinst-x86_64-36-1.5''' i przeprowadzono jego instalację:
![1](1.PNG)
![2](2.PNG)
![3](3.PNG)
![roota](konto_roota.PNG)

Następnie sprawdzono adres IP maszyny, w celu pobrania pliku `anaconda-ks.cfg` przez SSH za pomocą  WinScp:
![4](4.PNG)
![5](5.PNG)

## Instalacja serwera Fedory
Instalacja w ten sam sposób jak powyżej, zmieniono jedynie nazwę urządzenia.

- Instalacja httpd:
![6](6.PNG)

- Dodanie reguł firewalla oraz przeładowanie go:
![7](7.PNG)

- Sprawdzenie statusu usługi httpd:
![8](8.PNG)

- Adres IP sprawdzono w celu przesłania artefaktu przez WinScp do serwera:
![9](9.PNG)
![10](10.PNG)

- Stworzono folder html dla artefaktu i skopiowano do niego paczkę:
![11](11.PNG)


## Pobranie artefaktu z serwera:

- Zainstalowano pakiet wget i pobrano artefakt:
![12](12.PNG)

## Instalacja nienadzorowana

Zmodyfikowano plik '''anaconda-ks.cfg''':
    - Tryb instalacji tekstowy,
    - Dodanie repozytoriów Fedory,
    - Dodanie pakietów wget i python3,
    - Sekcja post, w której pobierany jest artefakt z serwera.

Uruchomiono instalację za pomocą komendy:

`vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-36 inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/MS400200/ITE/GCL08/MS400200/lab9/anaconda-ks.cfg`
![13](13.PNG)
![14](14.PNG)












