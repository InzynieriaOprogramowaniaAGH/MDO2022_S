# Rafał Olech - Sprawozdanie z laboratorium 9

## Cel ćwiczeń:

Celem ćwiczeń laboratoryjnych była instalacja i konfiguracja systemu Fedora na VM. Wykorzystanie podstawowych działań na pliku odpowiedzi z instalacji.


## Wykonanie ćwiczenia:

### 1. Instalacja Fedory.

Podczas instalowania systemu Fedora wybrałem język na angielski, następnie wybrałem układ klawiatury na Polish (legacy). 

Jako miejsce instalacji systemu zostawiłem ustawienia domyślne.

![img](instalacja2.PNG)


W kolejnym kroku konfiguracji systemu zmieniłem nazwę hosta na `template-lab9.agh`.

![img](instalacja3.PNG)


Następnie wybieram podstawową/minimalną wersję oprogramowania do zainstalowania.

![img](instalacja7.PNG)


Należy dodać konto administratora z nadaniem loginu i hasła.

![img](instalacja8.PNG)


W ostatnim kroku dodawany jest użytkownik o nazwie `user`.

![img](instalacja9.PNG)

Po zakończonej pomyślnie instalacji i włączeniu się Fedory możiwe jest zalogowanie na utworzonego użytkownika.

![img](instalacja11.PNG)


### 2. Instalacja i konfiguracja drugiej Fedory.

Została zainstalowana druga Fedora, której celem będzie wyłącznie serwowanie repozytorium po HTTP.


Następnie na nowo zainstalowanym systemie została zainstalowana usługa httpd za pomocą komendy `sudo dnf -y install httpd`.

![img](pobranie_httpd.PNG)


Następnie została rozpoczęta instalacja z pliku odpowiedzi:

![img](instalacja_z_anacondy1.PNG)

![img](instalacja_z_anacondy2.PNG)

![img](instalacja_z_anacondy3.PNG)





Uruchomienie usługi httpd poleceniem `systemctl enable httpd --now`:

![img](systemctl_enable.PNG)


Aby sprawdzić czy usługa została poprawnie uruchomiona i sprawdzić jej aktualny status należy skorzystać z polecenia `systemctl status httpd`. Na poniższym zrzucie ekranu widoczne jest, że usługa jest aktywna.

![img](systemctl_status.PNG)


W dalszej konfiguracji nowego systemu należy wyłączyć firewalla poniższymi komendami:

![img](firewall.PNG)


Utworzenie katalogu o nazwie wybranego repozytorium, w moim przypadku jest to `cytoscape`:

![img](utworzenie_katalogu.PNG)


Wejście do utworzonego na serwerze katalogu za pomocą wyszukiwarki:

![img](www.PNG)



Umieszczenie artefaktów z projektu na serwerze HTTP:

![img](dodanie_katalogu_na_serwer.PNG)



Aby sprawdzić czy projekt się pomyślnie dodał na serwer, można się na niego zalogować korzystając z wyszukiwarki:

![img](dodany_projekt_na_serwer.PNG)



Na zainstalowanej jako pierwsza Fedorze korzystając z polecenia `wget 172.20.10.14/cytoscape/cytoscape_1.0.0.tar.xz` zostają pobrane artefakty z serwera:

![img](wget.PNG)



### 3. Instalacja nienadzorowana.

Pobranie pliku o nazwie `anaconda-ks.cfg` w celu jego modyfikacji:

![img](fillezilla.PNG)


Modyfikacja pliku `anaconda-ks.cfg`. Poniżej znajdują się zmienione lub dodane fragmenty pliku:

```
# Use graphical install
graphical

# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64

%post
mkdir cytoscape
wget 172.20.10.14/cytoscape/cytoscape_1.0.0.tar.xz
%end
```

Przy instalacji trzeciej Fedory należy użyć poniższej komendy. Instalacja uruchamiana jest z pliku odpowiedzi, który został umieszczony wcześniej na GitHubie:

![img](komenda.PNG)

Pojawi się dokładnie taki sam interface jak przy klasycznym instalowaniu systemu i rozpocznie się instalowanie.

![img](instalacja_z_pliku.PNG)

Po ukończonej instalacji należy wyłączyć wirtualną maszynę bez zapisywania, odłączyć w ustawieniach systemu płytkę iso, a następnie ponownie uruchomić system. W ten sposób system uruchomi się poprawnie z pliku odpowiedzi.

![img](instalacja_z_pliku2.PNG)

Aby zobaczyć czy instalacja przebiegła poprawnie można wyświetlić istniejące pliki i katalogi poleceniem `ls`. Na poniższym zdjęciu widoczny jest plik tar, który jest artefaktem, a więc instalacja przebiegła pomyślnie.

![img](ls.PNG)





