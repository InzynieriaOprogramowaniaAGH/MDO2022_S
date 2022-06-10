# Sprawozdanie lab 11


Instalacja minikuba

![](1%20instalacja%20minikube.png)

Pobranie kubectl i checksum

![](2%20pobranie%20kubectl%20i%20checksum.png)

Instalacja kubectl i sprawdzenie wersji

![](3%20po%20zainstalowaniu.png)


Uruchomienie mikube

![](4.%20minikube%20start.png)


Sprawdzenie kubeclt i dodanie aliasów

![](5.%20alias.png)


Uruchomienie dashboardu

![](6.%20dashborad%20z%20httpd.png)

Udostępnienie na port 5000 za pomocą polecenia minikube kubectl port-forward

![](9.%20port%20forward.png)

Jako aplikacje uruchomiono serwer apache na porcie 5000, niestety prawdopodobnie firewall blokował połączenie, a że było to na vm problemu nie udało się naprawić.

![](8.%20b%C5%82%C4%85d%20po%C5%82%C4%85czenia.png)

Następnie utworzono depolyment.yaml

![](10.%20pod.png)


Uruchomienie depolymentu.

![](11.%20deploy.png)

Działający pod w dashboardzie
![](12.%203%20pody.png)