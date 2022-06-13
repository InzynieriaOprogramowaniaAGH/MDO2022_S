## Michał Nycz
## Informatyka-Techniczna
## Gr-lab 06
----
# Sprawozdanie
## Metodyki DevOps lab_nr_11
----

Zajęcia rozpocząto od:
![image](https://user-images.githubusercontent.com/75485199/173445995-ef47bfb9-d9c5-48d1-81c8-34f155260304.png)

Po wybraniu odpowiedniej konfiguracji, skopiowano pomocnicza komende i uruchomiono (należało również doinstalować curl)

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

```
sudo apt install curl
```

----

Uruchamiam Kubernetes poleceniem minikube start. 

```
minikube start
```

----

Następnie wypisuję listę aktywnych kontenerów poleceniem (widać, że kontener aktywny):

```
docker container list
```

----

kubectl

----

W kolejnym kroku uruchamiamy Dashboard oraz otwieramy go w przeglądarce w celu przedstawienia łączności:

```
minikube dashboard
```

----

Zapoznanie się z koncepcjami funkcji wyprowadzanych przez kubernetesa (pod, deployment itp).

----

Uruchomienie oprogramowania, uruchomienie kontenera na stosie k8s:

```
kubectl run  redis --image=redis:alpine --port=6379 --labels app=redis
```

----


