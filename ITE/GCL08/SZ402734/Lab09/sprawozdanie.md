## Szymon Mateusz Zych 402734 Lab05

#### Cel: System pod uruchomienie, instalacja nienadzorowana

### Wymagania:
 - artefakt z poprzednich zajęć
 - WinSCP
 - Virtualbox
 - Fedora

## Instalacja
Zainstalowanie obrazu Fedory 36 netinstall z wybranymi opcjami:

#### Partycja
![Partycja](./scr/1.png)

#### Root
Włącznie ssh jest ważnym krokiem
![Root](./scr/3.png)

#### Nazwa
![Nazwa](./scr/2.png)

#### Środowisko
![Środowisko](./scr/4.png)

### Po Instalacji
Sprawdzam adres IP aby połączyć się poprzez WinSCP i pobrać plik anaconda-ks.cfg.
![Instalacji](./scr/6.png)
![Instalacji](./scr/Winscp.png)
![Instalacji](./scr/WinScp2.png)


## Serwer
Stworzono taką samą maszynę wirtualna z obrazem, jedyna różnica to nazwa która została przyjęta jako "serwer".

#### Instalacja httpd
![httpd](./scr/7.png)

#### Wyjątki w zaporze
![Wyjątki](./scr/8.png)

#### Włączenie usług
![Włączenie](./scr/9.png)

#### Sprawdzenie adresu i przesłanie artefaktu WinScp
![Sprawdzenie](./scr/10.png)


#### Utworzenie katalogu i skopiowanie artefaktu (wget)
![katalogu](./scr/11.png)
![skopiowanie](./scr/12.png)

#### Instalacja npm
![npm](./scr/13.png)
![progrInstalacjaamu](./scr/14.png)

#### Instalacja programu 
![programu](./scr/15.png)


## Instalacja Nienadzorowana

Wymagany aktualnie bedzie plik anaconda-ks.cfg i przesyłamy go do repo na githubie. W pliku który wysyłamy na repo zostały dokonany zmiane typu dodanie seksji post w ktorej pobieramy artefakt z serwera, instalacja potrzebnych pakietow, repo Fedory oraz zamiana instalacji graficznej na tekstową.

#### Przed instalacja
Sprawdzamy czy w maszynie został utworzony dysk wiekszy niż deklarowany w pliku cfg 

#### Uruchomienie instalacji 
Wykorzystano link z githuba
![programu](./scr/22.png)



## Infrastructure as a code

#### Zamontowanie obrazu Fedory
#### Uwrozenie katalogu oraz zamontowanie w obrazu
#### Utworzenie katalogu roboczego i skopiowanie obrazu
#### Skopiowanie anaconda
![programu](./scr/66.png)

#### Modyfikowanie pliku isolinux.cfg
![programu](./scr/100.png)

#### Instalacja pakietu
![programu](./scr/120.png)

#### Stworzenie nowego ISO oraz pobranie obrazu WinScp oraz reczna instalacja na marzynie 
![programu](./scr/200.png)
![programu](./scr/210.png)
