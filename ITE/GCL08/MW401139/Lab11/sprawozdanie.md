## Michał Wojdyła 401139

<br/>

# Instalacja klastra Kubernetes

- Instalacja oraz uruchomienie minikube:

![1](./images/1.png)
![2](./images/2.png)

- Instalacja oraz setup kubectl:

![3](./images/3.png)
![4](./images/4.png)

- Uruchomienie dashboard'a:

![5](./images/5.png)
![6](./images/6.png)

<br/>

# Analiza posiadanego kontenera

- Zbudowanie obrazu z pliku dockerfile:

### Zbudowany obraz przesłałem na dockerhuba (push)

<br/>

![7](./images/7.png)

- Pokazanie działania aplikacji jako kontener:

![11](./images/11.png)

<br/>

# Uruchomienie oprogramowania

- Uruchomienie kontenera na stosie k8s oraz pokazanie działania:

![8](./images/8.png)
![9](./images/9.png)

- Wyprowadzenie portu celem dotarcia do eksponowanej funkcjonalności:

![10](./images/10.png)

- Działanie aplikacji

![12](./images/12.png)

<br/>

# Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)

### Plik yaml został zawarty w sprawozdaniu

![13](./images/13.png)
![14](./images/14.png)

<br/>
<br/>

## Część 2

# Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

- Upewnij się, że posiadasz wdrożenie z poprzednich zajęć zapisane jako plik -Wzbogać swój obraz o 4 repliki -Rozpocznij wdrożenie za pomocą kubectl apply -Zbadaj stan za pomocą kubectl rollout status:

![15](./images/15.png)

- Zarejestrowanie nowej wersji obrazu:

![16](./images/16.png)
![17](./images/17.png)

- Przygotowanie nowej wersji obrazu z błędem:

### Usunąłem instalacje dependencji z dockerfile, plik zamieściłem na repozytorium.

![18](./images/18.png)

- Zarejestrowanie nowej wersji obrazu z błędem:

![19](./images/19.png)

<br/>

# Zmiany w deploymencie

- Zwiększenie liczby replik do 6:

![20](./images/20.png)
![21](./images/21.png)

- Zmniejszenie liczby replik do 1:

![22](./images/22.png)
![23](./images/23.png)

- Zmniejszenie liczby replik do 0:

![24](./images/24.png)
![25](./images/25.png)

- Zastosowanie nowej wersji obrazu:

![26](./images/26.png)
![27](./images/27.png)

- Zastosowanie wersji obrazu z errorem:

![28](./images/28.png)
![29](./images/29.png)

- Przywrócenie poprzedniej wersji wdrożeń:

![30](./images/30.png)

<br/>

# Kontrola wdrozenia

- Skryt weryfikujący, czy wdrozenie zdązyło się wdrozyć w 60 sekund:

![31](./images/31.png)

### Skrypt zamieściłem na repozytorium.

![32](./images/32.png)

<br/>

# Strategie wdrozenia

### Pliki yaml zamieściłem w sprawozdaniu

- Recreate:

![33](./images/33.png)

### W tej strategii zabijane są stare wersje aplikacji po czym następuje wdrożenie nowych.

- RollingUpdate:

![34](./images/34.png)

### W tej strategii zatrzymywane jest działanie wszystkich podów i następnie ponowne ich uruchomienie.

`maxSurge` - ilość podów które mogą zostać dodane
`maxUnavailable` - ilość podów które mogą być niedostępne podczas wdrazania

- Canary:

![35](./images/35.png)

### W tej strategii następuje wdrozenie nowych wersji aplikacji obok innych stablilnych wersji.
