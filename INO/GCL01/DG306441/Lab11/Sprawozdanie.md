## Sprawozdanie Lab11
##### Autor: Dawid Gabryś

1. W ramach zajęć należało zainstalować Kubernetesa.

Na początku pobrałem pliki binarne ```minikube```:

![sc1](Screenshot_1.png)

Następnie zainstalowałem ```minikube'a```:

![sc2](Screenshot_2.png)

I uruchomiłem. Niestety wystąpił błąd. Aby go naprawić musiałem dodać użytkownika do grupy ```docker```:

![sc3](Screenshot_3.png)

![sc4](Screenshot_4.png)

I jak widać na powyższym zrzucie ekranu ponownie nastąpił błąd. Widząc to i przy okazji upewniając się ostatecznie czy spełnione są pozostałe wymagania do uruchomienia ```minikube``` zwiększyłem liczbę CPU:

![sc5](Screenshot_5.png)

Po tym wszystkim uruchomienie przeszło bez problemów:

![sc6](Screenshot_6.png)

![sc7](Screenshot_7.png)

Następnie użyto poniższego polecenia by uzyskać dostęp do klastra (wcześniej musiałem zainstalować ```kubectl```):

![sc8](Screenshot_8.png)

I uruchomiono dashboard ```minikube'a```:

![sc9](Screenshot_9.png)

![sc10](Screenshot_10.png)

Sprawdzono również działający kontener:

![sc11](Screenshot_11.png)

W celach testowych utworzono przykładowe wdrożenie:

![sc14](Screenshot_14.png)

![sc12](Screenshot_12.png)

![sc13](Screenshot_13.png)

Potem pobrano gotowy obraz ```nginx:stable```:

![sc15](Screenshot_15.png)

I uruchomiono kontener:

![sc16](Screenshot_16.png)

Uruchomiony kontener został ubrany w ```pod```. Sprawdzono, że działa na dashboardzie:

![sc17](Screenshot_17.png)

I w terminalu:

![sc18](Screenshot_18.png)

Następnie wprowadzono port celem dotarcia do eksponowanej funckjonalności:

![sc19](Screenshot_19.png)

Oraz przedstawiono efekt:

![sc20](Screenshot_20.png)

Wdrożenie przedstawiono w postaci pliku ```.yaml```:

![sc22](Screenshot_22.png)

![sc21](Screenshot_21.png)

![sc23](Screenshot_23.png)
