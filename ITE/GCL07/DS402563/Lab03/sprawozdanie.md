# Sprawozdanie Lab03, Dawid Skorupa

Do celów zadania wykorzystano własne repozytorium z projektem Javy,  
w którym znajdują się
implementacje różnych algorytmów wraz z testami jednostkowymi.  
Projekt funkcjonuje w oparciu o Maven'a.

Repozytorium dostępne jest pod adresem:  
https://github.com/Dawr82/Java-Algorithms  

Na potrzeby wykonania pierwszych kroków (przeprowadzanie budowy oraz testów aplikacji poza kontenerami) zainstalowano niezbędne narzędzia (JDK, Maven).  
W przypadku kontenerów, te komponenty znajdują się już w ramach obrazu, na którym bazują obrazy kontenerów budujących oraz testujących.

## Klonowanie repozytorium, build i testy  

1. Klonowanie (Git SSH)  
![title](screenshots/initial/clone.png)  

2. Kompilacja (mvn compile), krok był wykonywany już wcześniej dlatego zależności nie są doinstalowywane  
![title](screenshots/initial/compile.png)  

3. Testy (mvn test)  
![title](screenshots/initial/test.png)  

## Budowa i testy aplikacji w kontenerze  

1. Uruchomienie kontenera (obraz: maven:3.8.4-jdk-11) z komendą /bin/bash oraz trybem interaktywnym (-it)  
![title](screenshots/single_container/run.png)  
2. Sklonowanie repozytorium (HTTPS)  
![title](screenshots/single_container/in_clone.png)  
3. Budowa projektu (mvn compile) - pomijam część wydruku, która dotyczy pobierania zależności  
![title](screenshots/single_container/in_build1.png)  
... (Pobieranie zależności)  
![title](screenshots/single_container/in_build2.png)  
4. Testy (mvn test)  
![title](screenshots/single_container/in_test.png)  

## Podział pracy na dwa kontenery, definicja Dockerfile  

1. Definicja Dockerfile obrazu kontenera budującego  
![title](screenshots/double_container/dockerfile_compile.png)  

2. Definicja Dockerfile obrazu testującego (Należy założyć, że obraz app-compile istnieje - został zbudowany przed obrazem, który definiuje poniższy Dockerfile)  
![title](screenshots/double_container/dockerfile_test.png)  

3. Budowa obrazu kontenera służącego do budowania projektu  
![title](screenshots/double_container/docker_build_compile.png)  

4. Budowa obrazu kontenera służącego do testów  
![title](screenshots/double_container/docker_build_test.png)  

5. Uruchomienie kontenera budującego (Pomijam część wydruku dotyczącą pobierania zależności)  
![title](screenshots/double_container/docker_run_compile1.png)  
... (Pobieranie zależności)  
![title](screenshots/double_container/docker_run_compile2.png)  

6. Uruchomienie kontenera testującego  
![title](screenshots/double_container/docker_run_test1.png)  
...  
![title](screenshots/double_container/docker_run_test2.png)  
Kontenery budujący i testujący kończą swoją pracę natychmiast po wykonaniu swoich zadań (build, testy)  
![title](screenshots/double_container/docker_ps.png)  

## Docker compose  
1. Definicja pliku docker-compose.yml  
![title](screenshots/compose/compose.png)  
2. Uruchomienie kompozycji  
![title](screenshots/compose/compose_run.png)  

## Historia poleceń  
![title](screenshots/history/history1.png)  
![title](screenshots/history/history2.png)  