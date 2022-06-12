# Sprawozdanie Lab 11

Sławomir Kotula

IT, DevOps, grupa lab 4

Data: 11.06.2022

# Instalacja minikube
![minikube](screeny/01.png)
![minikube](screeny/02.png)
# Instalacja kubectl
![kubectl](screeny/05.png)
# Sprawdzenie poprawności instalacji
![kubectl](screeny/06.png)
# Uruchomienie minukube
![minikube start](screeny/08.png)
# Uruchomienie dashboard
![dashboard](screeny/10.png)
![dashboard](screeny/09.png)
# Został stworzony kontener minikube
![docker ps](screeny/11.png)
# Stworzenie node-a z nginx
```
minikube kubectl run -- wdrozenie-nginx --image=nginx --port=80 --labels app=wdrozenie-nginx
```
![nginx](screeny/12.png)
![nginx](screeny/13.png)
# Przekierowanie portów
```
minikube kubectl port-forward wdrozenie-nginx 1234:80
```
![nginx](screeny/14.png)
# Aplikacja działa na przekierowanym porcie
![nginx](screeny/15.png)
# Stworzono plik nginx-deploymnet.yaml
![yaml](screeny/18.png)
# Stworzono pody na podstawie pliku .yaml
![yaml](screeny/16.png)
![yaml](screeny/17.png)