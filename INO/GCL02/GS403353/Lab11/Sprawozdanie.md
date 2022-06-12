# Sprawozdanie - lab_11
## Gerard Skomin - 403353
___
### 1. Instalacja klastra Kubernetes
* Korzystając z poradnika instalacji z dokumentacji https://minikube.sigs.k8s.io/docs/start/ wykonano nastapujące kroki:  
  * Wybrano następujące opcje pobierania:  
  ![](inst.jpg)  
  * Pobrano `Debian package` komendą `curl`: `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb`  
  * Zainstalowano paczkę komendą: `sudo dpkg -i minikube_latest_amd64.deb`  
  * Pierwsza próba uruchomienia klastra `minikube start`  
  ![](start1.jpg)  
  * Dodanie odpowiednich uprawnień według zaleceń z wypisanego komunikatu: `sudo usermod -aG docker $USER && newgrp docker` oraz ponowne uruchomienie - `minikube start`  
  ![](start2.jpg)  
* W celu korzystania z komendy `kubectl` zapoznano się z instrukcją w dokumentacji https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/ i wykonano następujące kroki:  
  * Zaktualizowano *apt package index* komendą `sudo apt-get update`  
  * Pobrano wymagane dependencje komendą `sudo apt-get install -y apt-transport-https ca-certificates curl`  
  * Pobrano klucz Google Cloud `sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg`  
  * Dodano repozytorium Kubernetes: `echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list`  
  * Ponownie zaktualizowano `apt` i zainstalowano `kubectl` komendą `sudo apt-get install -y kubectl`  
  ![](kubectl.jpg)  
* Sprawdzono działanie zainstalowanych oprogramowań:  
  * Uruchomiono `dashboard`  
  ![](nothing.jpg)  
  * Wykorzystano komendę `kubectl get po -A` w celu sprawdzenia poprawności instalacji oraz uruchomionych *Namespace'ów*  
  ![](get%20po.jpg)  
  * Sprawdzono działanie kontenera komendą `docker ps`  
  ![](dockerps.jpg)  
* Następnie, zaciągnięto swój pierwszy **pod** `hello-minikube` kontynnując korzystanie z dokumentajci:  
  * Utworzono *deployment* komendą: `kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4`  
  * Eksponowano na port 8080: `kubectl expose deployment hello-minikube --type=NodePort --port=8080`  
  * Uruchomiono kolejną komendę z dokumentacji: `kubectl get services hello-minikube`  
  * Ostatecznie, dokonano konfiguracji portów: `kubectl port-forward service/hello-minikube 7080:8080`  
  ![](hello.jpg)  
  * Sprawdzono działanie aplikacji poprzez `localhost` i `dashboard`  
  ![](hello3.jpg)  
  ![](hello4.jpg)  
### 2. Analiza posiadanego kontenera  
* Posiadany projekt nie wyprowadza interfejsu przez sieć i nie nadaje się do pracy w kontenerze, gdyż jest to aplikacja wyłącznie konsolowa. Wybrano więc projekt `Planets` z repozytorium: https://github.com/Powerock38/planets.  
![](planetsclone.jpg)  
* Utworzono własny plik `Dockerfile` korzystając z instrukcji instalacji z `README` projektu, wyglądający następująco:  
  ```bash
  FROM node:latest
  
  COPY package.json .
  
  RUN npm install
  EXPOSE 2000
  
  COPY . .
  
  CMD ["node", "."]
  ```  
* Na podstawie pliku `Dockerfile` dokonano zbudowania obrazu komendą: `sudo docker build -t planets .`  
![](dockerbuild.jpg)  
* Uruchomiono powstały obraz wyprowadzając port 2000: `sudo docker run -d --rm --name planets -p 2000:2000 planets` oraz poleceniem `docker ps` sprawdzono jego działanie  
![](dockerrun.jpg)  
* Przetestowano działanie uruchomionej aplikacji w przeglądarce na `localhost`  
![](planetsworksxd.jpg)  
* Następnie, utworzono nowe repozytorium na `Docker Hub`  
![](dockerhub.jpg)  
* Otagowano poprzednio utworzony obraz komendą: `sudo docker tag planets grrd2000/planets`, i wypchnięto obraz komendą: `sudo docker push grrd2000/planets`  
![](dockertagpush.jpg)  
* Rezultat powyżej ykonanych kroków widoczny na `Docker Hub`  
![](dockerhubafter.jpg)  
### 3. Uruchomianie oprogramowania  
* Po wykonaniu poprzednich niezbędnych kroków przy pomocy komend z instrukcji uruchomiono kontener na stosie `k8s`  
![](getpods.jpg)  
![](podplanets.jpg)  
* Wyprowadzono port poleceniem: `kubectl port-forward`  
* Przetestowano działanie aplikacji  
![](pod2000.jpg)  
### 4. Przekucie wdrożenia manualnego w plik wdrożenia  
* Utworzono plik `YML` początkowo uruchamiający **2 repliki**  
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: planets
spec:
  selector:
    matchLabels:
      app: planets
  replicas: 5
  template:
    metadata:
      labels:
        app: planets
    spec:
      containers:
      - name: planets
        image: grrd2000/planets
        ports:
        - containerPort: 3000
```
* Wkonanie polecenia `kubectl apply` korzystającego z utworzonego pliku  
![](apply.jpg)  
* Działanie pod'ów w `kubectl` oraz `dashboard`  
![](poyml.jpg)  
![](deployment.jpg)  
![](dashboardpoyml.jpg)  
* Edytowano plik `YML` zwiększając liczbę replik do 5, po czym czekano na reakcję `Kubernetes'a`  
![](zmianana5.jpg)  
![](zmianana5dash.jpg)  