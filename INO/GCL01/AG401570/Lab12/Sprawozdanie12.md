Anna Godek

Inżynieria Obliczeniowa

GCL01

# Metodyki DevOps

## Laboratorium 12
## Wdrażanie na zarządzalne kontenery: Kubernetes (2)
**Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML**
Wzbogacono obraz o 4 repliki.

![1](1.png)


Rozpoczęto wdrożenie za pomocą `kubectl apply` i zbadano stan za pomocą `kubectl rollout status`.

![2](2.png) 
![3](3.png)
![4](4.png)


**Przygotowanie nowego obrazu**
Pobrano inną, starszą wersję obrazu `nginx`.

![5](5.png)


**Zmiany w deploymencie**
Aktualizowano plik `YAML` z wdrożeniem i przeprowadzano je ponownie po zastosowaniu zmian.

Zmniejszenie liczby replik do 1. 

![6](6.png)
![7](7.png)
![8](8.png)


Zmniejszenie liczby replik do 0.

![9](9.png)
![10](10.png)


Zastosowano starszą wersję.

![11](11.png)
![12](12.png)


Przywrócono poprzednie wersje wdrożeń za pomocą poleceń `kubectl rollout history` i `kubectl rollout undo`.

![13](13.png)
![14](14.png)


**Kontrola wdrożenia**
Napisano skrypt weryfikujący, czy wdrożenie „zdążyło” się wdrożyć (60 sekund).
![15](15.png)
![16](16.png)


**Strategie wdrożenia**
Recreate kończy dziąłanie nieaktualnych instancji i uruchamia je w nowszej wersji, zapewnia ciągłość odnawiania stanu aplikacji.

![17](17.png)
![18](18.png)
![19](19.png)
Pody są niszczone.


Rolling Update umożliwia stopniową aktualizację. Liczba podów ze starszą wersją jest zmniejsza a z nową wersją zwiększana. Istotnymi argumetami są:
maxSurge – liczba podów, które możemy dodać
maxUnvailable – liczba podów nieaktywnych

![20](20.png)
![21](21.png)
![22](22.png)


Canary deployment workload – opiera się na wdrożeniu nowego oprogramowania obok starszych wersji, które są stabilne. Wraz z nowym wdrożeniem umożliwia zwiększenie podów i rezygnację ze starych.

![23](23.png)
![24](24.png)
