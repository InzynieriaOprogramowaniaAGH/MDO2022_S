|Patryk Grabowski|403910|
| :- | :- |
|IT WIMIIP|
#
# Przygotowywanie maszyn wirtualnych z Fedorą
1. Pobrano obraz fedory i skonfigurowano ją na nowej instancji maszyny wirtualnej:\
![](Screenshot_1.png)  
2. Drugą maszynę wirtualną z fedorą sklonowano na bazie pierwszej maszyny.
![](Screenshot_2.png)  
![](Screenshot_3.png)  
  
# Przygotowanie serwera nginx
1. Na maszynie nr. 1 zainstalowano nginx za pomocą następujących komend:\
```
sudo dnf module enable nginx:mainline
sudo dnf install nginx
```  
2. Odblokowano firewalla na dostęp http i https:
```
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
```  
![](Screenshot_4.png)  

3. Stworzono wspólną sieć NAT łączącą obie maszyny\
![](Screenshot_5.png)  
![](Screenshot_6.png)  
![](Screenshot_7.png)  

4. Połączono obie maszyny i sprawdzono czy adres ip się zgadza:\
![](Screenshot_8.png)  
5. Test czy maszyny się widzą:\
![](Screenshot_9.png)  
6. Umieszczono artefakt na serwerze w folderze zawierającym pliki dostępne na serwerze:\
![](Screenshot_10.png)  
![](Screenshot_11.png)  
7. Zmiana uprawnień pliku by był on dostępny dla każdego do pobrania\
![](Screenshot_12.png)  
8. Próba ściągnięcia pliku za pomocą polecenia wget\
![](Screenshot_13.png)  
Podczas wykonywania ćwiczenia na maszynie wirtualnej miałem nieznany błąd związany z wget i nie mogłem dostać się do zawartości serwera, dlatego przygotowałem dodatkową maszynę z interfacem graficznym i tam bezpośrednio z przeglądarki przetestowałem czy wszystko działa:\
![](Screenshot_15.png)  
![](Screenshot_16.png)  
Rozpakowanie plików:\
![](Screenshot_17.png)  

# Instalacja nienadzorowana
1. Sprawdzenie pliku anaconda-ks.cfg na jednej z maszyn:\
![](Screenshot_18.png)  
![](Screenshot_19.png)  
2. Instalacja nowego obrazu fedory za pomocą komendy:\
```
vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-36 rd.live.check quiet inst.ks=https://raw.githubusercontent.com/malokreatywny/devops/main/anakonda-ks.cfg
```
![](Screenshot_20.png)  
![](Screenshot_21.png)  
3. Sprawdzenie czy pliki znajdują sie na nowej maszynie:\
![](Screenshot_22.png)  