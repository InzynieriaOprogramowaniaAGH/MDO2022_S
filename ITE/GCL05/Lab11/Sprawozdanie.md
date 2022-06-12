# Sprawozdanie z laboratorium 11

1. Instalacja minikube
![s1](1.png)
2. Uruchomienie minikube
![s2](2.png)
3. Pobranie pakietów kubectl oraz isntalacja kubectl (na ss umieszczona neistety tylko instalacja)
![s3](3.png)
4. Przedstawienie działajacych podów oraz noda
![s4](4.png)
5. Działająćy dashboard
![s5](5.png)
6. Analiza posiadanego kontenera
Utworzono nasßepujący dockerfile
![s6](21.png)
7. Przeprowadzono build obrazu
![s7](6.png)
8. Po uruchomieniu konterenta przekierowany został na inny port w celu przedstawienia działania
![s9](8.png)
![s8](7.png)
9. Utworzenie pliku pod.yaml
![s10](9.png)
10. Utworzenie poda
![s11](10.png)
11. Poprawne działanie poda
![s13](11.png)
Na początku zaistaniał problem z uruchomieniem poda ponieważ nasz obraz nie jest w b8s tylko w lokalnym Dockerze. Rozwiązanie tego problemu byla komenda eval.
![s12](12.png)
12. Przekucie wdrożenia manualnego w plik wdrożenia.
Kolejny plik yml
![s13](22.png)
Działanie było widocznie na dashboard ale niesttety nie uchwyciłam tego na screenie.


#Sprawozdanie laboratorium 12
1. Zmiany w deployment
Plik .yml został zmodyfikowany, zmioniona została ilosć replik na 4. Możliwość dokonania zmiany daje komenda roollout
![s15](14.png)
![s14](15.png)
![s16](16.png)
Zmiana ilosci replik na 9. Używamy ponownie komendy roolout, analogicznie jak przy zmianie na 4 repliki.
![s17](17.png)
3. Zmiana ilosci replik na 1.
![s18](18.png)
4. Zmiana ilosci replik na 0
![s19](19.png)
5. Kontrola wdrożenia. Został stworzony plik basha, który sprawdza czas wdrożenia. Jeśli ejst on większy niż 60 sekund skrytp zwraca nam informacje o błędzie.
![s20](20.png)

