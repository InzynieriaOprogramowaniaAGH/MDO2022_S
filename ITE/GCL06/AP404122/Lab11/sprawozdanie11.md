## Zainstalowanie i wystartowanie kubernetes'a
![Screen1](01-start_kub.png)
## Doinstalowanie kubectl
![Screen2](02-kubectl.png)
## Odpalenie dashboard'a
![Screen3](03a-dashboard.png)
![Screen4](03b-dashboard.png)
## Uruchomienie aplikacji w kontenerze bez użycia kubernetesa (aplikacja została zmieniona, ponieważ nie dało sie jej skonteneryzować)
![Screen5](04-ls.png)
## Uruchomienie aplikacji na stosie w kubernetes
![Screen6](06a-pods.png)
![Screen7](06b-pods.png)
![Screen8](06c-pods.png)
## Eksponuję port aplikacji
![Screen9](07a-forward.png)
![Screen10](07b-forward.png)
## Przekycie wdrożenia manualnego w plik wdrożenia
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-dep2
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 5
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```
## Dodanie replik
![Screen11](08a-deploy.png)
![Screen12](08b-deploy.png)