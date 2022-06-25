# ***Sprawozdanie***

## Przygotowanie systemu pod uruchomienie

- Instalację systemu Fedora w VM

  ![](1.PNG)

  ![](2.PNG)

  ![](3.PNG)

  ![](4.PNG)

  ![](5.PNG)

  ![](6.PNG)

  ![](7.PNG)

- Druga instalacja systemu Fedora w VM 

   Drugi system został zainstalowany tak samo jak poprzedni. Następnie skonfigurowano na nim serwer HTTP

   ```
  sudo dnf upgrade –refresh -y
  sudo dnf install httpd
  sudo systemctl enable httpd –now
  sudo systemctl status httpd
  ```

  ![](8.PNG)

  ![](9.PNG)

  ![](10.PNG)

  ```
  sudo firewall-cmd –permanent –zone=public –add-service=http
  sudo firewall-cmd –permanent –zone=public –add-service=https
  sudo firewall-cmd –reload
  ```

  ![](11.PNG)

  ![](12.PNG)

- Ustawienie sieci w obu maszynach

  ![](13.PNG)

- Na drugiej maszynie 

  ![](14.PNG)

  Instalacja ftp

  ```
  sudo yum install vsftpd
  ```

  ![](15.PNG)

  ```
  sudo systemctl enable vsftpd
  sudo systemctl start vsftpd
  sudo systemctl status vsftpd
  ```

  ![](16.PNG)


- Umieszczenie artefaktu przy pomocy WinScp

  ![](17.PNG)


- Dla pierwszej maszyny wirtualnej:

  ```
  sudo yum install wget
  ```

  ![](18.PNG)

  ![](19.PNG)

  ```
  wget http://192.168.101.4/try/nodeunit-0.11.3.tgz
  ```

  ![](20.PNG)

  ![](21.PNG)



## Instalacja nienadzorowana

Plik odpowiedzi z instalacji:
  ```/root/anaconda-ks.cfg```

```
cp anaconda-ks.cfg /home/kamila
chown kamila /home/kamila/anaconda-ks.cfg
cd /home/kamila

```

![](22.PNG)

![](23.PNG)

Dodanie do pliku wget, repozytoriów, pobieranie artefaktu z serwera

![](24.PNG)

![](25.PNG)



## Infrastructure as a code

Dodanie nowej maszyny w analogiczny sposób jak poprzednie lecz zmiana przy uruchamianiu

```
vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-36 inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/KL299629/ITE/GCL04/KL299629/Lab09/anaconda-ks.cfg

```

Po instalacji i uruchomieniu nowej maszyny widoczny jest pobrany artefakt

![](26.PNG)