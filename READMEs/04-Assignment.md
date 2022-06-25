# Zajęcia 04
### 2022-03-28 -- 2022-04-01
---
# Dodatkowa terminologia w konteneryzacji, instancja Jenkins

## Format sprawozdania
- Wykonaj opisane niżej kroki i dokumentuj ich wykonanie
- Na dokumentację składają się następujące elementy:
  - plik tekstowy ze sprawozdaniem, zawierający opisy z każdego z punktów zadania
  - zrzuty ekranu przedstawiające wykonane kroki (oddzielny zrzut ekranu dla każdego kroku)
  - listing historii poleceń (cmd/bash/PowerShell)
- Sprawozdanie z zadania powinno umożliwiać **odtworzenie wykonanych kroków** z wykorzystaniem opisu, poleceń i zrzutów. Oznacza to, że sprawozdanie powinno zawierać opis czynności w odpowiedzi na (także zawarte) kroki z zadania. Przeczytanie dokumentu powinno umożliwiać zapoznanie się z procesem i jego celem bez konieczności otwierania treści zadania.
- Omawiane polecenia dostępne jako clear text w treści, stosowane pliki wejściowe dołączone do sprawozdania jako oddzielne

- Sprawozdanie proszę umieścić w następującej ścieżce: ```<kierunek>/<grupa>/<inicjały><numerIndeksu>/Lab04/Sprawozdanie.md```, w formacie Markdown
- To ostatnie zadanie wystawiane wyłącznie jako pull request. Następnym będzie Assignment @ Teams

## Zadania do wykonania
### Zachowywanie stanu
* Przygotuj woluminy wejściowy i wyjściowy, o dowolnych nazwach, i podłącz je do kontenera bazowego, z którego rozpoczynano poprzednio pracę
* Uruchom kontener, zainstaluj niezbędne wymagania wstępne (jeżeli istnieją), ale *bez gita*
* Sklonuj repozytorium na wolumin wejściowy
* Uruchom build w kontenerze
* Zapisz powstałe/zbudowane pliki na woluminie wyjściowym

### Eksponowanie portu
* Uruchom wewnątrz kontenera serwer iperf (iperf3)
* Połącz się z nim z drugiego kontenera, zbadaj ruch
* Połącz się spoza kontenera (z hosta i spoza hosta)
* Przedstaw przepustowość komunikacji lub problem z jej zmierzeniem (wyciągnij log z kontenera)

### Instancja Jenkins
* Zapoznaj się z dokumentacją  https://www.jenkins.io/doc/book/installing/docker/
* Przeprowadź instalację skonteneryzowanej instancji Jenkinsa z pomocnikiem DIND
* Zainicjalizuj instację, wykaż działające kontenery, pokaż ekran logowania

## Zakres rozszerzony
### Komunikacja
* Stwórz kontener czysto do budowania (bez narzędzi do klonowania/kopiowania, bez sklonowanego repozytorium)
* Stwórz na jego bazie kontener przejściowy, który tylko buduje, wyciągnij z niego pliki po skutecznym buildzie

### Usługi w rozumieniu systemu, kontenera i klastra
* Zestaw w kontenerze ubuntu/fedora usługę SSHD, połącz się z nią, opisz zalety i wady (przypadki użycia...?) komunikacji z kontenerem z wykorzystaniem SSH

### Jenkins: zależności
* Co jest potrzebne by w naszym Jenkinsie uruchomić Dockerfile dla buildera?
* Co jest potrzebne w Jenkinsie by uruchomić Docker Compose?
