## Szymon Mateusz Zych 402734 Lab01

### Kroki zadania

0. Maszyna na której wszystko jest wykonywane (ThinkPad x61 better).<br />
![Screenshot](1.png)<br />
1. Znalezienie projektu do wykonania laboratorium, środowisko Makefile w moim przypadku to npm.<br />

Link: https://github.com/microsoft/TypeScript.git<br />

![Screenshot](2.png)<br />

2. Instalacja npm.<br />
![Screenshot](3.png)<br />

3. Zbudowanie projektu za pomoca npm. <br />
![Screenshot](4.png)<br />

4. Testowanie.<br />

### gulp tests - zbudowanie infrastruktury testów
![Screenshot](5.png)<br />

### gulp runtests-parallel - uruchumoenie testów

![Screenshot](test_1.png)<br />
![Screenshot](test_2.png)<br />

5. Pobranie obrazu node.<br />
![Screenshot](node.png)<br />


6. Sprawdzenie czy git i npm sa zainstalowane, skopiowanie projektu oraz zbudowanie. Uruchomienie kontenera z obrazem node, podłączenie sie do niego za pomocą TTY, oraz sprawdzenie wymaganych aplikacji do zbudowania.<br />

![Screenshot](instalacja.png)<br />

7. Uruchomienie testów.<br />
![Screenshot](testy.png)<br />

8. Tworzenie Dockerfile az do builda.<br />
![Screenshot](build_file.png)<br />
![Screenshot](docker_build_start.png)<br />


9. Wykonanie testów.
![plot](./test_file.png)
![plot](./test_dockerfile_1.png)

10. Poprawność testów.
![plot](./test_file_powodzenie.png)
![plot](./succe.png)


11. Poprawność.

![plot](./poprawnosc.png)
12. Co pracuje w kontenerze utworoznym przez nas?.<br />
W środowisku odizolowanym w kontenerze pracuje nasz program. Jest to sposób na odizolowanie od systemu, obraz jest podstawą do utworzenia kontenera.


