cd # Sprawozdanie Lab 9
###  Daniel Gabryś
#

# Przygotowanie systemu pod uruchomienie

## 1. Przeprowadź instalację systemu Fedora w VM, skonfiguruj użytkowników (użyj haseł, które można bezkarnie umieścić na GitHubie!), sieć, wybierz podstawowy zbiór oprogramowania, optymalnie bez GUI

 </br>

- Pobranie obraz fedory i zainstalowanie systemu na maszynie wirtualnej
  https://getfedora.org/en/server/download/

- Konfiguracja

![img](screen1.png) 

![img](screen2.png) 

![img](screen3.png) 

![img](screen4.png) 

![img](screen5.png) 

![img](screen6.png) 

![img](screen7.png) 

</br>

## 2. Przeprowadź drugą instalację systemu Fedora w VM - celem drugiego systemu będzie wyłącznie serwowanie repozytorium przez HTTP
    

Drugi system został zainstalowany podobnie jak poprzedni. 

- Konfiguracja serwera httpd na drugiej fedorze.

  ```
  sudo dnf install httpd
  sudo systemctl enable httpd --now
  sudo systemctl status httpd 

  ```

  ![img](zd8.png) 


- skonfigurowanie firewall (Dodanie wyjątków do zapory):

  ```

  sudo firewall-cmd --permanent --zone=public --add-service=http
  sudo firewall-cmd --permanent --zone=public --add-service=https
  sudo firewall-cmd --reload

  ```

 - Aby oba serwery się widziały muszą sie znaleźć tej samej sieci.
  W zakładce sieć na obu maszynach ustawiono mostkowaą kartę sieciową, aby maszyny były widoczne miedzy sobą oraz umożliwisć przesył plików z hosta na maszynę 
  
  ![img](zd9.png) 
    
  - Sprawdzamy czy maszyna z httpd jest osiągalna dla pierwszej maszyny polecieniem ping 

  ![img](zd10.png) 
  

  </br>

## 3. Umieść artefakty z projektu na serwerze HTTP
  
  W celu przeniesienia plików na serwer posłużono się Fillezilla

  - Utworzono na drugiej maszynie nowego użytkownika z uprawnieniami root

  ```
  sudo adduser -G wheel daniel
  sudo passwd daniel

  ```
  ![img](zd11.png) 


  - Zainstalowanie FileZillii i przeniesienie artefaktu z hosta na drugą fedorę (serwer), zmieniono uprawnienia katalogu /var/www/html w celu przesłania pliku

  > sudo 777 /var/www/html

  ![img](zd12.png) 

  ![img](zd14.png) 

  ## 3. Na zainstalowanym systemie wykonaj zbiór poleceń umożliwiających pobranie artefaktu, zapisz polecenia

  - Zaintalowanie na pierwszej maszynie potrzebnych pakietów: wget

  > yum install wget -y

  ![img](zd15.png) 

  - Pobranie pliku .jar

  > wget 192.168.1.21/guess.jar

  ![img](zd16.png) 

  </br>

  # Instalacja nienadzorowana

- Zlokalizowanie pliku odpowiedzi z instalacji. 

  ![img](zd17.png) 

- Dodanie elemententów odpowiedzialnych za wszystkie potrzebne dependencje
  
    Dodano

    ```
    %packages
    @^minimal-environment
    @standard
    wget

    %end

    ```

- Zdefiniowanie repozytoriów (co najmniej OS i aktualizacji, najlepiej też depednecji, optymalnie także repozytorium z własnym oprogramowaniem)
  
     Dodano
     ```
     # Repo
    url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
    repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64

    ```

- Dodano proces pobierania artefaktu

    ```
     wget 192.168.1.21/guess.jar

    ```

- Dodatkowo zmienio instalacje z graficznej na tekstową

</br>

# Infrastructure as a code

- Połączenie się z maszyną wirtualną w celu przesłania pliku anaconda-ks.cfg (Filezilla) na hosta, następnie push na repozytorium

![img](zd7.png) 

- Skonfigurowanie nowej maszyny na podstawie pliku odpowiedzi

> vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-36 rd.live.check quiet inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/DG304299/ITE/GCL04/DG304299/Lab09/anaconda-ks.cfg


![img](zd18.png) 

Po instalacji widać że instalator pobrał artefakt

![img](zd19.png) 

Z faktu ż wymagane jest środowisko graficzne do uruchomienia aplikacji, zamiast ją uruchamiać podejrzano zawartość pliku .jar

> dnf install zip
> unzip -l guess.jar

![img](zd20.png) 








     


  
 
 
















  


  



  

  









  