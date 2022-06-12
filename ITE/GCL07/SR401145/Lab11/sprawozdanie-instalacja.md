# Instalacja Kubernetes

1. Zainstalowano minikube:

```
minikube start --driver=docker
```
![](screen/1-minikube-start.png)

2. Pobrano kubectl:

```
minikube kubectl -- get po -A
```
![](screen/2-kubectl.png)

3. Uruchomiono dashboard:

```
minikube dashboard
```
![](screen/3-dashboard.png)

4. Sprawdzono łączność w przeglądarce:

![](screen/4-dasboard-browser.png)


## Deploy przykładowej aplikacji

1. Utworzono prosty deployment i wyeksponowano na port 8080:

```
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=NodePort --port=8080
```
![](screen/5-expose.png)

2. Dashboard po deploymencie:

![](screen/6-deploy.png)

3. Uzyskano adres url uruchomionego deploymenta:

```
minikube service hello --url

```

![](screen/7-url.png)

4. Uruchomiono deployment w przeglądarce:

![](screen/8-hello-browser.png)
