# Sprawozdanie z lab 11
## 1.Instalacja klastra Kubernetes
Komendą `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64`
zaopatrzono się w implementację kubernetesa oraz przeprowadzono instalację poprzez `sudo install minikube-darwin-amd64 /usr/local/bin/minikube`

## 2.Uruchomienie minikube w dashboardzie

Przed otworzeniem dashboarda w przegladarce komenda ` kubectl get po -A` sprawdzono dostęp do klastra 

![](3.png)

Następnie poleceniem `minikube start` uruchomiony został dashboard

![](4.png)

Zrzut ekranu ze strony:

![](5.png)

## 3.Uruchomienie bezpośrednio z obrazu
Komendą `minikube kubectl run -- mongo-database --image=mongo --port=27017 --labels app=mongdb` uruchomione zostało mongo, które automatycznie zostaje ubrane w pod.
![](4-5.png)

Działający pod: 

![](6.png)

## 5.Przekierowanie portów
Następnie komenda `kubectl port-forward mongo-database 27017:27017` wyprowadzono port.

![](7.png)

Oraz połączono do hostowanej bazy.

![](8.png)

