# Sprawozdanie
### 27.05.2022
---
## Przygotowanie wdrożeń nienadzorowanych dla platform z pełnym OS

Wybieram plik instalacyjny Fedory

![img](./s1.png)

Wstępne sprawdzenie

![img](./s2.png)

Zostawiam domyślnie język polski

![img](./s3.png)

Konfiguruję konto roota i użytkownika

![img](./s4.png)

Konfiguruję miejsce docelowe instalacji

![img](./s5.png)

Wybieram opcje minimalnej 

![img](./s6.png)

Instalacja zakończyła się powodzeniem :)

![img](./s7.png)

![img](./s8.png)

Po zalogowaniu na roota widzimy plik `anaconda-ks.cfg`, który posłuży do automatycznej instalacji

![img](./s9.png)

Dla ułatwienia komunikacji między Fedorą a Windowsem konfiguruje połączenie SSH. W tym celu pobieram odpowiednie pakiety i ustawiam w VB przekierowanie portu

![img](./s10.png)

![img](./s11.png)

![img](./s12.png)

Następnie instaluję drugą Fedore, która posłuży za serwer http. Instalacje i konfiguracje przeprowadzam ze znalezionego poradnika

Polecenia:

`dnf install httpd`  
`dnf group install "Web Server"`  
`systemctl start httpd`  
`systemctl enable httpd`  
`firewall-cmd --add-service=http --add-service=https --permanent`  
`firewall-cmd --reload`

![img](./s13.png)

![img](./s14.png)

![img](./s15.png)

![img](./s16.png)

Wrzucam artefakt z pipelinu do odpowiedniego katalogu

![img](./s17.png)

Działający serwer hostujący plik

![img](./s18.png)

## Instalacja nienadzorowana

Za pomocą `winscp` przenoszę plik `anaconda-ks.cfg` na Windowsa w celu łatwiejszej jego edycji. Edytuję go w następujący sposób:

![img](./s19a.png)

![img](./s19b.png)

Kopiuje tak przygotowany plik na githuba

![img](./s20.png)

Należy pamiętać, aby korzystać z opcji `raw` w celu pobrania 'czystego' pliku tekstowego zamiast pliku html.

`https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/PP401424/INO/GCL02/PP401424/Lab09/anaconda-ks.cfg`

Przy instalacji podaje powyższą ścieżkę i odpalam instalacje

![img](./s21.png)

Instalacja zakończyła się sukcesem 

![img](./s22.png)

Efekt instalacji:

![img](./s23.png)