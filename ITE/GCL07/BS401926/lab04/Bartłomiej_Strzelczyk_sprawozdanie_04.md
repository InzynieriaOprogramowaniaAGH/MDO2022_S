# Devops - Laboratorium nr 4

## Wykonanie laboratorium:

**1. Zachowanie stanu** 

a) przygotowanie dwóch woluminów

![in/out](./in-out.png)

b) uruchomienie kontenera

![mount](./docker-mount.png)

c) szczegóły wolumina

![inspect](./inspect.png)

d) klonowanie repozytorium na wolumin wejściowy

![clone](./clone.png)

e) pokazanie repozytorium w kontenerze

![in-nexe](./in-nexe.png)

f) uruchomienie buildu w kontenerze

![npmi](./npm-i.png)

![npmi/2](./npm-i2.png)

g) kopiowanie z woluminu wejściowego do wyjściowego

![cp](./cp.png)

h) sprawdzenie instnienia programu

![inspect2](./inspect-2.png)

![ls-in-out](./ls-in-out.png)

**2. Eksponowanie portu** 

* **Przed wykonaniem ćwiczenia należało poleceniem każdorazowo zainstalować iperf3 poleceniem apt install iperf3 oraz net-tools poleceniem apt install net-tools w celu sprawdzenia adresu kontenerów**

a) sprawdzenie adresów ip

![ifconfig](./ifconfig.png)

b) połączenie kontener-kontener

![iperf1](./iperf2.png)

c) połączenie host-kontener

![iperf2](./iperf1.png)

d) pobranie iperf3 i połączenie host-windows 

![windowsdir](./windowsdir.png)

![iperf3](./iperf3.png)

e) zestawienie przepustowości

|                  | kontener - kontener    | host - kontener     | maszyna spoza hosta - kontener   |
| :--------------: | :--------------------: | :-----------------: | :------------------------------: |
| Interval \[sec\] | Birate \[Gbit/sec\]    | Birate \[Gbit/sec\] | Birate \[Mbit/sec\]              |
| 0.00-1.00        | 29.1                   | 42.5                | 281                              |
| 1.00-2.00        | 25.6                   | 42.3                | 508                              |
| 2.00-3.00        | 29.2                   | 41.1                | 485                              |
| 3.00-4.00        | 25.6                   | 40.2                | 635                              |
| 4.00-5.00        | 29.5                   | 42.3                | 517                              |
| 5.00-6.00        | 30.7                   | 42.1                | 500                              |
| 6.00-7.00        | 31.3                   | 33.3                | 533                              |
| 7.00-8.00        | 30.4                   | 41.2                | 540                              |
| 8.00-9.00        | 23.4                   | 39.7                | 590                              |
| 9.00-10.00       | 24.1                   | 42.9                | 497                              |
| <strong>Średni bitrate</strong> | <strong>27.89</strong>                   | <strong>40.76</strong>                | <strong>508.6 </strong>                     |

* Możemy zaobserwować, że najszybszym połączeniem jest połączenie hosta z kontenerem, co wynika z bezpośredniego połączenia między nimi. Kolejnym połączeniem jest kontener - kontener. Ostatnie połączenie jest najwolniejsze, co jest spowodowane długą trasą pakietu.

**3. Instalacja Jenkinsa**

a) tworzenie sieci mostkowanej, dwóch woluminów i konteneru dla obrazu docker:dind

![dind](./dind.png)

b) kontener dla blueocean

![blue](./ocean.png)

c) ps kontenerów

![ps](./jenkins-ps.png)

d) sprawdzenie hasła do jenkinsa

![logs](./ocean-logs.png)

e) logowanie

![logowanie](./log.png)

![strona-startowa](./jenkins.png)

 









