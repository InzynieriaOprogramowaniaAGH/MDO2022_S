# SPRAWOZDANIE LABORATORIUM 11

## INSTALACJA KLASTRA KUBERNETES


Pierwszym krokiem było zainstalowanie odpowiednich środowisk.

Instalacja minikube:

![x](./screen_l11/1.png) 


Uruchomienie minikube:
* podczas pierwszego uruchomienia wystąpił błąd, ponieważ użytkownik na dockerze nie był dodany do grupy. 

![x](./screen_l11/x.png)


Poprawne uruchomienie, po naprawie błędu.

![x](./screen_l11/5.png)


Pobranie pakietów polecenia kubectl (oraz sprawdzenie sumy kontrolnej):

![x](./screen_l11/2.png)


Instalacja kubestl:

![x](./screen_l11/4.png)


Działający worker (node) i pody:

![x](./screen_l11/6.png)


Darhboard:

![x](./screen_l11/7.png)


Jeśli chodzi o wymagania sprzętowe to potrzebne tutaj było 20GB miejsca, co jak można się domyślić nie na każdym komputerze będzie realną rzeczą do osiągnięcia. Do minikube potrzebne jest środowisko konteneryzacji, ja użyłam dockera.


## ANALIZA POSIADANEGO KONTENERA

Gotowy Dockerfile zawarty w aplikacji:

![x](./screen_l11/a.png)

Build:

![x](./screen_l11/y.png)


![x](./screen_l11/z.png)


## URUCHOMIENIE OPROGRAMOWANIA

Utworzony plik .yaml

![x](./screen_l11/8.png)

![x](./screen_l11/9.png)

Jednak nie można utworzyć poda, ponieważ obraz jest w Dockerze lokalnym, a nie w k8s.
Rozwiązaniem jest polecenie: 

    eval $(minikube docker-env).

![x](./screen_l11/10.png)

Obrazy w klastrze:

![x](./screen_l11/11.png)

Działanie poprawnego poda widoczne na dashboarcie:

![x](./screen_l11/12.png)


Wyprowadzenie portu na 4200 w celu dotarcia do opcji:

![x](./screen_l11/13.png)


*Na screenach może występować pewnego rodzaju nieścisłości jeśli chodzi o nazwę aplikacji, gdyż początkowo korzystałam z repozytorium: https://github.com/caolan/nodeunit, które jest tylko frameworkiem, dlatego nie nadaje się do samoistnego uruchomienia. Dlatego byłam zmuszona wybrać inną aplikację a kroki powtórzyć, ale nie robiłam już kolejny raz screenów, bo jedyna różnica tak naprawdę to nazwa aplikacji, cała reszta kroków była analogiczna.


## PRZEKUCIE WDROŻENIA MANUALNEGO W PLIK WDROŻENIOWY

Drugi plik .yaml

![x](./screen_l11/b.png)

![x](./screen_l11/14.png)


Działanie widoczne na dashboarcie:

![x](./screen_l11/15.png)



# SPRAWOZDANIE LABORATORIUM 12

## KONWERSJA WDROŻENIA RĘCZNEGO NA WDRŻENIE DEKLARATYWNE YAML

Zmodyfikowano plik pod2.yml z poprzedniego laboratorium, ilośc replik zmieniono na 4. Zmiany wdrożono za pomocą polecenia kubectl rollout.

![x](./screen_l12/1.png)

![x](./screen_l12/2.png)

Zmiany widoczne na dashboarcie:

![x](./screen_l12/3.png)

## ZMIANY W DEPLOYMENCIE

Następnie ponownie zmieniono liczbę replik, tym razem na 9.


![x](./screen_l12/4.png)


![x](./screen_l12/5.png)

Kolejnym testem było zmienienie liczy replik na 1.


![x](./screen_l12/7.png)


![x](./screen_l12/8.png)

I na koniec ustawiono liczbę replik na 0.


![x](./screen_l12/10.png)


![x](./screen_l12/11.png)


## KONTROLA WDROŻENIA

Utworzony został skrypt, który zwraca informacje o błędzie, kiedy czas wdrożenia jest większy niż 60 sekund.

    #!/bin/bash

    if [ $# -ne 1 ]; then
        echo "Please enter an argument!"
        exit 1
    fi

    name=$1

    kubectl apply -f pod2.yml
    timeout 59 /usr/local/bin/minikube kubectl rollout status $name

    if [ $? -eq 0 ]; then
        echo "SUCCESS"
    else
        echo "FAIL"
    fi

![x](./screen_l12/12.png)

## STRATEGIE WDROŻENIA

STRATEGIA RECREATE: wszystkie aktualne instancje są ubijane i następnie wdrażana jest nowa wersja.

    spec:
    replicas:  5
    strategy:
      type: Recreate


STRATEGIA ROLLINGUPDATE: pody są stopniowo wdrażane - tworzony jest dodatkowy zestaw replik z nową wersją, potem zmiejszana jest liczba replik starej wersji aplikacj, a nowej zwiększana aż osiągnięta zostanie prawidłowa liczba. Parametr maxSurge odpowiada za ilość podów możliwą do dodania w danym czasie, a maxUnavailable za ilość podów niedostęonych we wdrożeniu.

    spec:
      replicas:  5
      strategy:
        type: RollingUpdate
      rollingUpdate:
        maxSurge: 2
        maxUnavailable: 0
