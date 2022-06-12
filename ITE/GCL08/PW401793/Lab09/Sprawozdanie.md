# Lab 09 - Paweł Waresiak

## Przygotowywanie systemu pod uruchomienie
### Instalacja fedory

![scr1](./screenshots/image1.png)
![scr2](./screenshots/image5.png)
![scr3](./screenshots/image9.png)
![scr4](./screenshots/image10.png)

### Przygotowywanie serwera http (apache)  
Po instalacji konfiguruję uprawnienia do folderu  
![scr5](./screenshots/image3.png)  
Url kierujące do folderu  
![scr6](./screenshots/image12.png)    
Wyłączenie SELinux'a  
![scr2143](./screenshots/image24.png)  

### Przesyłanie programu na serwer (pobranie artefaktu) 
![scr7](./screenshots/image18.png)  
Następnie przeniosłem go do folderu hostowanego czyli /var/artifacts  

### Instalacja drugiego serwera i pobranie artefaktu    
Instalacja wget  
![scr8](./screenshots/image21.png)  
Pobranie pliku z serwera  
![scr9](./screenshots/image4.png)  
Nadanie uprawień do wykonywania  
![scr10](./screenshots/image7.png)  
Pobranie binarki z serwera http wget'em
![scr11](./screenshots/image4.png)  
Sprawdzenie czy aplikacja działa  
![scr12](./screenshots/image16.png)  

## Instalacja nienadzorowana  
### Instalacja z plikiem odpowiedzi hostowanym na serwerze http  
![scr13](./screenshots/image17.png)  
![scr14](./screenshots/image13.png)  
Instalacja przebiegła pomyślnie  


## Infrastructure as code  
### Zmodyfikowanie ISO o plik odpowiedzi  
Zamontowanie ISO  
![scr15](./screenshots/image8.png)  
Skopiowanie plików do folderu roboczego w celu uzyskania uprawnień do modyfikacji  
![scr16](./screenshots/image6.png)  
Skopiowanie fedora-config.ks do ISO do folderu isolinux z nową nazwą ks.cfg  
![scr22](./screenshots/image22.png)  
Zmiana isolinux.cfg  
![scr17](./screenshots/image23.png)  
Wypalenie ISO  
![scr18](./screenshots/image20.png)  

Ostatecznie, po zgraniu ISO z maszyny na hosta i uruchomieniu nowej maszyny z nowym ISO, system został pomyślnie zainstalowany c:
