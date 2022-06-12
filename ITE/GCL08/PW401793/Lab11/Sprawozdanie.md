# Lab 11 - Paweł Waresiak

## Wstęp - Instalacja klastra Kubernetes
Aplikację będę uruchamiał na realnym klastrze, nie przy pomocy minikube.
Jako że wszystko mam już zainstalowane pokażę wersje narzędzi.

Zainstalowany kubectl

![kubectl](./screenshots/Screenshot_1.png)

Mój klaster składa się z dwóch node'ów, jednego mastera i jednego workera

![nodes](./screenshots/Screenshot_2.png)

Jako że kluster był stawiany przy pomocy kubeadm'a, nie mam dostępu do dashboard'u

![kubeadm](./screenshots/Screenshot_3.png)

## Analiza posiadanego kontenera
Moja oryginalna aplikacja (bashtop) to była zwykła aplikacja konsolowa nie wyprowadzająca żadnych portów.\
W celu realizacji zadania użyłem aplikacji [Calculator](https://github.com/actionsdemos/calculator).

Dockerfile obrazu aplikacji

![kubeadm](./screenshots/Screenshot_4.png)

Odpalona aplikacja w kontenerze

![image](./screenshots/Screenshot_5.png)
![kontener](./screenshots/Screenshot_6.png)

## Uruchamianie oprogramowania
Utworzenie pliku definicji poda dla aplikacji

![pod](./screenshots/Screenshot_7.png)

Utworzenie poda

![create](./screenshots/Screenshot_8.png)
![check](./screenshots/Screenshot_9.png)

### Wyeksponowanie poda na "zewnątrz"

Utworzenie service'u

![check](./screenshots/Screenshot_10.png)

Utworzenie ingresu

![ingress](./screenshots/Screenshot_11.png)

Utworzenie statycznej domeny dla aplikacji w routerze

![dns](./screenshots/Screenshot_12.png)

Pokazanie że aplikacja działa

![check](./screenshots/Screenshot_13.png)

## Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)
Utworzenie deployment'u z wcześniej utworzonego poda

![deployment](./screenshots/Screenshot_14.png)

Sprawdzenie czy deployment działa

![check](./screenshots/Screenshot_15.png)

Deployment działa i nadal można się do aplikacji dostać z przeglądarki.\
Jedna z replik wstała z błędem ponieważ nie mam obrazu aplikacji na nodzie nr 2, ale to chyba nie problem :)

