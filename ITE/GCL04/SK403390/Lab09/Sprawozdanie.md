# Sprawozdanie Lab 03

Sławomir Kotula

IT, DevOps, grupa lab 4

Data: 11.05.2022


# Przeprowadź instalację systemu Fedora w VM...
### Przygotowano maszynę wirtualną, przydzielono jej 24GB miejsca na dysku. Wybrano język instalacji angielski, polski układ klawiatury, przeprowadzono manualne partycjonowanie, w sekcji software selection wybrano "minimal install", stworzono konto roota i użytkownika bez uprawnień administracyjnych - deployer:

![manual partitioning](04.png)

![minimal install](05.png)

![network](06.png)

![root](07.png)

![deployer](08.png)

Uruchomiono instalację
![installing](09.png)

### Instalacja została przeprowadzona pomyślnie, w jej wyniku stworzony został plik <i>anaconda-ks.cfg</i>, zawierający informację dla instalatora automatycznego - pozwoli na powtórzenie procesu instalacji bez wpisywania danych ręcznie
![anaconda](10.png)

# Przeprowadź drugą instalację systemu Fedora w VM z serwerem HTPP
### Druga maszyna będzie służyła jako serwer plików http, z której pobrany zostanie plik irssi.
### Na nowej maszynie przeprowadzono instalację serwisu httpd: Zaktualizowano listę pakietów
![dnfupdate](13.png)

### Zainstalowano httpd
![installHTTPD](14.png)

### Uruchomiono httpd
![systemctlEnableHttpd](15.png)
![status](16.png)

### Dodano wyjątki do zapory
![firewall](22.png)

### W folderze /var/www/html/ stworzono folder shares do którego skopiowano plik irssi. Teraz można połączyć się z serwerem i pobrać z niego pliki
![irssi](33.png)

### Na pierwszej fedorze zainstalowano wget
![wget](23.png)

### Pobrano irssi z serwera. Po pobraniu zmieniono uprawnienia do pliku aby właściciel mógł go uruchomić. Brakuje zależności
![./irssi](24.png)

### Po zainstalowaniu libutf8 irssi daje się uruchomić
![./irssi](25.png)

# Instalacja nienadzorowana
### Plik <i>anaconda-ks.cfg</i> będzie musiał zostać edytowany i wysłany na github. W tym celu połączono się z Fedorą przez sftp przez Filezillę. Użytkownik deployer nie ma uprawnień do pliku anaconda, więc wymagane było skopiowanie pliku do do jego katalogu domowego i zmiana właściciela pliku za pomocą polecenia chown
![cp](12.png)

## Wprowadzono zmiany do pliku:
### Zmieniono typ instalacji na tekstowy, 
![text](30.png)

### Wprowadzono informacje o repozytorium
![Repo](31.png)

### Dodano wymagane zależności: wget do pobrania irssi, uft8proc do uruchomienia programu
![packages](32.png)

### Dodano sekcję post do której wstawiono polecenia pobierające irssi
![post](34.png)

### Stworzono nową maszynę, przypięto do niej płytkę z fedorą i uruchomiono instalację nienadzorowaną
![installingFedora](26.png)
![installingFedora](27.png)
![installingFedora](28.png)

### Po zmienieniu uprawnień do pliku irssi się uruchamia
![irssi](29.png)
