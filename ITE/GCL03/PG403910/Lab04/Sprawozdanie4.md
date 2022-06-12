|Patryk Grabowski|403910|
| :- | :- |
|IT WIMIIP|
#
# Zachowywanie stanu (woluminy) 
1. Stworzenie woluminu wejściowego i wyjściowego (vol-in i vol-out)\
![](Screenshot_1.png)  
  
2. Odpalenie kontenera na bazie obrazu fedory z podpiętymy woluminami\
![](Screenshot_2.png)  
  
3. Instalacja potrzebnych pakietów\
```
dnf -y update\
dnf -y install nodejs\
dnf -y install git\
```
4. Sprawdzenie stworzonych woluminów\
![](Screenshot_4.png)  
  

![](Screenshot_5.png)  
5. Przejście do katalogu związanego z woluminem wejściowym i ściągnięcie repozytorium z poprzednich laboratoriów\
![](Screenshot_6.png)   
  

![](Screenshot_7.png)   
6. Sprawdzenie czy w kontenerze pojawiły się pliki\
![](Screenshot_8.png)   
  

7. Instalacja wszystkich pakietów i przeniesienie programu do woluminu wyjściowego następującymi komendami\
```
npm install \
cp -r quick-example-of-testing-in-nodejs/ ../vol-out
```
  
8. Przejście do katalogu wyjściowego i sprawdzenie, czy pliki się tam znajdują\
![](Screenshot_10.png)  

# Eksponowanie portu
1. Pobranie obrazu ipers3\
![](Screenshot_11.png)  
  
2. Sprawdzenie adresu ip i odpalenie kontenera z serwerem\
![](Screenshot_13.png)  
  
3. Połączenie się z hostem (kontroler - kontroler)\
![](Screenshot_14.png)  
  
```
Przepustowość: 23.1 Gbits/s
```
4. Połączenie się z hostem (konroler - host)\
![](Screenshot_15.png)  
  

![](Screenshot_16.png)  
```
Przepustowość: 25.1 Gbits/s
```
# Instalacja Jenkins
1. Stworzenie sieci\
![](Screenshot_17.png)  
2. Pobranie i uruchomienie obrazu dind\
![](Screenshot_18.png)  
3. Napisanie dockerfile dla jenkinsa\
![](Screenshot_19.png)  
4. Stworzenie obrazu za pomocą dockerfile\
![](Screenshot_20.png)  
5. Sprawdzenie aktualnych obrazów\
![](Screenshot_21.png)  
6. Odpalenie kontenera na podstawie stworzonego obrazu\
![](Screenshot_22.png)  
  
  
![](Screenshot_23.png)  
  
  
7. Sprawdzenie hasła do jenkinsa\
![](Screenshot_24.png)  
8. Odpalenie okna jenkinsa w przeglądarce\
![](Screenshot_25.png)  
  


![](Screenshot_26.png)  