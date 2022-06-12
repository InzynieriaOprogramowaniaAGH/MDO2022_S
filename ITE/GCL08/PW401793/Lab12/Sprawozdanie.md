# Lab 11 - Paweł Waresiak

## Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

Zdefiniowanie 4 replik w deploymencie oraz ustawienie node affinity na node nr 1 (tam mam obraz)

![](./screenshots/Screenshot_1.png)

Sprawdzenie statusu deploymentu oraz podów

![](./screenshots/Screenshot_2.png)

## Nowe wersje obrazu
Nowa wersja, dodałem tylko zmienną env w Dockerfile

![](./screenshots/Screenshot_3.png)

Wersja wadliwa, zwraca 1 zaraz po odpaleniu

![](./screenshots/Screenshot_4.png)

Sprawdzenie czy obrazy się utworzyły

![](./screenshots/Screenshot_5.png)

## Zmiany w deploymencie
1. Zwiększenie replik

![](./screenshots/Screenshot_6.png)
![](./screenshots/Screenshot_7.png)

2. Zmniejszenie replik do 1

![](./screenshots/Screenshot_8.png)
![](./screenshots/Screenshot_9.png)

3. Zmniejszenie replik to 0

![](./screenshots/Screenshot_10.png)

4. Zastosowanie nowej wersji obrazu

![](./screenshots/Screenshot_11.png)
![](./screenshots/Screenshot_12.png)
![](./screenshots/Screenshot_13.png)

5. Zastosowanie starszej wersji obrazu (tutaj użyłem tej wadliwej)

![](./screenshots/Screenshot_14.png)
![](./screenshots/Screenshot_15.png)

6. Przywracanie wersji

![](./screenshots/Screenshot_16.png)
![](./screenshots/Screenshot_17.png)

## Kontrola wdrożenia

![](./screenshots/Screenshot_20.png)
![](./screenshots/Screenshot_19.png)
![](./screenshots/Screenshot_18.png)

## Strategie wdrożenia
Recreate

![](./screenshots/Screenshot_22.png)

Rolling update

![](./screenshots/Screenshot_21.png)

### Różnice
Recreate -> Wszystkie pody są usuwane jednocześnie oraz jednocześnie wstają.\
Rolling update -> Pody są usuwane pojedynczo lub w zdeklarowanych grupach, przez co użytkownik ma cały czas dostęp do usług.\
Canary deployment -> Tworzony jest nowy deployment z podami o zmienionych labelach. Gdy deployment się powiedzie, wtedy zmieniany jest tylko label selector w serwisie i w ten sposób traffic jest routowany na nowe pody praktycznie bez żadnego downtime'u.

