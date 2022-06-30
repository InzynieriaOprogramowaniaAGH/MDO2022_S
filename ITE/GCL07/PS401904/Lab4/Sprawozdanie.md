# Sprawozdanie
##
## Patryk Stefan GĆL_07
##
##
# Zachowywanie stanu
#### 
#### 1. Stworzenie dwóch woluminów: input i output
![Screenshot](1.png)
####
#### 2. Stworzenie kontenera z dwoma wcześniej stworzonymi woluminai
![Screenshot](2.png)
####
#### 3. Sprawdzenie położenie woluminu i próba wejścia do niego, natomiast na WSL2 nie miałem możliwości wejścia w folder dockera. 
![Screenshot](3.png)
####
#### 4. Próbowałem również dostać się do pliku przez windowsa, natomiast z tym samym skutkiem.
![Screenshot](4.png)
####
#### 5. Po rezygnacji z dalszych prób ręcznie wrzuciłem do woluminu outputowego repozytorium z githuba oraz zbuildowałem go.
![Screenshot](5.png)
![Screenshot](6.png)
####
#### 6. Z wolumenem outputowym problem był taki sam jak z inputowym.
![Screenshot](7.png)
####
#### 7. Natomiast używając docker desktop można zauważyć, że pliki zapisały się poprawnie na wolumenie wyjściowym.
![Screenshot](8.png)
####
# Eksponowanie portu
#### 
#### 1. Instalacja iperf3 na obrazie ubuntu.
![Screenshot](9.png)
####
#### 2. Uruchomienie nasłuchiwania na porcie 2000 oraz komunikacja między dwoma kontenerami.
![Screenshot](10.png)
####
#### 3. Nieudana próba połączenia hosta z kontenerem.
![Screenshot](11.png)
####
#### 4. Utworzenie kontenera z opcją publish na porcie 2000, niestety z tym samym skutkiem.
![Screenshot](12.png)
####
# Instancja Jenkins
#### 
#### 1. Stworzenie sieci mostkowanej w dockerze.
![Screenshot](13.png)
####
#### 2. Pobranie i uruchomienie obrazu docker-dind zgodnie z dokumentacją jenkinsa.
![Screenshot](14.png)
####
#### 3. Dodanie dockerfile'a prosto ze strony dokumentacji jenkinsa.
![Screenshot](15.png)
####
#### 4. Stworzenie obrazu na podstawie wcześniej stworzonego dockerfile'a.
![Screenshot](16.png)
####
#### 5. Uruchomienie wcześniej stworzonego obrazu.
![Screenshot](17.png)
####
#### 6. Wyświetlenie logów, żeby dostać się do klucza.
![Screenshot](19.png)
####
#### 7. Po wpisaniu klucza, możliwość rejestracji do jenkinsa.
![Screenshot](20.png)
####