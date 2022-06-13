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

![image](https://user-images.githubusercontent.com/75485199/173448046-c9837056-c6e6-4f1a-b289-e46151e87dbd.png)

----

Uruchamiam Kubernetes poleceniem minikube start. 

```
minikube start
```

![image](https://user-images.githubusercontent.com/75485199/173448139-b9b9e863-beba-4eda-aaf4-7a885b8a8d90.png)

----

Następnie wypisuję listę aktywnych kontenerów poleceniem (widać, że kontener aktywny):

```
docker container list
```

![image](https://user-images.githubusercontent.com/75485199/173448169-92b05fb3-4523-427f-9166-2bac618eaa50.png)

----

kubectl

![image](https://user-images.githubusercontent.com/75485199/173448195-88481fdd-5531-4fbd-a571-8b5074ddfee2.png)

----

W kolejnym kroku uruchamiamy Dashboard oraz otwieramy go w przeglądarce w celu przedstawienia łączności:

```
minikube dashboard
```

![image](https://user-images.githubusercontent.com/75485199/173448217-c753486d-712c-4163-adbb-c3c290e3dc18.png)

![image](https://user-images.githubusercontent.com/75485199/173448236-33ca0b0e-95fe-41e2-b536-a6f1aa781033.png)

----

Zapoznanie się z koncepcjami funkcji wyprowadzanych przez kubernetesa (pod, deployment itp).

----

Uruchomienie oprogramowania, uruchomienie kontenera na stosie k8s:

```
kubectl run  redis --image=redis:alpine --port=6379 --labels app=redis
```

![image](https://user-images.githubusercontent.com/75485199/173448270-ec01789c-0d8b-4a06-8248-8c62def8fbb0.png)

![image](https://user-images.githubusercontent.com/75485199/173448287-1df5ec80-dae7-4aaf-9007-f81aa4667f67.png)

![image](https://user-images.githubusercontent.com/75485199/173448371-f51d3ba1-84bb-43b3-b2e5-6bfe5199f0ce.png)

----

Przekucie wdrożenia manualnego w plik wdrożenia.

Stworzono deployment ale niestety coś później poszło nie tak.

```
kubectl create deployment redis --image=redis/alpine
```

![image](https://user-images.githubusercontent.com/75485199/173448798-123917e5-0999-4cc4-b1b0-e36cd265f122.png)

![image](https://user-images.githubusercontent.com/75485199/173448809-d7ef5b38-8046-4bd8-a689-4b895bba17c1.png)

Minikube to narzędzie, którego można użyć do uruchomienia Kubernetes (k8s) na komputerze lokalnym. Tworzy ono klaster z jednym węzłem w maszynie wirtualnej (VM). Klaster ten umożliwia demonstrację operacji Kubernetes bez konieczności czasochłonnej i zasobochłonnej instalacji pełnego K8s.

Jaki jest cel używania Kubernetes?
Kubernetes, często określany skrótem "K8s", orkiestruje skonteneryzowane aplikacje, które mają działać na klastrze hostów. System K8s automatyzuje wdrażanie i zarządzanie aplikacjami działającymi w chmurze przy użyciu infrastruktury lokalnej lub platform chmury publicznej.
