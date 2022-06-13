**SPRAWOZDANIE 10**

**Wdrażanie na zarządzalne kontenery: Kubernetes (1)**

##
**Instalacja klastra Kubernetes:**

Użycie poleceń zawartych na stronie:

-   [https://minikube.sigs.k8s.io/docs/start/](https://minikube.sigs.k8s.io/docs/start/)

Zaopatrzenie się w implementację stosu k8s: minikube:

`curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

Przeprowadzenie instalacji poleceniem:

`sudo install minikube-linux-amd64 /usr/local/bin/minikube`

Wynik:

![1](https://user-images.githubusercontent.com/92218468/171908135-870746d7-15fd-4ddc-843b-5345e85f79f5.JPG)


Zainstalowana wersja:

![4](https://user-images.githubusercontent.com/92218468/171908161-2464d0fa-5e18-4fb1-8d39-ecd3192ac99e.JPG)


Zaopatrzenie się w polecenie kubectl:

Pobranie kubectl:

`curl -LO "https://dl.k8s.io/release/$(curl -L -s 
https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
![5](https://user-images.githubusercontent.com/92218468/171908186-bb127d2b-ff8b-42b4-a61c-affb035e7b84.JPG)


Zainstalowanie kubectl:

`sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`
![8](https://user-images.githubusercontent.com/92218468/171908202-044c08dc-3e61-4ea5-918e-0199c06d127f.JPG)



Uruchomienie Kubernetes'a poleceniem `minikube start`:
![2](https://user-images.githubusercontent.com/92218468/171908225-ebdc4e0a-e1b9-4dfc-b730-52911182eb68.JPG)


Pojawia się błąd, który należy zniwelować dodając użytkownika do grupy docker poleceniem:

`sudo usermod -aG docker $USER && newgrp docker`

![3](https://user-images.githubusercontent.com/92218468/171908255-b4e952d4-a6eb-4032-9300-c4639f821c3b.JPG)


Sprawdzenie dostępu do klastra poleceniem `kubectl get po -A`:
![10](https://user-images.githubusercontent.com/92218468/171908268-b27e6039-e6e0-440e-9ecd-b7cbb246c310.JPG)


Dodanie aliasu poleceniem `alias kubectl="minikube kubectl --"`:

![11](https://user-images.githubusercontent.com/92218468/171908283-15ce14b5-1fe6-40ea-bd7c-a6e0c45eb51c.JPG)


Uruchomienie Dashboard poleceniem `minikube dashboard`:
![12](https://user-images.githubusercontent.com/92218468/171908291-2369f907-1e8b-4412-98a2-3e462a9a944b.JPG)
![13](https://user-images.githubusercontent.com/92218468/171908300-56c48d18-917f-425d-8ecf-6297b165523d.JPG)

##
**Analiza posiadanego kontenera:**

Aplikacja użyta w poprzednich projektach nie może zostać wykorzystana w tym ćwiczeniu, ponieważ jest to rozszerzenie innej aplikacji (nie jest to program samodzielny), w związku z czym nie można jej uruchomić w kontenerze. W ramach tego ćwiczenia został wykorzystany nginx.


Uruchomienie kontenera z nginx poleceniem `docker run --name nginx -p 80:80 -d nginx`:
![14](https://user-images.githubusercontent.com/92218468/171908317-b878cb77-ef74-484b-9bb5-55b99b13fc75.JPG)


Wyświetlenie utworzonych kontenerów poleceniem `sudo docker ps`:
![15](https://user-images.githubusercontent.com/92218468/171908334-991188ec-a5b4-4524-a6b4-7793f7ab4df6.JPG)


##
**Uruchamianie oprogramowania:**

Kontener uruchomiony w minikubie zostanie automatycznie wyposażony w poda (`minikube kubectl run -- nginx --image=nginx --port=80 --labels app=nginx`):

![17](https://user-images.githubusercontent.com/92218468/171908355-a2a9aa1a-bf05-4e0f-80ea-ad0723492060.JPG)


Przedstawienie, że pod działa poprawnie:

Dashboard:
![19](https://user-images.githubusercontent.com/92218468/171908369-3e7eb20d-6d2f-458d-9fe9-e3634d816e7e.JPG)


Kubectl (`kubectl get pods`):

![18](https://user-images.githubusercontent.com/92218468/171908380-ed230abd-3074-440e-9d99-4de4805610e2.JPG)


Wyprowadzenie portu poleceniem `kubectl port-forward nginx 2222:80`:

![21](https://user-images.githubusercontent.com/92218468/171908393-5e1e0311-b887-4fe4-9c0a-130762b1fdc4.JPG)


Sprawdzenie działania:
![20](https://user-images.githubusercontent.com/92218468/171908405-43883703-79bc-42d6-8242-0f03b21258b6.JPG)

 


##

**Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie):**

Stworzenie pliku wdrożenia wraz z replikami d.yml:
![24](https://user-images.githubusercontent.com/92218468/171908421-2b3d92cf-4fa6-416f-9173-309272123808.JPG)

Zawartość:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jp-nginx-deployment
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
```
Zaaplikowanie pliku (`kubectl apply -f d.yml`) oraz sprawdzenie działania podów (`kubectl get pods -o wide`):
![25](https://user-images.githubusercontent.com/92218468/171908439-011a33af-84bf-4d5d-8bb3-c17a3227a6f8.JPG)
![26](https://user-images.githubusercontent.com/92218468/171908451-71be69a9-7db6-4d9d-ae37-edf179af5424.JPG)


Sprawdzenie w dashboard:
![27](https://user-images.githubusercontent.com/92218468/171908461-39cdda62-13eb-4d40-b6f6-079c1fb8e24d.JPG)

