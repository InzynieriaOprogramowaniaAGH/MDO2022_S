## Lab 12

### Ustawienie ilości replik w deploymencie 
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: calculator
  labels:
    app: calculator
spec:
  replicas: 4
  selector:
    matchLabels:
      app: calculator
  template:
    metadata:
      labels:
        app: calculator
    spec:
      containers:
      - name: calculator
        image: calc
        imagePullPolicy: Never
        ports:
        - containerPort: 3000
```
#### Status podów i deploymentu 
![plot](./screenshots/pods.png)

![plot](./screenshots/plot.png)

### Utworzenie nowych wersji obrazów 

wersja z env 2
```
FROM node:alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production
COPY . .

ENV version=2

EXPOSE 3000
CMD [ "npm", "start" ]

```
wersja exit 
```
FROM node:alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production
COPY . .

ENV version=2

EXPOSE 3000
CMD [ "npm", "1" ]

```

utworzone obrazy 

![plot](./screenshots/images.png)

### Zmiany w deploy 

#### ilość replik: 8
![plot](./screenshots/8.png)

#### status 
![plot](./screenshots/8stat.png)

#### ilość replik: 1
![plot](./screenshots/1.png)

#### status 
![plot](./screenshots/1stat.png)

#### ilość replik: 0 
![plot](./screenshots/0.png)

#### status 
![plot](./screenshots/0stat.png)

#### Nowy obraz:
![plot](./screenshots/work.png)

![plot](./screenshots/workstat.png)

![plot](./screenshots/workplot.png)

#### Obraz wersja Exit 
![plot](./screenshots/exit.png)

![plot](./screenshots/exitstat.png)

![plot](./screenshots/exitplot.png)

#### Przywracanie wersji 
![plot](./screenshots/rollout.png)

### Kontrola wdrożenia

Napisano skrypt porównujący output polecenia "kubectl get deployment ..."
![plot](./screenshots/script.png)

![plot](./screenshots/out.png)
### Strategie wdrożenia 

Recreate pozwala na jednoczesne usunięcie i odtworzenie wszytkich podów

Rolling update pojedyńczo usuwa powstałe pody
