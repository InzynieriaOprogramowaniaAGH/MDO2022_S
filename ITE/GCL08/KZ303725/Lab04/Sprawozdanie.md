# Sprawozdanie Krystian Zapart Lab04

1. Utworzenie woluminów.

![volumins](./screenshots/volumins.png)
 
2. Uruchomienie konterena za pomocą woluminów.

![run](./screenshots/run.png)

3. Sklonowanie repo w woluminie wejściowym.

 Żeby dostać się do katalogu woluminu potrzebne było podpięcie się do dockera poprzez kontener:
``` docker run --rm -it -v /:/docker ubuntu ```
za pomocą kontenera byłem w stanie dostać się do katalogu "docker/val/lib/docker/volume/_data/oi_input"

![clone](./screenshots/clone.png)

4. Potwierdzenie obecności sklonowanego repo w kontenerze.
![potw](./screenshots/potw.png)

5. Budowanie.

![build](./screenshots/build.png)

6. Test.

![test](./screenshots/test.png)

7. Skopiowany build do woluminu wyjściowego.

![copy](./screenshots/copy.png)

8. Uruchomienie serwera iperf3 na kontenerze. 

![listen](./screenshots/listen.png)

9. Połączenie kontener-kontener.

![kontener-kontener](./screenshots/kontener-kontener.png)

10. Połączenie host-kontener.

![host-kontener](./screenshots/host-kontener.png)

11. Instalacja Jenkinsa.

Jenkins został zainstalowany przy pomocy dokumentacji  https://www.jenkins.io/doc/book/installing/docker/

![1](./screenshots/1.png)

![2](./screenshots/2.png)

![3](./screenshots/3.png)

![4](./screenshots/4.png)

![5](./screenshots/5.png)

12. Pomyślne odpalenie Jenkinsa.
![6](./screenshots/6.png)


