# Sprawozdanie

### Instalacja Fedory

* Wybór języka

![image-20220522200158839](image-20220522200158839.png)

* Dodanie polskiej klawiatury

![image-20220522200457865](image-20220522200457865.png)

* Ustawienie partycji 

![image-20220522201209771](image-20220522201209771.png)

* Wybranie opcji instalacji minimalnej

![image-20220522202236736](image-20220522202236736.png)

* Ustawienie nazwy sieci 

![image-20220522202953762](image-20220522202953762.png)

* Ustawienie prostego hasła 

![image-20220522203047147](image-20220522203047147.png)

* Rozpoczęcie instalacji 

![image-20220522203343124](image-20220522203343124.png)

* Została utworzona druga maszyna a analogiczny sposób o innej nazwie sieci

* Instalacja oraz uruchomienie serwera http

```
sudo dnf module enable nginx:mainline  
sudo dnf install nginx
```

![image-20220523172015741](image-20220523172015741.png)

```
sudo systemctl enable nginx --now
sudo firewall-cmd --reload
```

![image-20220523173353276](image-20220523173353276.png)

* Sprawdzenie połączenia pomiędzy maszynami 

![image-20220523174656073](image-20220523174656073.png)

* Sprawdzenie lokalizacji root nginx'a

```
cat /etc/nginx/nginx.conf 
```

![image-20220523175041866](image-20220523175041866.png)

* Pobranie artefaktu wykonanego poprzez pipeline z poprzedniego zadania oraz zmiana uprawnień pliku

```
wget https://transfer.sh/ug46dt/testing-node-apps-1.0.0.tgz
sudo chmod 777 testing-node-apps-1.0.0.tgz
```

![image-20220523175546589](image-20220523175546589.png)

* W celu pobrania pliku na drugiej maszynie konieczna jest instalacja wget tak samo jak na serwerze

```
sudo dnf install wget
wget https://10.0.2.4/testing-node-apps-1.0.0.tgz
```

![image-20220523181528648](image-20220523181528648.png)

### Instalacja nienadzorowana

* Pobranie pliku anaconda-ks.cfg

![image-20220523183441758](image-20220523183441758.png)

* Dodanie wget do sekcji "packages"

```
%packages
@^minimal-environment
wget

%end
```

* Dodanie repozytoriów 

```
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64
```

* Dodanie sekcji "post"

```
%post
wget https://10.0.2.4/testing-node-apps-1.0.0.tgz
%end
```

* Umieszczenie pliku na githubie

https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/WJ400220/ITE/GCL03/WJ400220/Lab09/anaconda-ks.cfg

### Infrastructure as a code

* Utworzenie nowej maszyny i rozpoczęcie instalacji Fedory, podczas uruchomienia instalacji podana została poniższa komenda zawierająca link do wcześniej zmodyfikowanego pliku "anaconda-ks.cfg"

```
vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-36 rd.live.check quiet inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/WJ400220/ITE/GCL03/WJ400220/Lab09/anaconda-ks.cfg
```

![image-20220523200405865](image-20220523200405865.png)

* Wynik instalacji

![image-20220523203901127](image-20220523203901127.png)