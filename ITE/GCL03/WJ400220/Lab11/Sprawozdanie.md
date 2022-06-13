Wojciech Jaskowski

# Sprawozdanie

### Instalacja klastra Kubernetes

* Zaopatrz się w implementację stosu k8s: minikube

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

![image-20220609010030933](image-20220609010030933.png)

* Przeprowadź instalację, wykaż poziom bezpieczeństwa instalacji

```
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

![image-20220609010148914](image-20220609010148914.png)

* zaopatrz się w polecenie kubectl

Pobranie kubectl oraz checksum kubectl

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
```

![image-20220609010316953](image-20220609010316953.png)

Instalacje kubectl

```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

![image-20220609010504711](image-20220609010504711.png)

* Uruchom Kubernetes, pokaż działający kontener/worker

```
sudo minikube start
```

![image-20220609010931754](image-20220609010931754.png)

Poprawne uruchomienie wymaga dodania użytkownika do grupy docker

```
sudo usermod -aG docker $USER
newgrp docker
```

![image-20220609011220893](image-20220609011220893.png)

```
minikube start
```

![image-20220609012325163](image-20220609012325163.png)

Dodanie aliasu

```
kubectl get po -A
alias kubectl="minikube kubectl --"
```

![image-20220609012518857](image-20220609012518857.png)

* Uruchomienie Dashboardu

```
minikube dashboard
```

![image-20220609013449299](image-20220609013449299.png)

![image-20220609013016534](image-20220609013016534.png)

### Analiza posiadanego kontenera

Wykorzystywana wcześniej aplikacja nie nadaje się do wykorzystania podczas tego ćwiczenia, dlatego wykorzystano obraz nginx.

* Pobrano obraz nginx oraz uruchomiono 

```
docker pull nginx
docker run -it --rm -d -p 8090:80 --name nginx_agh nginx
```

![image-20220609013848008](image-20220609013848008.png)

### Uruchomienie oprogramowania

```
kubectl run nginx-lab11 --image=nginx --port 80 --labels app=nginx-lab11
```

![image-20220609014813724](image-20220609014813724.png)

![image-20220609015026149](image-20220609015026149.png)

![image-20220609015132533](image-20220609015132533.png)

```
kubectl port-forward nginx-lab11 9999:80
```

![image-20220609015758663](image-20220609015758663.png)

![image-20220609020109673](image-20220609020109673.png)

### Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)

* Zapisanie wdrożenia jako plik YML

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: lab11-agh
spec:
  selector:
    matchLabels:
      app: lab11-agh
  replicas: 3
  template:
    metadata:
      labels:
        app: lab11-agh
    spec:
      containers:
      - name: nginx-agh
        image: nginx
        ports:
        - containerPort: 80
```

```
kubectl apply -f kubernetes-deployment.yml
```

![image-20220609020728857](image-20220609020728857.png)

![image-20220609020845533](image-20220609020845533.png)