# Sprawozdanie Lab12 Wiktoria Dęga Inżynieria Obliczeniowa 
## Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML
---
W wyniku wykonania zadań z lab11 stworzony został przeze mnie plik YAML (`lab11.yaml`).
![23](./23.png)

Najpierw wzbogaciłam swój obraz o 4 repliki. Następnie poprzez komendę `kubectl apply -f lab11.yaml` rozpoczęłam wdrożenie.
![1](./1.png)
![1a](./1a.png)

Sprawdzenie w Dashboardzie:
![2](./2.png)

Następnie użyłam polecenia `kubectl rollout status deployment nginx-deployment`, w celu sprawdzenia stanu pliku.
![3](./3.png)

## Przygotowanie nowego obrazu

Użytą przeze mnie wersją obrazu nginx była wersja `nginx:1.14.2`
![4](./4.png)

## Zmiany w deploymencie
W tym kroku przystąpiłam do aktualizacji pliku YAML z wdrożeniem. 
 * zwiększenie replik (powyżej)
 * zmniejszenie liczby replik do 1

Plik ze zmniejszoną liczbą replik i jego wdrożenie (niestety nie zrobiłam screena z użycia komendy `kubectl apply -f lab11.yaml`):
![5](./5.png)
![6](./6.png)
* zmniejszenie liczby replik do 0

Plik ze zmniejszoną liczbą replik i jego wdrożenie:
![7](./7.png)
![8](./8.png)
* zastosowanie nowej wersji obrazu (powyżej - wersja latest)
* zastosowanie starszej wersji obrazu (nginx:1.14.2)

Zmieniłam wersję obrazu na nginx:1.14.2
![9](./9.png)
![10](./10.png)

Następnie sprawdziłam historię wdrożeń za pomocą polecenia `kubectl rollout history deployment/nginx-deployment` oraz przywróciłam wersję obrazu nginx:latest używając polecenia `kubectl rollout undo deployment/nginx-deployment`. 
![11](./11.png)
![12](./12.png)

## Kontrola wdrożenia
W kolejnym etapie napisałam skrypt `script.sh`, w którym weryfikowałam, czy wdrożenie zaszło w czasie 60 sekund. Sprawdzane jest to przy użyciu `kubectl rollout status deployment/nginx-deployment` i `sleep 60`. Zastosowane zostały instrukcje warunkowe if, których wykonanie się (wdrożenie w ciągu 60 sekund) powoduje wypisanie odpowiednich komunikatów `success`/ `not success`.
![13](./13.png)
Działanie skryptu wygląda następująco:
![14](./14.png)

## Strategie wdrożenia
W tym kroku przystąpiłam do przygotowania wersji wdrożeń, które stosowały następujące strategie:
* Recreate

W pliku `lab11.yaml` zmieniłam strategię na `Recreate`.
![15](./15.png)

Używając polecenia `kubectl describe deployment nginx-deployment` upewniłam się czy strategia zmieniła się. 
![16](./16.png)

Sprawdzenie w dashboardzie:
![17](./17.png)

* RollingUpdate

W pliku `lab11.yaml` zmieniłam strategię na `RollingUpdate`.
![18](./18.png)

Używając polecenia `kubectl describe deployment nginx-deployment` upewniłam się czy strategia zmieniła się. 
![19](./19.png)

Sprawdzenie w dashboardzie:
![20](./20.png)

* Canary Deployment workload

W pliku `lab11.yaml` zmodyfikowałam nazwę i podałam wersję.
![21](./21.png)

Sprawdzenie w dashboardzie, na którym widać istnienie nowego deploymentu (`nginx-deployment2`)
![22](./22.png)

## Różnice
* Recreate - strategia, w której ma miejsce zakończenie działania podów ze starą wersją zanim nastąpi zastąpienie nowszą, zapewniona zostaje ciągłość co do aktualizacji stanu aplikacji, znaczenie ma tu jednak czas przestoju wdrożenia

* Rolling Update - charakterystyczne jest stopniowe aktualizowanie podów ze starą wersją

* Canary Deployment workload - charakterystyczne podejście progresywne, gdzie jedna wersja aplikacji obsługuje większość użytkowników, natomiast nowsza wersja obsługuje użytkowników testowych (nowe oprogramowanie wdrażane obok starszych wersji)
