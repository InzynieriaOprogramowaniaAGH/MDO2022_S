# Sprawozdanie 11

## Wdrażzanie na zarządzalne kontenery: Kubernetes

### Użycie poleceń zawartych na stronie: https://minikube.sigs.k8s.io/docs/start/

Zaopatrzenie się w implementację stosu k8s: minikube:
- `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

Przeprowadzenie instalacji poleceniem:
- `sudo install minikube-linux-amd64 /usr/local/bin/minikube`

Sprawdzenie zainstalowanej wersji poleceniem:
- `minikube version`

![image](https://user-images.githubusercontent.com/72975469/172617449-c295ab61-4b91-4de7-b194-611100d99106.png)

### Zaopatrzenie się w polecenie kubectl:

Pobranie kubectl poleceniem:
- `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`

Zainstalowanie kuubectl:
- `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`

Uruchomienie Kubernetes'a poleceniem:
- `minikube start --driver=docker`

Użyto polecenia z opcją --driver ponieważ samo polecenie minikube start wyrzucało błąd "Exitting due to DRV_NOT_HEALTHY"

![image](https://user-images.githubusercontent.com/72975469/172621092-31d5f3d0-282e-4b78-951d-b4c968460471.png)

Sprawdzenie dostępu do klastra za pomocą polecenia:
- `kubectl get po -A`

![image](https://user-images.githubusercontent.com/72975469/172621106-932aae4b-52ea-4b08-b700-a544119bd276.png)

Dodanie aliasu za pomocą polecenia:
- `alias kubectl="minikube kubectl --"`

Uruchomienie Dashboard za pomocą polecenia:
- `minikube dashboard`

![image](https://user-images.githubusercontent.com/72975469/172621222-9e39788c-bc5e-4a1a-8951-4129ee265d72.png)

Uruchomienie w przeglądarce wyświetlonego linku:

![image](https://user-images.githubusercontent.com/72975469/172625815-78cfa64f-9289-4bf9-b092-bd3f2a1bcdac.png)

### Analiza posiadanego kontenera:
Aplikacja użyta w poprzednich projektach nie wyprowadza portów użyto aplikacji nginx

Uruchomienie kontenera za pomocą polecenia:
- `docker run --name nginx -p 80:80 -d nginx`

![image](https://user-images.githubusercontent.com/72975469/172621116-f96830f7-78a6-4672-b5e4-98a662233a0b.png)

Ukazanie poprawnego uruchomienia kontenera za pomocą polecenia:
- `docker ps`

![image](https://user-images.githubusercontent.com/72975469/172621378-d2dbdbda-1462-44a1-bf83-f21b0ab5698a.png)

### Uruchamienie oprogramowania

Kontener uruchomiony w minikube zostanie automatycznie wyposażony w poda za pomocą polecenia:
- `minikube kubectl run -- nginx --image=nginx --port=80 --labels app=nginx`

![image](https://user-images.githubusercontent.com/72975469/172621684-ab4743b1-024e-4553-95ea-8985b5c2eca1.png)

Ukazanie poprawnego działania w dashboard:

![image](https://user-images.githubusercontent.com/72975469/172622013-a258d00d-c8c1-4806-b955-6e0cb9529de6.png)

Sprawdzenie poprawności poda za pomocą poleceniem:
- `kubectl get pods`

Wyprowadzenie portu za pomocą polecenia:
- `kubectl port-forward nginx 2222:80`

Sprawdzenie poprawności działania po wpisaniu w przeglądarce:
- `localhost:2222`

![image](https://user-images.githubusercontent.com/72975469/172622298-f08b3799-1bba-4167-8463-5bd8a2cd7dc4.png)

### Przkucie wdrożenia manualnego w plik wdrożenia

Stworzenie pliku wdrożenia wraz z replikami i zapisanie go jako 
- `d.yml`

![image](https://user-images.githubusercontent.com/72975469/173074083-530db151-4acc-4554-9bea-4c3947828a50.png)



Zaaplikowanie pliku za pomocą polecenia:
- `kubectl apply -f d.yml`

Sprawdzenie działania podów za pomocą polecenia:
- `kubectl get pods -o wide`

![image](https://user-images.githubusercontent.com/72975469/172622693-e48cdc46-b846-482c-a728-2c348b5616e7.png)

Sprawdzenie poprawności w dashboard:

![image](https://user-images.githubusercontent.com/72975469/172622858-5c6e4801-d8c3-4016-8439-529468890ca8.png)


### Zawartość pliku `d.yml`

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: AP-nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        imagePullPolicy: Never
        ports:
        - containerPort: 2222
  

