# Lab 09

## Zadania do wykonania
### Przygotowanie systemu pod uruchomienie
* Instalacja Fedory
    Wybór języka
        ![](./Images/1.png)

    Przygotowanie miejsca docelowego
        ![](./Images/2.png)

    Ręczne partycjonowanie
        ![](./Images/3.png)
    
    Dodanie ręcznie partycji root oraz boot
        ![](./Images/4.png)

    Włączenie konta roota
        ![](./Images/5.png)

    Oczekiwanie na instalacje
        ![](./Images/6.png)

    Ukończenie instalacji
        ![](./Images/7.png)

    Zalogowanie
        ![](./Images/8.png)

* Umieszczenie artefaktu na serwerze i pobranie go na fedore
    Postawienie serwera HTTP
        ![](./Images/9.png)
    
    Udostępnienie artefaktu z projektu na localhost
        ![](./Images/10.png)

    Pobranie oraz rozpakowanie artefaktu. W celu dostępu do localhosta z wirtualnej maszyny sieć ustawiono na NAT oraz w hosts windows ustawiono adres 10.0.2.2 jako outer
        ![](./Images/11.png)


### Instalacja nienadzorowana
* Zlokalizowanie pliku anaconda-ks.cfg
        ![](./Images/12.png)

* Dodanie nowych elementów do pliku konfiguracyjnego
```
# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64
```


    %post
    mkdir app
    cd app
    wget http://10.0.2.2:8080/deth_1.0.0.tar.gz
    tar -xzf deth_1.0.0.tar.gz
    %end

* Uruchomienie nowej instalacji 
    Po kliknięciu tab mamy możliwość dodania inst.ks="" gdzie umieszczony został raw pliku ks dodanego wcześniej na repozytorium
        ![](./Images/13.png)

    Przebieg instalacji
        ![](./Images/14.png)

    Sprawdzenie prawidłowości zadziałania maszyny
        ![](./Images/15.png)