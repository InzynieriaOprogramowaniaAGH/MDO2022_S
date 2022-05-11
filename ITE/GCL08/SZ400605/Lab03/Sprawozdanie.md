# Szymon Piotr Zych 400605 Sprawozdanie_Lab03

## Pobranie obrazu node, poniewa wybrałem project NodeJS

![NodePull](./pull_node.png)

## Uruchomienie kontenera oraz sklonowanie wybranego repozytorium

![NodeRun](./run_node.png)

## Sklonowanie repozytorium wybranego projektu

![GitClone](./git_clone.png)

## Zainstalowanie paczek zdefiniowanych w package.json uzywając menadzera zalezności npm

![NpmInstall](./npm_i.png)

## Uruchomienie buildu

![RunBuild](./npm_run_build.png)

## Uruchomienie testów

![RunTest](./npm_run_test.png)

## Stworzenie Dockerfile realizującego wszystkie kroki az do builda

```
FROM node
RUN apt-get update
run git clone https://github.com/deltachat/deltachat-desktop.git
WORKDIR /deltachat-desktop/
RUN npm i && npm run build

```

![Dockerfile1](./Dockerfile1.png)

## Stworzenie Dockerfile wykonującego testy

```
FROM build-chat:latest
WORKDIR /deltachat-desktop/
RUN npm run test

```

![Dockerfile2](./Dockerfile2.png)

## Wykaż, że kontener wdraża się i pracuje poprawnie. Pamiętaj o różnicy między obrazem a kontenerem. Co pracuje w takim kontenerze?

![Kontener](./Kontener.png)
