# Sprawozdanie Lab03 Damian Zyznar ITE-GCL08

1. Znalezienie open-source'owego projektu niezbędnego do wykonania laboratorium. 

Środowiskiem Makefile jest tu npm. 
 
 Link do repo:
 ```https://github.com/expressjs/express.git```

2. Sklonowanie repozytorium i jego zbudownie za pomocą npm.

![clone](./clone.png)

Udowodnienie przejścia builda przez testy.

![test_pass](./test_pass.png)

3. Obraz ```node``` został już wcześniej pobrany, udowodnienie jego istnienia.

![node_image](./node_image.png)

4. Uruchomienie kontenera z obrazem node i podłączenie się do niego TTY. Sprawdzenie instnienia wymaganych aplikacji do zbudowania projektu.

![git_npm_check](./git_npm_check.png)

Git i npm są zainstalowane, więc przystępuję do sklonowania repozytorium i do zbudowania projektu.

![build](./build.png)

Uruchomienie testów.

![test](./test.png)

![test](./test2.png)

5. Przystąpienie do utworzenia obrazu przy pomocy Dockerfile.

![docker_build](./docker_build.png)

Kod Dockerdile do builda obrazu:
```
FROM node:latest

RUN apt update
RUN git clone https://github.com/expressjs/express.git
RUN cd express && npm i
```

6. Przystąpienie do utworzenia obrazu, który bazuje na wczesniej utworzonym i wykonuje testu.

![docker_test](./docker_test.png)

Kod Dockerdile do builda obrazu:
```
FROM expressjs:latest

RUN cd express && npm test
```

7. Sprawdzenie poprawności działania utworzonych wczesniej obrazów.

![image_test](./image_test.png)

# Co pracuje w kontenerze utworzonym przez nas?
W kontenerze pracuje program w środowisku odizolowanym od nadrzędnego systemu.

Obraz jest podstawą do utworzenia kontenera.