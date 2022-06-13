| Imię i nazwisko | Grupa dziekańska | Termin zajęć | Grupa zajęciowa |
| ----------- | ----------- | ----------- | ----------- |
| Adam Głąb | 03 | 02.06.2022r | 08 |

# Sprawozdanie z ćwiczenia laboratoryjnego nr 12


## Zadanie 1

Wdrożenie z poprzednich zajęć: [deploy.yaml](./yaml/deploy.yaml)

Wzbogacenie o 4 repliki.

![](./screen/z1_1.png)

Zbadanie stanu.

![](./screen/z1_2.png)

## Zadanie 2

Rejestracja nowego obrazu (dodanie zmiennej środowiskowej do Dockerfile):

![](./screen/z2_1.png)

Rejestracja obrazu kończącego się błędem (polecenie wyjścia ze statusem `1`):

![](./screen/z2_2.png)

Upewnienie się, czy obrazy zostały dobrze zbudowane:

![](./screen/z2_3.png)

## Zadanie 3

1. Podwojenie ilości replik

![](./screen/z3_1.png)

2. Zmniejszenie replik do 1

![](./screen/z3_2.png)

3. Zmniejeszenie replik do 0

![](./screen/z3_3.png)

4. Zastosowanie nowej wersji (sprawdzenie poda komendą `kubectl describe pods <identyfikator>`)

![](./screen/z3_4.png)

5. Zastosowanie wersji z błędem

![](./screen/z3_5.png)

6. Przywrócenie poprzednich wersji

![](./screen/z3_6.png)

