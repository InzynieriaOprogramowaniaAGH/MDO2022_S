* Uruchomienie kontenera node w trybie interaktywnym 

> sudo docker run -it node

![Zrzut ekranu 2022-03-31 175422.png](Zrzut%20ekranu%202022-03-31%20175422.png)

* Sklonowanie repozytorium

![Zrzut ekranu 2022-03-31 175515.png](Zrzut%20ekranu%202022-03-31%20175515.png)

* Uruchomienie buildu

> npm run build

![Zrzut ekranu 2022-03-31 175548.png](Zrzut%20ekranu%202022-03-31%20175548.png)

* Uruchomienie testów

> npm run test

![Zrzut ekranu 2022-03-31 175625.png](Zrzut%20ekranu%202022-03-31%20175625.png)

* Utworzenie pliku dockerBuilder (załączony w plikach), który przeprowadza budowanie programu

>sudo docker build . -f dockerBuilder -t squirrelly 

![Zrzut ekranu 2022-03-31 180821.png](Zrzut%20ekranu%202022-03-31%20180821.png)

* Utworzenie pliku dockerTester (załączony w plikach), który uruchamiał testy na bazie obrazu utworzonego za pomocą dockerBuilder

> sudo docker build . -f dockerTester -t squirrelly_tester

![Zrzut ekranu 2022-03-31 180923.png](Zrzut%20ekranu%202022-03-31%20180923.png)
![Zrzut ekranu 2022-03-31 180949.png](Zrzut%20ekranu%202022-03-31%20180949.png)

* Utworzenie pliku dockerRunner (załączony w plikach), który służył do wykonania komendy nmp start na podstawie wcześniejszego obrazu. Następnie uruchomiono kontener.

> sudo docker build . -f dockerRunner -t squirrelly_runner

> sudo docker run -d squirrelly_runner

![Zrzut ekranu 2022-04-01 160010.png](Zrzut%20ekranu%202022-04-01%20160010.png)

![Zrzut ekranu 2022-04-01 162103.png](Zrzut%20ekranu%202022-04-01%20162103.png)
