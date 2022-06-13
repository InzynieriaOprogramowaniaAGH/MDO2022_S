# Sprawozdanie Lab09 Bartosz Tonderski
#### Cel laboratorium : 
Przeprowadznie instalacji wygenerowanego artefaktu pod niezależnym systemem oraz przeprowadzenie nienazdorowanej instalacji systemu z zależnościami oraz oprogramowaniem.

## Wykonanie 
### Instalacja Fedora serwer

Zainstalowanie fedora netinstall 36 z następującą konfiguracją:
![fed1](./Screenshots/fed_ver.png)
![fed2](./Screenshots/fed_net.png)
![fed3](./Screenshots/drv_conf_1.png)
![fed4](./Screenshots/drv_conf_2.png)
![fed5](./Screenshots/fed_root.png)

Wyswietlenie adresu ip w celu połączenia się z winSCP oraz pobranie anaconda-ks.cfg

![fed_ip](./Screenshots/fed_serv_ip_bef_arti.png)
![winscp](./Screenshots/win_scp_con.png)

### Instalacja potrzebnych rzeczy na serwerze 
Instalacja obrazu klienta oraz serwera odbywała się identycznie z różnicą nazwy systemu.

#### instalacja http deamon
![httpd](./Screenshots/httpd_install.png)
#### ustawienia firewall'a
![firewall](./Screenshots/firewall.png)
#### uruchomienie usług http oraz sprawdzenie dzialania
![http](./Screenshots/httpd-status.png)

Sprawdzenie ip odbyło się jak przy poprzednim systemie

#### utworzenie katalogu na serwerze

![arti](./Screenshots/art_to_fed_serv_winscp.png)
![arti2](./Screenshots/apollo_serv_httpd_chmod.png)
![arti3](./Screenshots/var_www_html_apo.png)


### instalacja wget na kliencie

![wget1](./Screenshots/wget_install.png)

#### Pobranie artefaktu za pomocą wget
![wget2](./Screenshots/wget_artifact.png)

#### instalacja pakietu za pomoca npm 

![npm1](./Screenshots/fed_npm_install.png)

![npm2](./Screenshots/install_arti.png)

## Instalacja nienadzorowana

Modyfikacja pliku anaconda_kf.cfg oraz umiejscowanie go na githubie

[anaconda_ks.cfg](./anaconda-ks.cfg)

Zamontowanie iso Fedory w systemie

![an1](./Screenshots/mpunt_iso_serv.png)

Utworzenie katalogow roboczych oraz zamontowanie obrazu

Modyfikacja pliku isolinux.cfg

![an2](./Screenshots/isolinux_change.png)

Instalacja Geniso

![an3](./Screenshots/geniso_install.png)

Uruchomienie Generowania obrazu za pomoca geniso poniższa komendą

![an4](./Screenshots/geniso_command.png)

Powstanie obrazu iso

![an5](./Screenshots//iso_prove.png)

#### Przy uruchomieniu maszyny trzeba zwrócić uwagę aby dysk był tego samego rozmiaru bądź większy, inaczej instalacja może się nie powieść.