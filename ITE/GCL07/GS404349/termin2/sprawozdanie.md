# Sprawozdanie z projektu zaliczeniowego DevOps 2022

Wykonał Grzegorz Surdziel, nr albumu 404349

## Wybór repozytorium

Poszukując odpowiedniego projektu spełniającego wymagania komunikacji przez TCP, oraz na otwartej licencji natrafiłem na (meta-repozytorium)[https://github.com/public-apis/public-apis] (gromadzące otwarte, publiczne API), gdzie odnalazłem (meowfacts)[https://github.com/wh-iterabb-it/meowfacts].
Projekt na licencji MIT (według jego pliku LICENSE) spełnia założenia sprawozdania.
Aplikacja dostarcza serwer odpowiadający na zapytania GET przez HTTP na (domyślnym) porcie 5000. Odpowiedź jest w surowym formacie JSON i zawiera zawsze krótki tekst.

Klonuję repozytorium

![clone.png](screenshots/clone.png)

Instaluję wymagane pakiety

  npm install

Uruchamiam testy, które przechodzą w całości pozytywnie
![tests.png](screenshots/tests.png)
Potwierdzam poprawne działanie w przeglądarce pod adresem localhost:5000. Widoczny jest zwrócony JSON formatowany przez Firefox'a, oraz log w terminalu uruchomionego serwera wskazujący otrzymanie zapytania GET.
![start.png](screenshots/start.png)
Wykonuję również zapytanie przez *curl*
![curl.png](screenshots/curl.png)
