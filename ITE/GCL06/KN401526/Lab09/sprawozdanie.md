# Sprawozdanie Lab_9 Kacper Nosarzewski
## 1. Cel cwiczenia
Celem labolatorium bylo przygotownie wdrozen nienadzorowanych

## 2. Wykonanie cwiczenia

1. Instalacja Fedory

    * Wybranie opcji oprogramowanie z minimalnymi funkcjami
    ![img](software.PNG)

    * Ustawienie nazwy hosta na `template-lab09.agh` 
    ![img](host.PNG)

    * Skonfigurowanie roota 
    ![img](root.PNG)

    * Stworzenie uytkownika
    ![img](user.PNG)

    * Rozpoczecie instalacji
    ![img](instalacja.PNG)

    * Zalogowanie sie na stworzonego uzytkownika
    ![img](logowanie.PNG)

Instalcja usugi httpd poleceniem ` sudo dnf -y install httpd`

![img](instalacja_httpd.PNG)

![img](instalacja_httpd2.PNG)

W celu dzialanie na serverze zostaly zmienione uprawinienia firewall

![img](zapora.PNG)

Natepnie sever zostaje uruchomiony poleceniem `systemctl enable httpd --now` i wyswietlono jego statusu poleceniem `systemctl status httpd`

![img](uruchomienie_servera.PNG)

Urzywajac Filezilli artefakty zostaly umieszczone na maszynie wirtualniej a nastepnie wyslane na server `http://192.168.0.189/mongo-express`

![img](artefakty.PNG)

![img](upload_artefaktow.PNG)

Na drugiej maszynie virtualnej z servera zostaly pobrane artefakty poleceniem `wget 192.168.0.189/mongo-express/mongo-express_1.0.0.tar.xz`

![img](pobranie_danych_server.PNG)

 2. Instalacja nienadzorowana

Uzywajac Filezilli z Fedora zostal przeslany pliku z odpowiedziami `anaconda-ks.cfg`

![img](skopiowanie_anacondy.PNG)

Do pliku `anaconda-ks.cfg` zosatly wprowadzone ponizsze zmiany

```
# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64

%packages
@^minimal-environment
wget

%post
mkdir mongo-express
wget 192.168.0.188/mongo-express/mongo-express_1.0.0.tar.xz
%end

```

Przeslanie pliku `anaconda-ks.cfg` na githuba do mojego brancha

![img](git.PNG)


W celu przeprowadzenia instalacji trzeciej maszyny wirtualniej nalezy uzyc ponizszego polecenia ktore korzysta z wygenerowanego pliku odpowiedzi z poprzedzniej maszyny waznym jest aby podczas konfigurowania maszyny ustawic taka sama ilosc pamieci jak na maszynie z ktorej plik odpowiedzi zostal wygenerowany

![img](instalacja_fedory_kolejnej.PNG)


Rozpoczecie procesu instalacji nowej maszyny

![img](new_fedora.PNG)

Po pomyslnym zainstalowaniu gdy podswietli sie przycisk `Reboot System` nalezy go nie klikac tylko wylaczyc maszyne odpiac plik .iso ktory podpinalismy na poczatku podczas tworzenia a nastepnie wlaczyc maszyne na nowo w zainstalowanej maszynie znajduje sie plik z artefaktami pobranymi poleceniem wget

![img](fedora3.PNG)
