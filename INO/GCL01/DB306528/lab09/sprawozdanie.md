##DevOps Sprawozdanie 09

Głównym przygotowaniem w celu wykonaniu zadania było zorganizowanie miejsca na moim zasyfionym dysku SSD, tak by bez najmniejszych obaw działać swobodnie na wielu wirtualnych systemach. Dysk po zwolnieniu miejsca:
![Przepięknie!](00 dysk.png)
Instalacja Fedory w VirtualBoxie:
![Fedora](01 Fedora.png)
![Fedora](02 Fedora.png)
![Fedora](03 Fedora.png)

Konfiguracja:
![Fedora](04 Fedora.png)

Poprawnie zainstalowane:
![Fedora](05 Fedora.png)

Logowanie jako root:
![Fedora](06 Fedora.png)

Plik anaconda-ks.cfg:
![Fedora](07 Fedora.png)

Przekierowanie portu w VirtualBoxie:
![Fedora](08 Fedora port.png)

Następnie instaluje drugi system Fedora, który będzie hostem. Wykonałem kolejno komendy w celu skonfigurowania:
**dnf install httpd**:
![Fedora2](09 Fedora2.png)
![Fedora2](10 Fedora2.png)

**dnf group install "Web Server"**:
![Fedora2](11 Fedora2.png)
![Fedora2](12 Fedora2.png)

**systemctl start httpd**
**systemctl enable httpd**
**firewall-cmd --add-service=http --add-service=https --permanent**
**firewall-cmd --reload**
![Fedora2](13 Fedora2.png)
Na powyższym zdjęciu sprawdziłem również status httpd

Wrzucam artefakt z Pipeline
![Fedora2](14 artefakt.png)

Mniej więcej w tej okolicy spotkałem się z problemami z poprawnym działaniem całej "konstrukcji", ale po długim szukaniu przyczyny doszedłem do tego, że nie wykonałem komendy **dnf install openssh-server**
![NO TAK TEGO](15 zapomniany krok.png)

Z problemami ale coś wyszło:
![komplikacje aaa](16 zadziałało.png)
###Instalacja nienadzorowana

Edycja pliku anaconda-ks.cfg. Następnie wrzucam na githuba. Lokalizacja to: "https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DB306528/INO/GCL01/DB306528/lab09/anaconda-ks.cfg"
Plik po drobnej edycji wygląda następująco:
![anaconda](17 anaconda.png)

Uruchomienie instalacji:
![no i poszło](18 niech już działa.png)

Działająca instalacja:
![no i poszło2](19 DZIAŁA.png)

Plik w folderze po instalacji:
![archive](20 archive.png)


W trakcie realizacji sprawozdania natrafiłem na sporo utrudnień spowodowanych problemem z połączeniem się do wirtualnej maszyny jako root przez inne programy. Omijałem te problemy logując się jako użytkownik w programie WinSCP a zmieniając uprawnienia do plików jako root zalogowany czy to w wirtualnej maszynie czy połączony poprzez PuTTy (PuTTy wymagało zalogowania się na konto użytkownika a potem zmianę użytkownika na root). Generalnie spotkałem się z różnymi utrudnieniami które próbowałem pokonać, ale kończyło się na tym że "obchodziłem je dookoła" ze względu na jakkolwiek racjonalne ograniczenie czasu.