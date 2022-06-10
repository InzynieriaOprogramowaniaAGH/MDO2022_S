# Instalacja minikube

- Pobrano oraz zainstalowano minikube
    `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
    `sudo install minikube-linux-amd64 /usr/local/bin/minikube`

    ![spheal](./screeny/1.png)
    
- za pomocą komendy `minikube start` włączono minikube
    ![spheal](./screeny/2.png)

- Sprawdzono działanie minikube
    `minikube kubectl -- get po -A`
    ![spheal](./screeny/3.png)

- Do pliku .bashrc dodano linię `alias kubectl="minikube kubectl--"`
    ![spheal](./screeny/4.png)

- Sprawdzono działanie
    ![spheal](./screeny/5.png)

- Po długich poszukiwaniach i myśleniu okazało się że linię należy wspisać w terminalu xd
    ![spheal](./screeny/7.png)
    ![spheal](./screeny/8.png)

- Za pomocą komendy `minikube dashoard` uruchomiono dashboard
    ![spheal](./screeny/6.png)

# Analiza posiadanego kontenera

Jako że deploy'owany przeze mnie program nie nadaje się do tego zadania (nie korzysta z żadnych portów), wykorystano gotowy obraz mysql

# Uruchomienie oprogramowania

- Uruchumiono kontener (w minikube) z odpowiednimi parametrami które określaja dostęp do bazy danych
    `kubectl run mysql-devops --image=mysql:5.6 --port 3306 --labels app=mysql_devops --env="MYSQL_ROOT_PASSWORD=password"`
    ![spheal](./screeny/9.png)

- Za pomocą komendy `kubectl get pods` sprawdzono poprawność wykonanego wyżej punktu
    ![spheal](./screeny/10.png)

- Sprawdzono zmiany w dashboardzie
    ![spheal](./screeny/11.png)

- Za pomocą komendy `kubectl port-forward mysql-devops 3000:3306` podłączono do kontenera port
    ![spheal](./screeny/12.png)

- Uruchomiono mysql w minikube 
    `kubectl exec --stdin -tt pod/mysql-devops -- /bin/bash`
    ![spheal](./screeny/13.png)
    ![spheal](./screeny/14.png)

- Utworzono bazę danych
    ![spheal](./screeny/15.png)

- zainstalowano program DBeaver

- Za pomocą DBeaver połączono się z utworzoną bazą danych
    ![spheal](./screeny/16.png)
    ![spheal](./screeny/17.png)

# Przekucie wdrożenia manualnego w plik wdrożenia

- Utworzono plik deploy.yml o zawartości:
```
apiVersion: apps/v1 
kind: Deployment
metadata:
  name: mysql
spec:
  replicas: 3
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - image: mysql:5.6
        name: mysql
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: password
        ports:
        - containerPort: 3306
          name: mysql
```
    ![spheal](./screeny/18.png)

- wdrożono poda za pomocą komendy `kubectl apply -f deploy.yml`
    ![spheal](./screeny/19.png)
    ![spheal](./screeny/20.png)
