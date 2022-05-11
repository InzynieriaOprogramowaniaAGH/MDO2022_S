# Szymon Mateusz Zych ITE-GCL08
## Sprawozdanie lab04
0. Prezentacja urzadzenia na którym jest wykonywane ćwiczenie
![1](./1.png)

1. Woluminy o nazwach inputV oraz outputV.
![2](./2.png)

2. Tworzenie kontenera bazującego na node oraz podpięcie woluminów inputV, outputV.
![3](./3.png)

3. Sklonowanie do inputV repo git.
![4](./4.png)

4. Repozytorium w kontenerze.
![5](./5.png)

5. Kopiowanie repo z inputV do outputV oraz wykonianie builda.
![6.1](./6.png)
![6.2](./6.1.png)


6. Sprawdzenie.
![7.1](./7.1.png)
![7.2](./7.2.png)

7. Pobranie iperf3 do kontenera, instalacja net-tools w celu sprawdzenia IP.
![1.1.1](./1.1.1.png)

8. Nasłuchiwanie na porcie 2000 w kontenerze, stworzenie kolejnego kontenera zainstalowanie na nim iperf i sprawdzenie ruchu miedzy kontenerami.
![2.1.1](./2.1.1.png)
![2.2.1](./2.2.1.png)

9. Instalacja iperf3 na hoscie i sprawdzenie komunikacji.
![3.1.1](./3.1.1.png)
![3.2.1](./3.2.1.png)

10. Sprawdzenie adresu IP hosta.
![4.1.1](./4.1.1.png)

11. Pobranie iperf za pomoca brew na MacOS'a.
![5.1.1](./5.1.1.png)
Kontener nie publikuje portu 2000 do hosta, czyli nie nasluchuje w tym porcie. Uruchamiamy kontener z opcja --publish.

12. Uruchomienie kontenera z opcja --publish dla 2000 i sprawdzenie.
![6.1.1](./6.1.1.png)
![6.2.1](./6.2.1.png)

13. Sprawdzenie ruchu MacOS - host.
![7.1.1](./7.1.1.png)
![7.2.1](./7.2.1.png)

14. Zestawienie.
![zxc](./zxc.png)

15. Stworzenie sieci mostkowej.
![1a](./1a.png)

16. Pobranie i uruchomienie obrazu.
![2a](./2a.png)

17. Stworzenie dockerfile.
![3a](./4aa.png)

18. Obraz na podstawie Dockerfile.
![4a](./4a.png)

19. Star kontenera na podstawie obrazu.
![5a](./5a.png)

20. Sprawdzenie i pobranie hasła
![6a](./6a.png)

21. Wyświetlenie działania
![7a](./7a.png)
