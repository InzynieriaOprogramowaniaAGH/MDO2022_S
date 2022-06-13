## Michał Wojdyła 401139

### Sprawozdanie zostało wykonane tym razem na systemie windows, gdyz na macu z M1 nie ma vboxa.

<br/>

# Przygotowanie systemu pod uruchomienie

- Instalacja systemu fedora

![I_1](./images/host/install_1.png)
![I_2](./images/host/install_2.png)
![I_3](./images/host/install_3.png)
![I_4](./images/host/install_4.png)

- Wyswietlenie adresu ip maszyny w celu pobrania pliku anaconda-ks.cfg za pomocą WinScp (SSH):

![Ip](./images/host/ip.png)
![Ws](./images/host/winscp.png)

<br/>

# Instalacja oraz konfiuracja serwera

### Instalację przeprowadzono w taki sam sposób jak poprzednio.

- Zainstalowanie httpd:

![Ht](./images/serv/httpd.png)

- Dodanie wyjątków do zapory sieciowej i przeładowanie jej:

![Ht](./images/serv/firewall.png)

- Włączenie httpd:

![Ht](./images/serv/httpd_enable.png)

- Sprawdzenie poprawności działania:

![Ht](./images/serv/httpd_status.png)

- Sprawdzenie adresu ip serwera oraz przesłanie na niego artefaktu wcześniej pobranego z Jenkinsa:

![Ip](./images/serv/ip.png)
![Ip](./images/serv/winscp.png)

- Utworzenie oraz skopiowanie artefaktu do /var/www/html/node-red (jest to domyślnie udostępniany katalog przez httpd):

![Cp](./images/serv/cp_file.png)

<br/>

# Pobranie artefaktu z serwera

- Pobranie artefaktu (po zainstalowaniu pakietu wget):

![Get](./images/host/get_from_serv.png)

- Następnie rozpakowano artefakt, zainstalowano npm oraz zalezności projektu (node_modules) oraz uruchomiono aplikacje w celu sprawdzenia poprawności działania:

![Get](./images/host/run_app.png)

<br/>

# Instalacja nienadzorowana

### Zmodyfikowano plik anaconda-ks.cfg oraz przesłano go na githuba.

### Komenda uzyta do instalacji:

`vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-36 inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/MW401139/ITE/GCL08/MW401139/Lab09/anaconda-ks.cfg`

![I_a](./images/install_anaconda.png)

<br/>

# Infrastructure as a code

- Zamontowanie obrazu fedory w napędzie optycznym maszyny

- utworzenie katalogu /media/iso oraz zamonowanie iso

![Mount](./images/iso/mount.png)

- Utworzenie katalogu roboczego oraz skopiowanie do niego plikow w celu usyskania uprawnień do modyfikacji oraz skopiowanie pliku anaconda-ks.cfg do katalogu isolinux oraz zmiana jego nazwy

![Cp](./images/iso/copy.png)

- Modyfikacja pliku isolinux.cfg

![Cfg](./images/iso/cfg.png)

- Wypalenie obrazu ISO

![Iso](./images/iso/iso.png)
![Iso_ls](./images/iso/iso_ls.png)

### Na końcu przesłano plik ISO z maszyny na system Windows (host) za pomocą WinSCP oraz utworzono z niego kontener.
