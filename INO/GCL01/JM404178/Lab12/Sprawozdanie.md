
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

Plik wdrozen, dostepny ![tu](https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/JM404178/INO/GCL01/JM404178/Lab12/mc-deployment.yml):

![](https://i.imgur.com/FtAOAD2.png)

Pozostaje teraz wdrozenie za pomoca `kubectl apply`. Jako ze probowalem uzyc `minikube kubectl apply`, wyskakiwal mi blad, ktory nie mam pojecia jak obejsc.

![](https://i.imgur.com/y6igpfC.png)

Pobralem samego kubectl ze strony i go zainstalowalem. Teraz wyniki prezentuja sie nastepujaco.

![](https://i.imgur.com/Y1cDZJH.png)

Wynik.

![](https://i.imgur.com/VNAASi8.png)




























