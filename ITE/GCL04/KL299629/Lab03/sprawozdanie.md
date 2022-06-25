# ***Ćwiczenia 3***

# Wybór oprogramowania na zajęcia 

## 1. Znalezienie repozytorium z kodem dowolnego oprogramowania

Znalezione repozytorium: 
[https://github.com/caolan/nodeunit]( https://github.com/caolan/nodeunit)

## 2. Sklonowanie repozytorium, przeprowadzenie build programu oraz doinstalowanie wymaganych zależności

- sklonowanie repozytorium komendą

``` git clone https://github.com/caolan/nodeunit```

![](1.png)


- instalacja Node.js i npm

``` sudo apt install nodejs ```

![](2.png)

![](3.png)

``` npm install ```

![](4.png)

- instalacja zależności

``` npm install ```

![](5.png)

## 3. Uruchomienie testów jednostkowych dołączonych do repozytorium

Uruchomienie testów komendą 

``` npm test ```

![](6.png)

![](7.png)

* * *
# Przeprowadzenie buildu w kontenerze

## 1. Wykonanie kroków build i test wewnątrz wybranego kontenera bazowego (ubuntu)

- uruchomienie kontenera

```  sudo docker run -it ubuntu ```

![](8.png)

- podłączenie do niego TTY celem rozpoczęcia interaktywnej pracy


- zaopatrzenie kontenera w wymagania wstępne

``` apt update ```

![](9.png)

```apt upgrade ```

![](10.png)

```apt install git```

![](11.png)

![](12.png)

```apt install nodejs```

![](13.png)

![](14.png)

```apt install npm```

![](15.png)

![](16.png)

- sklonowanie repozytorium

``` git clone https://github.com/caolan/nodeunit```

![](17.png)

- uruchomienie build

    - konfiguracja środowiska 

    ``` npm install```

    ![](18.png)


```npm build```

![](19.png)

- uruchomienie testów

```npm test```

![](20.png)

![](21.png)

## 2. Stwozenie dwóch plików Dockerfile automatyzujących kroki powyżej, z uwzględnieniem następujących kwestii

- Kontener pierwszy ma przeprowadzać wszystkie kroki aż do builda
- Kontener drugi ma bazować na pierwszym i wykonywać testy

```
FROM node:latest
WORKDIR /app

RUN apt-get update -y
RUN apt-get install git -y

RUN git clone https://github.com/caolan/nodeunit
RUN cd /app/nodeunit && npm install
```

![](22.png)


## 3. Wykazanie, że kontener wdraża się i pracuje poprawnie. Pamiętaj o różnicy między obrazem a kontenerem. Co pracuje w takim kontenerze?

- budowanie obrazu z testem:

```sudo docker build -t <nazwa_testu> -f <nazwa_dockerfile_test> .```

![](23.png)

![](24.png)

![](25.png)

- stworzenie drugiego dockerfile'a, który uruchamia testy 

```
FROM app
WORKDIR  /app/nodeunit
CMD ["npm","test"]

```

![](26.png)

![](27.png)

-uruchomienie testu 

```sudo docker run -it <nazwa_testu>```

![](28.png)

![](29.png)
