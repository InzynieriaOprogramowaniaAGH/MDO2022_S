# Sprawozdanie - lab 3
1. Pobrano obraz node.<br>
![node_pull](pull_node.PNG)
2. Uruchomiono kontenera z node.<br>
![kontener](docker_run.PNG)
3. Sklonowano repozytorium i zainstalowano npm.<br>
![clone_and_i](clone_and_install.PNG)
Do poprawnego działania potrzebne było uaktualnienie npm do nowszej wersji.<br>
![update](update.PNG)
4. Uruchomiono testy.<br>
![testy](tests.PNG)<br>
Testy nie przeszły w całości, ponieważ nie uzyskano połączenia z serwerem. 
Wszystkie testy niewymagające tego połączenia przechodzą.<br>
5. Napisano dockerfile automatyzujący dotychczas pokazane kroki.<br>
![docker1](docker1.PNG)
![efekty1](docker_build.PNG)
![efekty1_end](first_docker_end.PNG)
6. Dockerfile na podstawie poprzedniego uruchamiający testy.<br>
![docker-test](docker_test.PNG)
![efekty_tests](dockertest1.PNG)
![efekty2](dockertest2.PNG)
#### Co pracuje w kontenerze?
W kontenerze pracuje obraz odizolowany od macierzystego systemu.
