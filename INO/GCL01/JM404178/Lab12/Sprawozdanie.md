
# Sprawozdanie 11 oraz 12

## To sprawozdanie jest polaczeniem dwoch labow (bo tak zrozumialem ze ma byc)

### 11. Wdrażanie na zarządzalne kontenery: Kubernetes (1)

* Instalacja klastra Kubernetes

Komende do instalacji biore z dokumentacji.

![](https://i.imgur.com/WFQTnIQ.png)

Jako ze sam minikube wymaga "20GB of free disk space", to sprawdzam ile mi pozostalo.

![](https://i.imgur.com/B6uBpq2.png)

W takim razie musze zwiekszyc ilosc miejsca, zrobilem to za pomoca GParted, ale mysle ze samego procesu nie bede prezentowal, bo odbiega to od tematu.

![](https://i.imgur.com/Z9pKpZD.png)

Wystartowanie klastra.

![](https://i.imgur.com/6STDrIg.png)

Problem z permisjami, ktory rozwiazuje chmod'em.

Powodzenie instalacji.

![](https://i.imgur.com/YMpJtla.png)

Zaopatrzylem sie w kubectl.

![](https://i.imgur.com/Edjq0QQ.png)

Uruchamiam dashboard.

![](https://i.imgur.com/4m0peCN.png)


* Analiza posiadanego kontenera

Stwierdzilem, ze IRSSI, ktore implementowalem wczesniej napsulo mi wystarczajaco nerwow, dlatego zdecydowalem sie na postawienie serwera minecraft z [linku](https://hub.docker.com/r/itzg/minecraft-server).

* Uruchamianie oprogramowania

Uruchomienie `minikube kubectl run -- mc --image=itzg/minecraft-server --port 25565 --labels app=mc --env="EULA=TRUE"` i przedstawienie, ze dziala poprawnie przez:

- Dashboard

![](https://i.imgur.com/OVKm59L.png)

- kubectl

![](https://i.imgur.com/aRPrDqd.png)

Wyprowadzenie portu `minikube kubectl port-forward mc 25565:25565`.

![](https://i.imgur.com/kNrpnH8.png)

Dzialanie serwera.

![](https://i.imgur.com/zyprxvt.png)

* Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)

Plik wdrozen, dostepny [tu](https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/JM404178/INO/GCL01/JM404178/Lab12/mc-deployment.yml).

![](https://i.imgur.com/FtAOAD2.png)

Sam plik uzylem uzywajac kompose uzywajac fragmentu ponizej i usuwajac niektore rzeczy.

![](https://i.imgur.com/SSixj0M.png)

Pozostaje teraz wdrozenie za pomoca `kubectl apply`. Jako ze probowalem uzyc `minikube kubectl apply`, wyskakiwal mi blad, ktory nie mam pojecia jak obejsc.

![](https://i.imgur.com/y6igpfC.png)

Pobralem samego kubectl ze strony i go zainstalowalem. Teraz wyniki prezentuja sie nastepujaco.

![](https://i.imgur.com/Y1cDZJH.png)

Wynik.

![](https://i.imgur.com/VNAASi8.png)

### 12. Wdrażanie na zarządzalne kontenery: Kubernetes (2)

* Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

Zmiana ilosci replik na 4.

![](https://i.imgur.com/dx345Cr.png)

Wdrozenie za pomoca kubectl apply oraz sprawdzenie stanu.

![](https://i.imgur.com/E1LdrnP.png)

Minikube dashboard.

![](https://i.imgur.com/Yi6rEoR.png)

* Przygotowanie nowego obrazu

Przygotowuje obraz, ktorego uruchomienie konczy sie bledem. W moim przypadku wystarczy usunac zmienna srodowiskowa.

![](https://i.imgur.com/Fp73oyi.png)

* Zmiany w deploymencie

Zwiekszam ilosc replik do 6 i wdrozenie go.

![](https://i.imgur.com/QZUVwtX.png)

![](https://i.imgur.com/A8MpWyK.png)

Zmniejszenie liczby replik do 1 i do 0.

![](https://i.imgur.com/zSp0RO7.png)

![](https://i.imgur.com/FvpZJ8y.png)

Zastosowanie nowej wersji obrazu (image jako latest).

![](https://i.imgur.com/xb68hah.png)

![](https://i.imgur.com/hJ44LXu.png)

Zastosowanie starszej wersji obrazu (2022.4.1).

![](https://i.imgur.com/Aub9QVI.png)

![](https://i.imgur.com/YLm90I8.png)

Teraz przywroce poprzednia wersje wdrozen wraz z pokazaniem historii.

![](https://i.imgur.com/4OxKVL0.png)

Widoczna jest wowczas wersja latest.

![](https://i.imgur.com/rNomIpD.png)

* Kontrola wdrożenia

Pora na zajecie sie skryptem, ktory bedzie weryfikowal automatycznie, czy wszystko dobrze sie wdrozylo w czasie 60 sekund, a jezeli nie- wykona rollback do poprzedniej wersji.

![](https://i.imgur.com/2r7EApL.png)

Uruchomienie skryptu.

![](https://i.imgur.com/F5ogOmb.png)

Test czy dobrze dziala, jak nie przejdzie (zedytuje plik yamlowski usuwajac zmienna srodowiskowa).

Okazalo sie, ze wychodzi z tego petla nieskonczona, bo wdrozenie nigdy nie dochodzi do konca, wiec dodalem do kodu yamlowskiego 2 linijki:

```yml
minReadySeconds: 55 
progressDeadlineSeconds: 60
```

Wynik.

![](https://i.imgur.com/s9Cqz8m.png)

* Strategie wdrożenia

Wszystkie pliki wdrozen uzyte tutaj sa dostepne na repo. 

- Recreate

```yml
  strategy:
    type: Recreate
```

![](https://i.imgur.com/BHR8AKk.png)

![](https://i.imgur.com/JhF5zNi.png)

Usuwa wszystkie pody, a potem uruchamia stworzone na nowo pody, ktore posiadaja nowa wersje oprogramowania.

- Rolling Update

```yml
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
```

![](https://i.imgur.com/QS9RroI.png)

![](https://i.imgur.com/oy6Qw9y.png)

Uzylem innej wersji oprogramowania, aby sprawdzic czy dziala on inaczej niz recreate, lecz niestety nie widze na screenach duzej roznicy. Przeczytalem w dokumentacji, ze opcja `maxSurge`
sluzy do okreslenia ile dodatkowych podow moze byc tworzonych (+x w stosunku do max), jest to pole opcjonalne. Mamy jeszcze `maxUnavailable`, ktory ma okreslac ze tyle maksymalnie podow moze byc niedostepnych.
Jest to rowniez pole opcjonalne.

- Canary Deployment Workload

W przypadku Canary powinnismy stworzyc kolejny plik wdrozeniowy, ktorego nazywamy inaczej. Ja stworze drugi taki, ktory rozni sie wersja oraz nazwa.
Glownie chodzi o to, ze mozna stowrzyc wiele wdrozen. 

Dodatkowo mamy 1 pole (mysle ze nie musze tlumaczyc o co w nich chodzi, bo jest self explanatory):

```yml
   version: "our version number"
```

![](https://i.imgur.com/i5kkZLs.png)

![](https://i.imgur.com/hJ8Zcsm.png)

![](https://i.imgur.com/NBnsMhv.png)

Jak widac, 7 podow smiga, 4 z jednej, 3 z drugiej wersji oraz mamy 2 deploymenty.


