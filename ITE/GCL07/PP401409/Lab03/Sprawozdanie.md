SPRAWOZDANIE LAB03 PATRYCJA PSTRĄG

1. Uruchamianie kontenera z obrazu ubuntu

![](01.png)

2. Update systemu kontenera

![](02.png)

`apt-get install git` Instalacja gita

3. Klonowanie

![](03.png)

Instalowanie cmake 
`apt-get install cmake`

![](04.png)

Instalowanie g++ 
`apt-get install g++`

![](05.png)

Instalacja biblioteki gTest
`apt-get install libtest-dev`

![](06.png)

![](07.png)

`cmake CMakeLists.txt` 

![](08.png)

`make` 

![](09.png)

![](10.png)


4. Kompilacja programu

![](11.png)

Uruchomienie testów - passed

![](12.png)

CZĘŚĆ 2

1. Stworzenie pierwszego pliku Dockerfile

```

FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install git -y
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install cmake -y
RUN apt-get install g++ -y
RUN apt-get install libgtest-dev -y
WORKDIR "/usr/src/gtest"
RUN cmake CMakeLists.txt
RUN make
RUN cp lib/libgtest.a /usr/lib
RUN cp lib/libgtest_main.a /usr/lib
WORKDIR "/"
RUN mkdir DevOpsProgramLab03                 
WORKDIR "/DevOpsProgramLab03"
RUN git init
RUN git clone https://github.com/vkpam/DevOpsProgramLab03
RUN cmake CMakeLists.txt
RUN make

```

2. Zbudowanie za pomocą pliku Dockerfile obrazu dockerfilepicture

![](13.png)

`sudo docker images`
![](14.png)


3. Stworzenie drugiego pliku Dockerfile 

```
FROM dockerfilepicture:latest
WORKDIR "/DevOpsProgramLab03"
RUN ./runTests

```
Zbudowano za pomocą pliku Dockerfile_2 obrazu dockerfilepicture
![](15.png)




