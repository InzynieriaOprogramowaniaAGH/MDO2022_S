# Sprawozdanie Lab03 Michał Szymański ITE-GCL08


## Cel ćwiczenia
Przeprowadzenie buildu repozytorium: https://github.com/opentracing/basictracer-python.git z narzedziem make w kontenerze.


## Przebieg

1. Uruchomiono kontener i podlaczono TTY:
![2](screenshots/2.png)

2. Sklonowano do niego wybrane repozytorium:  
![3](screenshots/3.png)

3. Doinstalowano potrzebne narzedzia:<br/>
![4](screenshots/4.png)

4. Zbudowano program za pomoca targetu ```make bootstrap```:
![5](screenshots/5.1.png)

5. Uruchomiono testy za pomoca targetu ```make test```:
![6](screenshots/5.png)

6. Stworzono Dockerfile ktory odpowiadal za build:
![7](screenshots/6.PNG)

7. Uruchomiono ```DockerBuild```:
![8](screenshots/7.PNG)

8. Stworzono Dockerfile ktory odpowiadal za testy:<br/>
![9](screenshots/8.PNG)

9. Uruchomiono ```DockerTest```:
![10](screenshots/9.PNG)

10. Sprawdzono poprawnosc dzialania powyzszych Dockerfile:
![11](screenshots/10.PNG)
![12](screenshots/11.PNG)
![13](screenshots/12.PNG)


## Wnioski- Kontener a obraz
Kontener umozliwia uruchomienie programu w odizolowanym od systemu srodowisku, obraz stanowi podstawe konteneryzacji.
