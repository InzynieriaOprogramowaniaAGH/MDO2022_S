# Sprawozdanie 9

# Michał Mendrek, grupa nr 5 400704

Na samym poczatku pobrałem Fedore z linku podanego przez prowadzącego na zajęciach, którą potem zainstalowałem na swoim komputerze.

Podaczas instalcji należało dokonac wyboru w opcajch dotyczących języka instalacji, partycji dysku oraz włączyć a nastepnie utworzyć konto root.

![image](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/MM400704/ITE/GCL05/MM400704/Lab09/1.PNG)
-------

W kolejnym kroku umieszczono artefakty z projektu na serwerze HTTP, udostępnienie artefaktu na localhosta.
Należało również zmienic ustawienia sieci na NAT i ustawić adres routera.
-------

# Instalcja nienadzorowana

Odszukanie pliku o nazwie anaconda-ks.cfg

-------

Do naszego pliku konfiguracyjnego należało dopisać nowe potrzbne do realizacji elemnty:

```
# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64
```
```
%post
mkdir app
cd app
wget http://10.0.2.2:8080/deth_1.0.0.tar.gz
tar -xzf deth_1.0.0.tar.gz
%end

```

Ostanim już krokiem była próba przeprowadzania instalcji podczas której system fedora może skorzystać z ustawienia instalacji z poprzedniej,
a to wszystko dzięki zmianom w pliku konfiguracyjnym.

Reasumując w ostanim etapie pojawiły się problemy z tym że dopiero któraś z kolei wersja fedory zaczęła współpracować, wszystkie poprzenie
wyrzucały obfite błedy z którymi był probelm.
