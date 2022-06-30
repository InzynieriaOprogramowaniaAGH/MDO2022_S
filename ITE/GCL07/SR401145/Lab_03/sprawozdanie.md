# Sprawozdanie Lab03
# Szymon Rewilak

## Przebieg ćwiczenia

# Przeprowadzenie buildu

1. Sklonowano repozytorium spełniające wymagania laboratorium. Klonowanym projektem jest kompilator C o nazwie chibicc. Projekt został napisany w języku C.

![](screen/1-git-clone.png)

2. Przeprowadzono build programu z wykorzystaniem pliku Makefile:

![](screen/2-make.png)

3. Uruchomiono testy dołączone do projektu. Ze względu na długi wydruk, w sprawozdaniu umieszczono jedynie początek i koniec wyjścia konsoli:

![](screen/3-test.png)

![](screen/4-make-test.png)

# Przeprowadzenie buildu w kontenerze

1. Uruchomiono kontener ubuntu, by uruchomić aplikację C:
```
sudo docker run -it ubuntu
```
![](screen/5-docker-run.png)

2. Do sklonowania repozytorium i przeprowadzenia builda konieczne było zainstalowanie zależności; git, make oraz build-essential:

```
apt-get git
apt-get make
apt-get build-essential

```

![](screen/6-git-install.png)

![](screen/8-make-install.png)

![](screen/9-essential-install.png)

3. Sklonowano repozytorium do obrazu:

```
git clone https://github.com/rui314/chibicc.git
```

![](screen/7-docker-clone.png)

4.Pomyślnie uruchomiono program poleceniem make:

![](screen/11-make-docker.png)
![](screen/10-make-success.png)

5. Pomyślnie uruchomiono test poleceniem make test:

![](screen/12-docker-test-1.png)
![](screen/12-docker-test.png)

# Przeprowadzenie buildu z wykorzystaniem Dockerfile

1. Utworzono dockerfile, z użyciem którego można przeprowadzić builda projektu:
Flaga -y została użyta, by każde zapytanie Y/n zostało automatycznie zaznaczone.

Plik dockerfile-build:

```
FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install git
RUN git clone https://github.com/rui314/chibicc.git
RUN apt-get -y install make
RUN apt-get -y install build-essential
WORKDIR /chibicc
RUN make
```

![](screen/13-dockerfile-build.png)

2. Stworzono obraz o nazwie build z wykorzystaniem Dockerfile o nazwie dockerfile-build:

```
sudo docker build . -f dockerfile-build -t build
```

Celem zwiększenia przejrzystości sprawozdania zrzut ekranu został przycięty.
![](screen/14-docker-build.png)

Poprawne budowanie projektu:

![](screen/15-docker-build.png)


3. Uruchomiony kontener:

![](screen/16-docker-images.png)

3. Przeprowadzono testy z wykorzystaniem dockerfile, na podstawie wcześniej uruchomionego kontenera:

Plik dockerfile-test:

```
FROM build:latest
WORKDIR /chibicc
RUN make test
```

![](screen/17-dockerfile-test.png)

4. Uruchomiono testy z wykorzystaniem dockerfile:

```
sudo docker build . -f dockerfile-test -t testinf 
```

![](screen/18-dockerfile-test.png)

5. Poprawne przechodzenie testów:

![](screen/19-dockerfile-test.png)
