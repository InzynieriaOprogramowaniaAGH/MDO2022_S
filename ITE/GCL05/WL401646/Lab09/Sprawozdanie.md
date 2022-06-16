**Cel ćwiczenia**

Celem laboratorium było przeprowadzenie instalacji Fedory w sposób nadzorowany oraz nienadzorowany wraz z instalacją artefaktu przygotowanego przez Jenkinsa.

Wszystkie pliki anaconda-ks.cfg tak jak i logi Jenkinsa oraz Jenkinsfile znajdują się w repozytorium wraz z tym sprawozdaniem.

**Instalacja Fedory**

Fedora została zainstalowana przez obraz netinstall wraz softwarem dla serwera. Utworzony został użytkownik *client* wraz uprawnieniami administratora.

![Zrzut ekranu 2022-06-04 013225.png](Screens%2FZrzut%20ekranu%202022-06-04%20013225.png)
![Zrzut ekranu 2022-06-04 013203.png](Screens%2FZrzut%20ekranu%202022-06-04%20013203.png)

Na systemie zainstalowano usługę httpd

![Zrzut ekranu 2022-06-04 151317.png](Screens%2FZrzut%20ekranu%202022-06-04%20151317.png)

Usługa została uruchomiona
> systemctl enable httpd --now

![Zrzut ekranu 2022-06-04 151423.png](Screens%2FZrzut%20ekranu%202022-06-04%20151423.png)

Http zostało dodane do firewalla aby umożliwić dostęp

> firewall-cmd --permanent --add-service=http && firewall-cmd --reload

![Zrzut ekranu 2022-06-04 223041.png](Screens%2FZrzut%20ekranu%202022-06-04%20223041.png)

Następnie utworzono kolejną maszynę wirtualną z Fedorą, bliźniaczą do poprzedniej na której pobrano artefakt z programem, który znajdował się na utworzonym serwerze http. Następnie rozpakowano paczkę i zainstalowano zależności 

> wget http://192.168.1.36/artifacts/nodejs.org-1.0.0.tgz
> 
> tar -xzf nodejs.org-1.0.0.tgz 
> 
> cd package
> 
> npm install

![Zrzut ekranu 2022-06-04 221403.png](Screens%2FZrzut%20ekranu%202022-06-04%20221403.png)

Następnie uruchomiono aplikację 
> npm start

![Zrzut ekranu 2022-06-04 221422.png](Screens%2FZrzut%20ekranu%202022-06-04%20221422.png)

**Modyfikacja pipeline'u w celu automatycznego wysyłania plików na serwer**

Następnym krokiem była modyfikacja pipeline'u, aby wysyłał automatycznie artefakt na serwer utworzony wcześniej.

W tym celu utworzono klucze SSH z czego publiczny został wysłany na serwer. Na Jenkinsie dodano plugin ssh-agent, który pozwolił na dodanie prywatnego klucza SSH jako Credential oraz komunikację SSH ustanowioną w pipelinie Jenkinsa. 

W Jenkinsfile zmodyfikowany został krok Publish, który poprzez wykorzystanie pluginu ssh-agent mógł ustanowić połączenie SSH z serwerem. Dwie pierwsze linie są konieczne, aby wstawić klucz prywatny w odpowiednie miejsce oraz ustanowić jego prawa, jak również dodać serwer do pliku known_hosts. Bez tego weryfikacja SSH nie powiodłaby się. Kolejne linie tworzą folder na artefakt oraz kopiują artefakt przygotowany w kroku Build na serwer.

![Zrzut ekranu 2022-06-04 192005.png](Screens%2FZrzut%20ekranu%202022-06-04%20192005.png)

Wynik działania pipeline

![Zrzut ekranu 2022-06-04 191918.png](Screens%2FZrzut%20ekranu%202022-06-04%20191918.png)

Artefakt wysłany na serwer 

![Zrzut ekranu 2022-06-04 192020.png](Screens%2FZrzut%20ekranu%202022-06-04%20192020.png)

**Instalacja nienadzorowana Fedory**

W celu instalacji nienadzorowanej wyciągnięto plik anaconda-ks.cfg z folderu /root oraz zmodyfikowano go dodając linki do repozytorium, zmieniając tryb instalacji na tekstowy oraz dodając do instalowanych pakietów nodejs. 

Dodatkowo dopisana została sekcja %post, która odpowiadała za pobranie artefaktu z serwera http, a następnie jego rozpakowanie oraz instalacje dependencji, analogicznie jak to było dla instalacji nadzorowanej.

![Zrzut ekranu 2022-06-04 231710.png](Screens%2FZrzut%20ekranu%202022-06-04%20231710.png)

Następnie plik anaconda-ks.cfg udostępniony został na serwerze http, a instalacja została przeprowadzona przez podanie tego pliku instalatorowi.

![Zrzut ekranu 2022-06-04 194203.png](Screens%2FZrzut%20ekranu%202022-06-04%20194203.png)

Zakończona automatyczna instalacja Fedory

![Zrzut ekranu 2022-06-04 194214.png](Screens%2FZrzut%20ekranu%202022-06-04%20194214.png)

W celu sprawdzenia poprawności instalacji, po zainstalowaniu systemu zalogowano się na konto *client*, a następnie uruchomiono aplikację.

![Zrzut ekranu 2022-06-04 194945.png](Screens%2FZrzut%20ekranu%202022-06-04%20194945.png)
