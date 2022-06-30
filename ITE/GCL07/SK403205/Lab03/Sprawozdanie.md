# Szymon Kupka 
## Docker files, kontener jako definicja etapu

Znalezieno repozytorium spełniające wymagania  https://github.com/nodejs/nodejs.org.git oraz sklonowanie go komendą `git clone`
![screen1](./1clone.png)
Następnie zainstalowano wymagane zalezność oraz wykonano kolejno
```bash
$ npm install
```
```bash
$ npm run build
```
```bash
$ npm run test
```
![](./2nmp.png)

![screen1](./3.png)
![screen1](./4.png)
![screen1](./5.png)
pobrano obraz node
![screen1](./6.png)
![screen1](./7.png)
uruchomiono kontener
podłączono do niego TTY celem rozpoczęcia interaktywnej pracy
![screen1](./8.png)
Pobrano wymagane pakiety oraz uruchomiono build oraz testy nie w kontenerze.
![screen1](./9.png)
![screen1](./10-buil.png)
![screen1](./11-testy.png)
![screen1](./12.png)

stworzono pilk dockerfile1 oraz sprawdzono poprawnosc dzialania pliku
![screen1](./13-d1.png)
![screen1](./14.png)
![screen1](./15.png)
![screen1](./15-1.png)
stworzono drugi plik dockerfile bazujacy na pierwszym oraz wykonujący testy
![screen1](./d2.png)
![screen1](./d2w.png)
![screen1](./d2w2.png)
sprawdzenie historii
![screen1](./ps.png)
![screen1](./test2.png)
kontener wdraża się i pracuje poprawnie
![screen1](./u2.png)
![screen1](./u1.png)


