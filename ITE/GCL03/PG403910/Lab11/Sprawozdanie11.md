|Patryk Grabowski|403910|
| :- | :- |
|IT WIMIIP|
#
# Instalacja Kubernetes
1. Pobrano kubernetes według poradnika z oficjalnej strony za pomocą następujących komend:\
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
![](Screenshot_1.png)  
![](Screenshot_2.png)  
2. Uruchomiono klaster za pomocą komendy
```
minikube start
```

![](Screenshot_3.png)  
![](Screenshot_4.png)  

3. Uruchomiono graficzny dashboard kubernetes komendą
```
minikube dashboard
```
![](Screenshot_5.png)  
  
# Uruchomienie odpowiedniego kontenera:
1. Ściągnięto najnowszy obraz nginx z oficjalnego repozytorium dockera:\
```
docker pull nginx:latest
```
![](Screenshot_6.png)  

2. Odpalono kontener:\
![](Screenshot_7.png)  
3. Sprawdzenie widoczności kontenera w dashboardzie:\
![](Screenshot_8.png)  
4. Zmieniono port z 80 na 5000:\
![](Screenshot_9.png)  
5. Sprawdzono działanie na locahoście z portem 5000:\
![](Screenshot_10.png)  

# Stworzenie pliku wdrożeniowego i stworzenie na jego podstawie klastra
1. Plik wdrożeniowy:\
```
apiVersion: apps/v1
kind: Deployment
metadata:
 name: nginx-prod
spec:
 selector:
   matchLabels:
     app: nginx
 replicas: 2
 template:
   metadata:
     labels:
       app: nginx
   spec:
     containers:
     - name: nginx
       image: nginx
       ports:
       - containerPort: 80
```
2. Odpalono kontener i sprawdzono czy działa:\
Komenda:\
```
kubectl apply -f plik.yaml
```
![](Screenshot_11.png)  
3. Sprawdzenie czy wszystkie zmiany są widoczne na dashboardzie kubernetes:\
![](Screenshot_12.png)  
![](Screenshot_13.png)  
![](Screenshot_14.png)  
