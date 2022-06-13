
1. Stworzo kontener z obrazu ubuntu

![plot](./screeny/1.png)

2. Zaktualizowano system kontenera

![plot](./screeny/2.png)

3. Zainstalowano gita

![plot](./screeny/3.png)

4. Utworzono folder na program i go tam pobrano

![plot](./screeny/4.png)

5. Zainstalowano cmake

![plot](./screeny/5.png)

6. Zainstalowano g++

![plot](./screeny/6.png)

7. Zainstalowano biblioteke gTest

![plot](./screeny/7.png)
![plot](./screeny/8.png)
![plot](./screeny/9.png)
![plot](./screeny/10.png)
![plot](./screeny/11.png)

8. Skompilowano pobrany program

![plot](./screeny/12.png)
![plot](./screeny/13.png)

9. Uruchomiono testy

![plot](./screeny/14.png)

10. Stworzono plik Dockerfile o nazwie Dockerfile

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
RUN mkdir program
WORKDIR "/program"
RUN git init
RUN git pull https://github.com/carmellino/naDevOps
RUN cmake CMakeLists.txt
RUN make
# RUN ./runTests
```

11. Zbudowano za pomocą pliku Dockerfile Obraz dockerfilius

![plot](./screeny/15.png)
![plot](./screeny/16.png)
![plot](./screeny/17.png)

12. Stworzono drugi plik Dockerfile o nazwie Dockerfile2

```
FROM dockerfilius:latest
WORKDIR "/program"
RUN ./runTests
```

Zbudowano za pomocą pliku Dockerfile2 obraz dockertestius

![plot](./screeny/18.png)
