# Sprawozdanie Lab_11 Kacper Nosarzewski
## 1. Cel cwiczenia
Wdrażanie na zarządzalne kontenery: Kubernetes

## 2. Wykonanie cwiczenia

Instalacja minikube poleceniami zawartymi w dokumentacji https://minikube.sigs.k8s.io/docs/start/

`curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

`sudo install minikube-linux-amd64 /usr/local/bin/minikube`

Nastepnie uzyto polecenia `minikube start` w celu uruchomienia minikuba nalezy tez sprawdzic czy na maszynie wirualniej sa dostepne min 2 rdzenie w przeciwnym razie polecenie nie zadziala 


 ![img](minikube_start_koniec.PNG)

 Nalezy dodac polecenie kubectl uywajac do tego polecenia `alias kubectl="minikube kubectl --"`

 ![img](alias.PNG)

 Po poprawnym instalacji zostaje uruchomiony Dashboard poleceniem `minikub dashboard` i uruchomienie w przegladarce

 ![img](start_dashboard.PNG)

 ![img](minikube_dashboard.PNG)


Jako ze aplikacja mongo-express uzywana w poprzednich cwiczeniach nie wyprowadza portow uzyto aplkacji nginx

Nastepuje uruchomienie kontenera z aplikacja nginx poleceniem `docker run --name kn_nginx1 -p 80:80 -d nginx`

![img](docker_run.PNG)

![img](sudo_docker_ps.PNG)

Sprawdzenie poprawnosci uruchomienia kontenera wpisujac w przegladrake `localhost`

![img](localhost.PNG)

Zostaje uruchomiony kontener w minikubie ktory jest juz zaopatrzony w poda poleceniem `minikube kubectl run -- knnginx1 --image=nginx --port=80 --labels app=knnginx1` nazwa kontenra zostala zmieniona z kn_nginx1 na knnginx1 poniewaz podczas uruchomiana kontenera otrzymano blad nazwy

 
Bledne uruchomienie


![img](blad.PNG)

Wprowadzenie poprawnej nazwy


![img](knnginx_created.PNG)

Sprawdzono takze poprawnosc jego dzialania poleceniem `kubectl get pods`

![img](kubectl_get_pods.PNG)

![img](knninx1.PNG)


Nastepuje wyprowadzenie portow poleceniem `kubectl port-forward knnginx1 2222:80`


![img](port-forward_t.PNG)

![img](post_forward.PNG)



Zamienienie drozenia manualnego w plik wdrozenia uzywajac do tego stworzonego pliku deploy.yml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kn-nginx-deployment
  labels:
    app: knnginx1
spec:
  replicas: 3
  selector:
    matchLabels:
      app: knnginx1
  template:
    metadata:
      labels:
        app: knnginx1
    spec:
      containers:
      - name: knnginx1
        image: nginx
        imagePullPolicy: Never
        ports:
        - containerPort: 2222
```

Wprowadzenie wprowadzonych zmian poleceniem `kubectl apply-f deploy.yml`


![img](deploy.PNG)


W celu sprawdzenia poprawnosc wdrozenia uzyto polecenia `kubectl get pods -o wide`

![img](deploy_pods.PNG)


![img](dashboard_deploy1.PNG)

