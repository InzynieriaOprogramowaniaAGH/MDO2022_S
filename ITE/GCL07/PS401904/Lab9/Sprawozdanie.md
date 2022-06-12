# Sprawozdanie
##
## Patryk Stefan GĆL_07
##
##

### Przygotowanie systemu fedora

##### Stworzenie partycji.
![Screenshot](1.png)
##### Nazwanie sieci.
![Screenshot](2.png)
##### Dodanie konta roota oraz zezwolenie na logowanie przez ssh (do późniejszego łączenia w celu przesłania artefaktu przez filezille).
![Screenshot](3.png)
##### Wybranie minimalnej instalacji fedory.
![Screenshot](4.png)
##### Po poprawnej instalacji i sprawdzeniu adresu ip maszyny wirtualnej (fedory)- wyciągnięcie z niej pliku anaconda-ks.cfg łącząc się przez SSH przez filezille.
![Screenshot](5.png)
##### Ten sam proces został wykonany dla drugiej maszyny- serwera. Po instalacji serwera- zainstalowanie httpd.
![Screenshot](6.png)
##### Wyłączenie firewalla.
![Screenshot](7.png)
##### Włączenie usługi httpd i sprawdzenie czy działa.
![Screenshot](8.png)
##### Przesłanie artefaktu pobranego z jenkinsa do maszyny wirtualnej - serwera przez program filezilla.
![Screenshot](9.png)
##### Utworzenie folderu /var/www/html (ten folder jest udostępniany przez usługę httpd), nadanie mu wszystkich praw oraz skopiowanie do niego artefaktu.
![Screenshot](10.png)

### Pobranie artefaktu express.js z serwera oraz instalacja.

##### Zainstalowanie pakietu wget na maszynie klienta.
![Screenshot](11.png)
##### Pobranie artefaktu przez klienta z serwera komendą wget.
![Screenshot](12.png)
##### Instalacja npm na maszynie klienta.
![Screenshot](13.png)
##### Udana instalacja używając artefaktu.
![Screenshot](14.png)

### Instalacja nienadzorowana

#### Wcześniej pobrany plik anaconda-ks.cfg został zmodyfikowany tak aby:
- pobrał artefakt z serwera
- dodał repozytorium fedory
- zainstalował pakiet npm i wget
- instalacja przebiegała w sposób tekstowy- nie graficzny.

##### Instalacja fedory używając niestandardowej instalacji- podając ścieżkę do pliku anaconda-ks.cfg wcześniej wrzuconego na githuba.
![Screenshot](15.png)
##### Instalacja zakonczona sukcesem.
![Screenshot](zainstalowanePoprawnie.png)

### Infrastructure as a code

##### Na serwerze- wpięcie dysku optycznego z obrazem fedory.
![Screenshot](16.png)
##### Stworzenie nowego folderu oraz uruchomienie obrazu z napędu optycznego.
![Screenshot](17.png)
##### Skopiowanie obrazu do folderu fedora_sio
![Screenshot](18.png)
##### Wrzucenie pliku anaconda-ks.cfg do fedora_iso/iso/isolinux i zmiana nazwy na ks.cfg używając filezille.
![Screenshot](19.png)
##### Modyfikacja pliku isolinux.cfg tak aby używał pliku ks.cfg przy instalacji.
![Screenshot](20.png)
##### Zainstalowanie pakietu genisoimage do wygenerowania nowego obrazu.
![Screenshot](21.png)
##### Generowanie nowego obrazu.
![Screenshot](22.png)
##### Generowanie nowego obrazu zakończone sukcesem.
![Screenshot](23.png)
##### Wygenerowany obraz o nazwie Fedora.iso znajduje się w folderze root.
![Screenshot](24.png)



