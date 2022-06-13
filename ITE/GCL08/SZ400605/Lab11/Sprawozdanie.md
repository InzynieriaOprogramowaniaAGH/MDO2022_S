# Szymon Piotr Zych 400605 Sprawozdanie_Lab011

# Instalacja klastra Kubernetes

## Zaopatrz się w implementację stosu k8s: minikube

![1.0](./1.0.png)

![1.1](./1.1.png)

## Zaopatrz się w polecenie kubectl

![1.2](./1.2.png)

## Uruchom Kubernetes, pokaż działający kontener/worker

![1.3](./1.3.png)

## Uruchom Dashboard, otwórz w przeglądarce, przedstaw łączność

![1.4](./1.4.png)

![1.5](./1.5.png)

# Analiza posiadanego kontenera

Aplikacja, którą wybrałem nie wyprowadzała andych portów dlatego zmieniłem projekt na potrzeby tego zadania.

Stowrzyłem dockerfile który robił obraz.

```
FROM node:14.16.1-buster

RUN apt-get update
RUN apt-get install -y --no-install-recommends git nano

RUN git clone https://github.com/BuiDuyThanh/node-chat-app
WORKDIR ./node-chat-app
RUN npm install
EXPOSE 3000
ENTRYPOINT npm run start
```

![2.0](./2.0.png)

Następnie powstały obraz wrzuciłem na dockerhuba

![2.1](./2.1.png)

![2.2](./2.2.png)

## Wykaż, że wybrana aplikacja pracuje jako kontener

![2.3](./2.3.png)

# Uruchamianie oprogramowania

## Uruchom kontener na stosie k8s

![3.0](./3.0.png)

## Przedstaw że pod działa (via Dashboard oraz kubectl)

![3.0.1](./3.0.1.png)

![3.1](./3.1.png)

![3.2](./3.2.png)

![3.3](./3.3.png)

## Wyprowadź port celem dotarcia do eksponowanej funkcjonalności

![3.4](./3.4.png)

## Przedstaw komunikację z eskponowaną funkcjonalnością

![3.5](./3.5.png)

![3.6](./3.6.png)

## Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-chat-deployment
  labels:
    app: devops-chat
spec:
  replicas: 4
  selector:
    matchLabels:
      app: devops-chat
  template:
    metadata:
      labels:
        app: devops-chat
    spec:
      containers:
        - name: devops-chat
          image: luxikhs/chat
          ports:
            - containerPort: 3000
```

![4.0](./4.0.png)

![4.1](./4.1.png)

# Część 2

## Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

-Upewnij się, że posiadasz wdrożenie z poprzednich zajęć zapisane jako plik
-Wzbogać swój obraz o 4 repliki
-Rozpocznij wdrożenie za pomocą kubectl apply
-Zbadaj stan za pomocą kubectl rollout status

![5.0](./Lab12/5.0.png)

## Przygotowanie nowego obrazu

![6.0](./Lab12/6.1.png)

-Przygotuj wersję obrazu, którego uruchomienie kończy się błędem

Aby uruchomienie zakończyło się błędem po prostu usunąłem jeden niezbędny import.

![6.1](./Lab12/6.1.png)

![6.2](./Lab12/6.2.png)

Wszytskie 3 obrazy na dockerhubie

![6.3](./Lab12/6.3.png)

## Zmiany w deploymencie

Aktualizuj plik YAML z wdrożeniem i przeprowadzaj je ponownie po zastosowaniu następujących zmian:

-zwiększenie replik

Zwiększyłem liczbę replik z 4 na 6

![7.0](./Lab12/7.0.png)

![7.1](./Lab12/7.1.png)

-zmniejszenie liczby replik do 1

![7.2](./Lab12/7.2.png)

![7.3](./Lab12/7.3.png)

-zmniejszenie liczby replik do 0

![7.4](./Lab12/7.4.png)

![7.5](./Lab12/7.5.png)

-zastosowanie nowej wersji obrazu

Aby zastosować nową wersję obrazu zmieniłem w pliku .yaml linijkę odnoszącą się do obrazu odwołując sie do tagu latest2, liczba podsów została na 0 tak jak w podpunkcie wyzej

![7.6](./Lab12/7.6.png)

![7.7](./Lab12/7.7.png)

-zastosowanie starszej wersji obrazu

Został uzyty obraz wywołujący błąd

![7.8](./Lab12/7.8.png)

-Przywracaj poprzednie wersje wdrożeń za pomocą poleceń

![7.9](./Lab12/7.9.png)

# Kontrola wdrożenia

Napisz skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund)

```
#!/bin/bash

cmd() {
  kubectl rollout status deployments/devops-chat-deployment
}

if cmd | grep -q 'deployment "devops-chat-deployment" successfully rolled out'; then
  echo "Deployment running"
else
  echo "Something went wrong"
fi
```

Działanie skryptu:

![8.0](./Lab12/8.0.png)

# Strategie wdrozenia

Przygotuj wersje wdrożeń stosujące następujące strategie wdrożeń:

-Recreate

StWorzono devops-chat-deployment-recreate.yaml na podstawie devops-chat-komunikator-deployment.yaml (strategia Recreate).

-Rolling Update

Stworzono strategie wdrazania RollingUpdate. Parametry maxSurage=1 oraz maxUnavailable=1

Początkowo stworzony został zestaw replik z nową wersją aplikacji następnie liczba replik starej wersji byla zmniejszana na rzecz nowych.

-Canary Deployment workload

Zapewnia to dzialanie dwoch serwisow obok siebie, a uzytkownik je przepina.
