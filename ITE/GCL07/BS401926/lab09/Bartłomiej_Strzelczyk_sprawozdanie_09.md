# Sprawozdanie z laboratorium 9 
 
## Wykonanie laboratorium 

**1. Przygotowanie systemu pod uruchomienie**
a) Wybranie minimalnej instalacji

![inst](./inst1.png)

b) stworzenie partycji

![prt1](./prt1.png)
![prt2](./prt2.png)

c) uaktywnienie root'a

![root](./root.png)

Instalacja została przeprowadzona pomyślnie, w jej wyniku stworzony został plik anaconda-ks.cfg, zawierający informację dla instalatora automatycznego

![anaconda](./anaconda.png)

Druga maszyna jest serwerem plików dla nexe

**2. Instalacja serwera i wget'a**

a) instalacja httpd

![instalacja-httpd](./instalacja-httpd.png)

b) zainstalowano httpd

![zainstalowano-httpd](./zainstalowano-httpd.png)

c) dodano wyjątki do zapory

![firewall](./firewall.png)

d) uruchomiono httpd

![systemctl-server](./systemctl-server.png)

e) z pomocą  winSCP utworzono folder z artefaktem

![tgz-server](./tgz-server.png)

f) na hoście zainstalowano wget

![dnf-install-wget](./dnf-install-wget.png)

g) pobrano nexe na hosta

![wget-nexe](./wget-nexe.png)

**3. Instalacja nienadzorowana**

Należało edytować plik anaconda-ks.cfg i wysłać go na githuba; poniżej zamieszczam zmiany w kodzie

a) zmiana typu instalacji i dodanie informacji o repo

![zmiana1](./zmiana1.png)

b) dodanie zależności do pobrania

![zmiana2](./zmiana2.png)

c) sekcja post do pobrania nexe

![zmiana3](./zmiana3.png)

Stworzenie nowej maszyny

![nienadz](./nienadz.png)

![inst-nienadz](./inst-nienadz.png)

![instalated](./instalated.png)





