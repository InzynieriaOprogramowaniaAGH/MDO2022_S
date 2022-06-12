##DevOps Sprawozdanie 11

Postanowiłem zaktualizować Debiana, bo od długiego czasu mnie o to prosił, oraz zwiększyłem dostępną ilość pamięci po usunięciu innych systemów z Virtualboxa. Niestety poskutkowało to zaprzestaniem działania interfejsu w Virtualboxie z nieznanych mi przyczyn. Połączenie przez PuTTy wciąż działa ale w dalszych krokach napotkałem głębsze problemy więc pożegnałem się z systemem ubuntu i wszystkimi plikami na nim...
Poniżej zdjęcie do jakiego stopnia odpala się Debian w virtualBoxie:
![smutek](00 wszystko.png)

Od razu przy instalacji systemu Ubuntu, ustawiłem w VirtualBoxie odpowiednie opcje:
![smutek](00 rdzenie.png)
![smutek](00 RAM.png)
![smutek](00 sieć.png)


Kubernetesa instaluje na Ubuntu postawionym na Virtual Boxie.
![uname -a](01 architektura.png)

Pobieram obraz **curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64** (na zdjęciu tutaj pobrałem go na VBoxie):
![minikube](02 minikube.png)

Instalacja minicube **sudo install minikube-linux-amd64 /usr/local/bin/minikube**:
![minikube](03 minikube.png)
![minikube](04 minikube.png)

Po instalacji minikube instaluję dockera z racji tego, że śmigam na nowym systemie.
Potem próbuję wystartować klaster poprzez **minikube start**:
![minikube](05 minikube.png)

tutaj zgodnie z podpowiedzią i dodaje mojego uzytkownika do grupy docker poprzez **sudo usermod -aG docker daniel && newgrp docker**
![minikube](06 dobrarada.png)

**minikube start --driver=docker**:
![minikube](07 dziejesie.png)

Wykonanie polecenia **minikube kubectl -- get pods -A**:
![minikube](08 kubectl.png)

Tutaj jest nasz kontener **docker ps**:
![minikube](09 dockerps.png)

Uruchomienie dashboardu (**minikube dashboard**):
![dashboard](10 dashboard.png)
![dashboard](11 dashboard.png)

W ramach deployowania aplikacji do minikube'a, deployowałem domyślny obraz echoserver:1.4.

Tworze deployment, za pomocą komendy **kubectl create deployment "nazwa" --image= "nazwa_obrazu:tag"**
Kolejny krok to expose na port 8080 **kubectl expose deployment "nazwa" --type=NodePort --port=8080**
![deployment](12 deployment.png)

Dalej włączam obsługę deploymentu poprzez **kubectl get services "nazwa"**:
![deployment](13 getservices.png)

Korzystając z kubectl'a przekierowujemy się na port 7080 **kubectl port-forward service/nazwa" 7080:8080**:
![przekierowanie portu](14 przekierowanie portu.png)

Wejście na localhost:7080:
![localhost](15 localhost.png)

Dashboard:
![Dashboard](16 dashboard.png)

Services:
![Services](17 services.png)