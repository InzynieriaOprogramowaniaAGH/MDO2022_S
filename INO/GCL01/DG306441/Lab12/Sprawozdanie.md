## Sprawozdanie Lab12
##### Autor: Dawid Gabryś

1. Kontynuacja zajęć z Kubernetesa. Wdrożenie YAML.

Na początku zmodyfikowałem plik ```.yaml``` ustawiając liczbę replik z 1 na 4:

![sc1](Screenshot_1.png)

Następnie rozpocząłem wdrożenie za pomocą polecenia ```kubectl apply```:

![sc2](Screenshot_2.png)

Sprawdziłem działanie w dashboardzie:

![sc3](Screenshot_3.png)

Oraz zbadałem stan za pomocą ```kubectl rollout status```:

![sc4](Screenshot_4.png)

2. Następnie przygotowałem nowy obraz. W tym celu pobrałem starszą wersję obrazu ```nginx```:

![sc5](Screenshot_5.png)

3. Potem przeprowadziłem zmiany w deploymencie. W tym celu aktualizowałem plik ```.yaml``` i ponownie wdrożyłem:

Dla liczby replik 1:

![sc6](Screenshot_6.png)

![sc7](Screenshot_7.png)

![sc8](Screenshot_8.png)

Dla liczby replik 0:

![sc9](Screenshot_9.png)

![sc10](Screenshot_10.png)

Dla starszej wersji ```nginx```:

![sc11](Screenshot_11.png)

![sc12](Screenshot_12.png)

Następnie przywróciłem poprzednią wersję deploymentu:

![sc13](Screenshot_13.png)

Sprawdziłem czy przywróciło:

![sc14](Screenshot_14.png)

4. Potem napisałem skrypt, weryfikujący, czy wdrożenie zdążyło się wdrożyć. Jeśli tak, to sukces, jeśli nie, to przywracamy starą wersję:

![sc15](Screenshot_15.png)

![sc16](Screenshot_16.png)

5. Testowanie strategii wdrożenia.

Dla strategii ```Recreate```:

![sc18](Screenshot_18.png)

![sc17](Screenshot_17.png)

![sc19](Screenshot_19.png)

W tej strategii wszystkie istniejące pody są niszczone, po czym następuje ponowne utworzenie w nowszej wersji.

Dla strategii ```Rolling Update```:

![sc20](Screenshot_20.png)

![sc21](Screenshot_21.png)

![sc22](Screenshot_22.png)

W tej strategii można prowadzić aktualizację w ramach wdrożenia bez przew w jego działaniu dzięki krokowemu aktualizowaniu kolejnych podów. Można dodać opcjonalnie dwa parametry: maxUnavailable - maksymalna liczba podów które mogą być niedostępne podczas procesu aktualizacji; maxSurge - maksymalna liczba podów, które mogą zostać utworzone powyżej pożądanej liczby replik. 

Dla strategii ```Canary Deployment workload```:

![sc24](Screenshot_24.png)

![sc23](Screenshot_23.png)

W tej strategii wdrażana jest nowa wersja obok istniejącej, stabilnej. Stosuje się ją w celu zmniejszenia ryzyka związanego z wydaniem nowej wersji.