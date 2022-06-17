# Zajęcia 09
### 2022-05-04 -- 2022-05-06
---
# Przygotowanie wdrożeń nienadzorowanych dla platform z pełnym OS
## Zadania do wykonania
### Przygotowanie systemu pod uruchomienie
* Przeprowadź instalację systemu Fedora w VM, skonfiguruj użytkowników (użyj haseł, które można bezkarnie umieścić na GitHubie!), sieć, wybierz podstawowy zbiór oprogramowania, optymalnie bez GUI
* Przeprowadź drugą instalację systemu Fedora w VM - celem drugiego systemu będzie wyłącznie serwowanie repozytorium przez HTTP

Zainstalowano dwa systemy Fedora w VM. Na drugim zainstalowano serwer HTTP Apache, uruchomiono go oraz sprawdzono jego status:

```
sudo dnf install httpd
sudo systemctl start httpd.service
sudo systemctl status httpd
```

![httpd install](Pictures/1.png?raw=true)

![start status](Pictures/2.png?raw=true)

Następnie ustawiono zaporę sieciową i przeładowano ustawienia:

```
 sudo firewall-cmd --permanent --add-service=http
 sudo firewall-cmd --permanent --add-service=https
 sudo firewall-cmd --reload
```

![firewall](Pictures/3.png?raw=true)

Celem komunikacji między systemami utworzono sieć i dodano ją do obydwu systemów:

![network](Pictures/4.png?raw=true)

![network](Pictures/5.png?raw=true)

* Umieść artefakty z projektu na serwerze HTTP

Dodano przekierowanie portów na obu maszynach celem możliwości połączenia się przez SSH:

![port forward](Pictures/6.png?raw=true)

Zmieniono uprawnienia dostępu do pliku /var/www/html

![chmod](Pictures/7.png?raw=true)

Przesłano artefakt na serwer narzędziem WinSCP:

![WinSCP](Pictures/8.png?raw=true)

* Na zainstalowanym systemie wykonaj zbiór poleceń umożliwiających pobranie artefaktu, zapisz polecenia

Do pobrania artefaktu z serwera wykorzystano polecenie wget: `wget 192.168.50.4/SimpleApp-1.0.0.jar`

![wget](Pictures/9.png?raw=true)

#### Zakres rozszerzony
* Skonfiguruj pipeline tak, by upload na serwer HTTP następował automatycznie
* Jeżeli artefaktem jest plik RPM, serwer HTTP powinien serwować repozytorium (createrepo)

### Instalacja nienadzorowana
* Zlokalizuj plik odpowiedzi z instalacji

Plik odpowiedzi z instalacji przeniesiono na hosta.

![winscp](Pictures/10.png?raw=true)

* Dodaj do niego elementy odpowiedzialne za wszystkie potrzebne dependencje
* Zdefiniuj repozytoria (co najmniej OS i aktualizacje, najlepiej też depednecje, optymalnie także repozytorium z własnym oprogramowaniem)
```
# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64
```
* Dodaj proces pobierania artefaktu (wybierz co najmniej jedno):
  * Jako czynność atomowa
  * Jako demon uruchamiany po starcie sieci @ boot
  * Jako podłączanie serwera w systemu plików w ramach udziału udostępnionego

Do pliku dodano repozytoria:

![cfg](Pictures/11.png?raw=true)

oraz sekcję `post`, która wykona się na końcu instalacji - pobierze artefakt z serwera

![cfg](Pictures/12.png?raw=true)

Podczas instalacji nie wybrano wersji minimalnej. Gdyby tak było trzeba by było jeszcze do sekcji `packages` narzędzie `wget` gdyż nie jest ono dołączone w wersji minimalnej.
  
### Infrastructure as a code
* Umieść plik odpowiedzi w repozytorium
* Połącz plik odpowiedzi z ISO instalacyjnym

#### Zakres rozszerzony
* Umieść ISO na serwerze HTTP
* Dodaj krok pipeline'a, wdrażający OS i ISO na wybranym hoście wirtualizacji
