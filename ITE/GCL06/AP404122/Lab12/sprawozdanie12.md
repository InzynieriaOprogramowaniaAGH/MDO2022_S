# Przygotowanie nowego obrazu
## Dodanie 4 replik do kody wdrożenia
![Screen1](01-add.png)
## Wdrożenie za pomocą kubectl oraz sprawdzenie stanu
![Screen2](02-deploy.png)
## Stworzenie błędnego obrazu
![Screen3](03-failed.png)
# Zmiany w deploymencie
## Zwiększenie ilości replik o jeden
![Screen4](04-1_more.png)
## Ustawienie ilości replik na jeden
![Screen5](05a-just_one.png)
![Screen6](05b-just_one.png)
## Ustawienie ilości replik na zero
![Screen7](06a-zero.png)
![Screen8](06b-zero.png)
## Ustawienie niepoprawnego obrazu
![Screen9](07a-failed_img.png)
![Screen10](07b-failed_img.png)
## Ustawienie najnowszego obrazu nginx
![Screen11](08a-return.png)
![Screen12](08b-return.png)
## Sprawdzenie historii
![Screen13](09-history.png)
## Szczegóły pojedyńczej rewizji
![Screen14](10-revision.png)
## Roolback do niepoprawnego obrazu
![Screen15](11-rollback.png)
![Screen16](11b-rollback.png)
# Kontrola wdrożenia
## Stworzenie skryptu
```bash
#!/bin/bash
kubectl apply -f config-nginx.yml
sleep 60
kubectl rollout status deployment.apps/nginx-dep3
if [ $? -eq 0 ]; then
	echo "Everything is fine!"
else
	echo "Something went wrong!"
fi
```
![Screen17](12-scipt.png)
![Screen18](12b-scipt.png)
# Strategie wdrożenia
## Recreate
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-dep3
spec:
  strategy:
    type: Recreate
  replicas: 9
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
        image: nginx:latest
        ports:
        - containerPort: 80
```
Strategia typu Recreate spowoduje zakońćzenie wszystkich uruchomionych wystąpień, a następnie ponowne ich utworzenie w nowszej wersji.
## Rolling update
Domyślne ustawienie, widzieliśmy działanie podczas zmiany replik
## Canary
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-dep3
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 1
  template:
    metadata:
      labels:
        app: nginx
        version: v1.0.0
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80

```
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-dep3
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 3
  template:
    metadata:
      labels:
        app: nginx
        version: v1.2.2
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```
Jedna replika nowej wersji została wydana wraz ze starą wersją. Następnie po pewnym czasie i jeśli nie zostanie wykryty żaden błąd, zwiększ liczbę replik nowej wersji i usuń stare wdrożenie.