# Zajęcia 09
---

### Instalacja systemu Fedora w VM

Jako środowisko wirtualizacji wybieram VirtualBox. Najpierw tworzę nową maszynę wirtualną w trybie eksperta:

![image-20220612174601637](Sprawozdanie.assets/image-20220612174601637.png)

Ustawiam wielkość pamięci RAM jako 4GB. Następnie tworzę dysk o rozmiarze 15 GB:

![image-20220612175226300](Sprawozdanie.assets/image-20220612175226300.png)

W ustawieniach nowo powstałej maszyny dodaję obraz rozruchowy instalatora w formie ISO pobranego z oficjalnej strony Fedory:

![image-20220612182316247](Sprawozdanie.assets/image-20220612182316247.png)

Następnie uruchamiam maszynę wirtualną:

![image-20220612181703489](Sprawozdanie.assets/image-20220612181703489.png)

Wybieram język na angielski:

![image-20220612181825504](Sprawozdanie.assets/image-20220612181825504.png)

Wybieram dysk, na którym zostanie zainstalowany system:

![image-20220612181846420](Sprawozdanie.assets/image-20220612181846420.png)

Następnie przystępuję do konfiguracji profilu roota, pozwalam na dostęp do niego przez SSH w celu łatwiejszej komunikacji w dalszej części:

![image-20220612181950092](Sprawozdanie.assets/image-20220612181950092.png)

Dalej tworzę konto użytkownika:

![image-20220612182013701](Sprawozdanie.assets/image-20220612182013701.png)

Wybieram instalację jako minimalną z podstawowymi narzędziami:

![image-20220612182616488](Sprawozdanie.assets/image-20220612182616488.png)

Rozpoczyna się proces instalacji:

![image-20220612182632977](Sprawozdanie.assets/image-20220612182632977.png)

### Druga instalacja systemu Fedora w VM jako serwer HTTP dla artefaktu

Aby zaoszczędzić czasu z uwagi na to, że obie maszyny z Fedorą po instalacji są takie same, używam opcji klonowania obrazu dostępnej w VM aby utworzyć drugą instancję.

Następnie maszynie będącej serwerem instaluję oraz konfiguruję Apache httpd jako root:

```bash
$ dnf install -y httpd 
$ dnf group install -y "Web Server"
```

Następnie uruchamiam proces:

```bash
$ systemctl start httpd
$ systemctl enable httpd
```

Na końcu konfiguruję Firewalla aby ten nie blokował requestów:

```bash
$ firewall-cmd --add-service=http --add-service=https --permament
$ firewall-cmd --reload
```



### Umieszczenie artefaktu z projektu na serwerze HTTP

Pobieram z Jenkinsa artefakt:

![image-20220612182509951](Sprawozdanie.assets/image-20220612182509951.png)

Na maszynie serwera instaluję i uruchamiam SSH:

```bash
$ dnf install -y openssh-server
$ systemctl start sshd.service
```

W VirtualBoxie ustawiam przekierowanie portu 22:

<ZDJECIE>



Na komputerze hoście łączę się z Powershella do maszyny kopiując plik artefaktu:

```powershell
$ scp C:\Users\kale2\Downloads\simple-tetris-1.3.0-rc.tgz konrad@127.0.0.1:/var/www/html/
```

<ZDJECIE>



Na końcu wyciągam plik konfiguracyjny instalatora:

```powershell
$ scp root@127.0.0.1:/root/anaconda-ks.cfg anaconda-ks.cfg
```

