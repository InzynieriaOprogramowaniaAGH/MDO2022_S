# Lab 12

- Wzbogacenie obrazu o 4 repliki

![fota](1.png)

![fota](2.png)

- Rollout status:

![fota](3.png)

- Stworzenie wadliwego obrazu:

nowy obraz docker

`docker-compose.yml`:

![fota](5.png)

![fota](6.png)

po wykonaniu apply na wygenerowany przez kompose deployment:

![fota](7.png)

Kontener zrobił fikołka także nastepnie wykonuje rollback:

![fota](8.png)

Sukces!

![fota](9.png)

- Zwiekszenie ilosci replik:

![fota](10.png)

- Zmniejszenie ilosci do 1

![fota](11.png)

- Oraz do 0

![fota](12.png)

- Stworzenie skryptu sprawdzajacego poprawny deploy:

![fota](13.png)

- Strategy types:

-- recreate - wszystkie pody sa zabijane zanim zostana stworzone nowe

![fota](14.png)

-- RollingUpdate - stare pody sa na biezaco zmieniane na nowe dzieki czemu aplikacje w teori nie maja downtime przy jakichkolwiek zmianach.

![fota](15.png)

-- Canary deployment workload - tworzymy osobne pody z nowszymi wersjami testowymi dzialajacymi obok starszych

![fota](16.png)

- yaml do stworzenia nowego poda z wyzsza wersja

![fota](17.png) 
