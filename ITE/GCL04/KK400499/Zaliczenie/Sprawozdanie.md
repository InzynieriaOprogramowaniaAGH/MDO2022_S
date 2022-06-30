# Sprawozdanie
### Kamil Kruczek GL04
## Projekt zaliczeniowy

### Przygotowanie

1. Sklonowanie sforkowanego repozytorium

![](screen/2022-06-30-18-27-13.png)

2. Zainstalowanie zależności i sprawdzenie działania aplikacji poza kontenerem

``` npm install ```

![](screen/2022-06-30-19-20-07.png)

``` npm test ```

![](screen/2022-06-30-19-20-53.png)

``` npm start ```

![](screen/2022-06-30-19-21-51.png)

3. Przygotowanie plików dockerbuild i dockertest

``` dockerbuild ```

![](screen/2022-06-30-20-34-20.png)

``` dockertest ```

![](screen/2022-06-30-20-34-42.png)

4. Sprawdzenie działania kontenerów zbudowanych na podstawie powyższych plików

``` sudo docker build . -f dockerbuild -t builder ```

![](screen/2022-06-30-20-26-48.png)

``` sudo docker build . -f dockertest -t tester ```

![](screen/2022-06-30-20-36-41.png)

## Przygotowanie Pipeline'u

1. Utworzenie woluminów wejścia i wyjścia

![](screen/2022-06-30-20-52-45.png)

2. Modyfikacja pliku dockerbuild

``` dockerbuild ```

![](screen/2022-06-30-21-05-23.png)

3. Utworzenie pliku dockerdeploy

``` dockerdeploy ```

![](screen/2022-06-30-21-07-02.png)

4. Utworzenie pliku Jenkinsfile

Kroki Prebuild oraz Build

![](screen/2022-06-30-21-12-59.png)

Krok Test

![](screen/2022-06-30-21-13-32.png)

Krok Deploy

![](screen/2022-06-30-21-14-12.png)

Krok Publish

![](screen/2022-06-30-21-14-49.png)

5. Uruchomienie Pipeline'u

![](screen/2022-06-30-21-47-00.png)

## Diagramy

![](screen/2022-06-30-21-50-12.png)

![](screen/2022-06-30-22-37-40.png)