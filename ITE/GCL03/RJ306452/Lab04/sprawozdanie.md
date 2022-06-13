| Imię i nazwisko  | Grupa | Numer ćwiczenia     |
|------------------|-------|------------|
| Radosław Jurczak | 03    | Lab04 |

## Zachowywanie stanu / Eksponowanie portu  
1. Utworzenie woluminów:  
wejściowy: `volume_in`  
wyjściowy: `volume_out`  
![](1.png)  
2. Uruchomienie kontenera:  
![](2.png)  
3. Sklonowanie repozytorium na wiolumin wejściowy (musiałem użyć uprawnień root'a):  
![](3.png)  
4. Zapisanie plików build na woluminie wyjściowym:  
![](4.png)  
5. Pobranie obrazu iperf3:  
![](5.png)  
6. Uruchomienie iperf3 w roli serwera:  
![](6.png)  
7. Sprawdzenie konfiguracji, w tym adresu IP:  
![](7.png)  
![](8.png)  
`172.17.0.2`  
8. Połączenie się z serwerem za pomocą drugiego kontenera i wykonanie testu:  
Bitrate: `21.9 Gbits/sec`   
![](9.png)  
9. Połączenie się z serwerem spoza kontenera (z hosta) i wykonanie testu:  
Bitrate: `24.8 Gbits/sec`  
![](10.png)  
10. Połączenie się z serwerem spoza kontenera (spoza hosta) i wykonanie testu:  
Bitrate: `3.36 Gbits/sec`  
![](11.png)  
## Instalacja Jenkins  
11. Utworzenie sieci:  
![](12.png)  
12. Instalacja Jenkins w kontenerze:  
![](13.png)  
13. Utworzenie Dockerfile:  
![](14.png)  
14. Utworzenie obrazu:  
![](15.png)  
![](16.png)  
![](17.png)  
15. I uruchomienie kontenera:  
![](18.png)  
16. Sprawdzenie kontenerów:  
![](19.png)  
17. Jenkins jeszcze nie jest odblokowany:
![](20.png)  
18. Sprawdzenie logów w kontenerze:  
![](21.png)  
19. Odnalezienie hasła dostępu:  
![](22.png)  
20. Jenkins działa poprawnie:
![](23.png)  