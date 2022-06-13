# Sprawozdanie
### 13.06.2022
---
## Wdrażanie na zarządzalne kontenery: Kubernetes (2)

W poprzednim sprawozdaniu stworzyłem plik YAML z obrazem Nginx z dwiema replikami. Pierwszym krokiem tych zajęć jest zwiększenie tej liczny do 4. Wykonuje to poprzez zmiane w pliku YAML liczby replik z 2 na 4. W efekcie mamy działające 4 pody.

Plik YAML:

![img](./s8.png)

![img](./s1.png)

Badam stan za pomocą `kubectl rollout status`:

![img](./s2.png)

Jako obraz alternatywny wybrałem starszą wersję Nginx'a:

![img](./s3.png)

-   zmniejszenie liczby replik do 1

![img](./s4.png)

![img](./s5.png)

-   zmniejszenie liczby replik do 0

![img](./s6.png)

![img](./s7.png)

-   utworzenie 4 replik

![img](./s8.png)

![img](./s9.png)

-   zastosowanie nowej wersji obrazu.

Wyżej była zastosowana wersja obrazu `latest` czyli najnowsza

-   zastosowanie starszej wersji obrazu.

Została zastosowana podczas prezentacji 4 replik

Za pomocą polecenia `kubectl rollout undo` przywracam nowszą wersję `latest`

![img](./s10.png)

-   Napisz skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund).

Stworzyłem prosty skrypt sprawdzający czy wdrożenie "zdążyło" się wdrożyć w określonym czasie

![img](./s11.png)

Odpalam skrypt i czekam 60 sekund

![img](./s12.png)

Widzimy że wdrożenie "zdążyło się wdrożyć" :)

Następnym krokiem było przygotowanie wdrożeń korzystając z różnych strategii

**Recreate** strategia ta charakteryzuje się zakończeniem działania instancji będących nieaktualnymi a następnie uruchomieniem ich ponownie w nowszej wersji. Wdrożenie to zapewnia nam ciągłość odnawiania stanu aplikacji, jednak czas przestoju wdrożenia jest sumą czasu zamknięcia oraz uruchomienia aplikacji.

![img](./s13.png)

![img](./s14.png)

![img](./s15.png)

**Rolling Update** wdrażanie to prowadzi do stopniowej aktualizacji, ponadto tworzony jest dodatkowy zestaw podów z aktualną, nową wersją aplikacji. Kolejno pody ze starszą wersją aplikacji jest zmniejszana, a nowa wersja zwiększana. Proces ten jest kontynuuowany aż do osiągnięcia nominalnej liczby replik.

![img](./s16.png)

![img](./s17.png)

![img](./s18.png)

**Canary deployment workload** to wdrożenie opiera się na wdrażaniu nowego oprogramowania obok starszych stabilnych wersji, takie wdrożenie wykonujemy przy użyciu dwóch plików yamlowych z różnymi labelami. Postępujące z czasem wdrożenie pozwala nam na zwiększanie podów z nowym wdrożeniem i rezygnacje ze starego.

![img](./s19.png)

![img](./s20.png)