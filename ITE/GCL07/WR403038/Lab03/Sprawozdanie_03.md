## **LAB3 - Weronika Rusinek - ITE  403038 gr lab 7**

# Punkt 1: Wykonaj kroki build i test wewnątrz wybranego kontenera bazowego.
Wybrano projekt strony nodejs.org: ([https://github.com/nodejs/nodejs.org](https://github.com/nodejs/nodejs.org) - otwarta licencja

Wybrany projekt spełnia wszystkie wymagania postawione w zadaniu: licencja, narzędzia Makefile, testy możliwe do uruchomienia.

- Sklonowanie repozytorium:  `git clone`


![clone](./git_clone.png)

- Zainstalowanie zależności z wcześniejszym doinstalowaniem pakietów 

![npm](./npm_install.png)
- Zbudowanie projektu: `npm run build`

![build](./run_build.png)
- Uruchomienie testów:  `npm test`

![test](./npm_test.png)

**Bulid w kontenerze:**
- Uruchamianie: 

![run1](./run.png)
- Klonowanie:

![clone](./clone_d.png)
- Uruchamianie: 

![install](./install_d.png)

![run2](./run_d.png)
- Testy: 

![test2](./test_d.png)

![test3](./test_d1.png)

# Punkt 2: Stwórz dwa pliki Dockerfile automatyzujące kroki powyżej

**- Kontener pierwszy ma przeprowadzać wszystkie kroki aż do bulida:**

`RUN git clone  https://github.com/nodejs/nodejs.org`

`WORKDIR /nodejs.org/`

`RUN npm install`

`RUN npm build`

`#EXPOSE 8080`

**- Kontener drugi bazuje na pierwszym i wykonuje testy:**

`FROM nbuild:latest`

`WORKDIR /nodejs.org/`

`RUN npm run build`

# Punkt 3: Wykaż, że kontener wdraża się i pracuje poprawnie

Na poniższym zrzucie przez `-f` możliwość wyboru dockerfile. `-t`wybranie nazwy końcowej obrazu. 
Przedstawiam kolejno wykonane kroki wykazujące działanie dockerfile oraz poprawne wykonanie testów. 

![df](./df1.png)

![df](./df2.png)

Powstałe obrazy: 

![di](./docker_images.png)

Uruchomienie obrazu: 


![node](./nodejs.png)

