# Sprawozdanie 9
## Bartosz Lidwin

### 1. Instalacja 2 Fedor  
Pobranie i zainstalowanie w wersji minimalnej fedory i fedory która posłuży do umieszczenia pliku na HTTP. 

![Image](./src/instalacja.png)

![Image](./src/fedory.png)


### 2. Wrzucenie do http

zainicjowanie serwisu Http następującymi komendami:

```
dnf group install "Web Server"

systemctl enable httpd

firewall-cmd --add-service=http --add-service=https --permanent

```

![Image](./src/web.png)

![Image](./src/uruchomienie.png)

![Image](./src/gttp.png)


Po wystartowaniu serwisu http i dodaniu do ścieżki var/www/html/ lowowego pliku stworzonego żeby było co pobrać

``` scp root@192.168.42.18:/var/www/html/devops ./devops ```

![Image](./src/download.png)

Po wielu trudach pobrane akurat z ubuntu ale jest. 

### 3. Instalacja nienadzorowana

Do instalacji nienadzorowanej potrzeba plik anaconda-ks.cfg do której trzeba dodać potrzebne dla nas klauzule do pobrania artefaktu %post i %end

Niestety każda próba kończy się nie udaną instalacją nie wazne czy graficzna czy tekstowa czy z własnego repo czy z http czy inne kombinacje

![Image](./src/odpalenie.png)

![Image](./src/Nieznaleziono.png)





























