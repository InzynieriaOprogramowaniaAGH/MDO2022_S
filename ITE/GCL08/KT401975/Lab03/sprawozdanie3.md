Kewin Tarnowski,
Informatyka Techniczna,
Gr. 8, nr albumu: 401975


Metodyki DevOps
Lab 3


Przebieg ćwiczenia:

## 1. Znalezienie repozytorium

- Wybrano program oparty na .Net Core 3.1 z publicznego repozytorium:

https://github.com/barisates/dotnet-core-xunit-example


## 2. Kontener

- Pobrano obraz .Net Core dla kontenera oraz go uruchomiono:

![screen1](im3/Picture1.png)


- Ściągnięto repozytorium i przetestowano budowanie oraz testowanie aplikacji na kontenerze:

![screen2](im3/Picture2.png)


- Stworzono plik dockerfile dla pierwszego kontenera, ściągający repozytorium oraz budujący projekt:

![screen3](im3/Picture3.png)


- Działanie:

![screen4](im3/Picture4.png)


- Stworzono plik dockerfile2 bazujący na pierwszym kontenerze i wykonujący testy:

![screen5](im3/Picture5.png)


- Działanie:

![screen6](im3/Picture6.png)