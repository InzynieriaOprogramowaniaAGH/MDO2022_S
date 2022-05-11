# Sprawozdanie z laboratorium 3 Jan Święs 402998

Wybór oprogramowania na zajęcia

    1.Znalazłem repozytorium z programem, który dysponował otwartą licencją
    i był umieszczony wraz ze swoimi narzędziami makefile. Repozytorium to zawierało również testy, które mogłem uruchomić i formułowały raport końcowy

![Wybrane repozytorium](./6.png)

Przeprowadzenie buildu w kontenerze

    2.Pobrałem obraz node'a
![Pobranie obrazu node](./1.png)

    3.Uruchomiłem kontener i podłączyłem do niego TTY
![Uruchomienie kontenera](./2.png)

    4.Sklonowałem repozytorium wybranego przeze mnie wczesniej programu
![Sklonowanie repozytorium](./3.png)

    5. Uruchom build poleceniem npm i (install)
![Uruchomienie buildu](./4.png)

    6.Uruchomiłem testy
![Uruchomienie testów](./7.png)

    7.Stworzyłem dwa pliki Dockerfile automatyzujące kroki powyżej:

    a)Kontener pierwszy przeprowadzający wszystkie kroki do momentu builda
![Kod dockerfile](./8.png)
![Uruchomienie dockerfile](./9.png)
![Uruchomienie dockerfile1](./10.png)

    b)Kontener drugi bazujący na pierwszym i wykonujący testy

![Uruchomienie dockerfile1](./11.png)
![Uruchomienie dockerfile1](./12.png)

    8. Sprawdzenie poprawności

![Test1](./17.png)

![Test1](./15.png)

![Test1](./19.png)

![Test1](./16.png)

# Pytania i odpowiedzi

    1. Co pracuje w kontenerze ?
    
    W kontenerze pracuje program w odpowienio przygotowanym środowisku, który jest odizolowany od zewnętrznego świata (systemu)

    2.