# Lab11 Bartosz Tonderski

## Instalacja minikube

### Instalacja przebiegała jak opisano w dokumentacji minikube
### Jedyna róznica polegała w komendzie uruchamiającej.
``kubectl start --driver=docker``

### zainstalowany kubectl:

![zdj1](./Screenshots/kubectl-ver.png)

### Uruchomienie dashboarda

``kubectl dashboard``

![zdj2](./Screenshots/kubectl-node.png)

![zdj3](./Screenshots/kube-dash.png)

## Przygotowanie Dockera oraz obrazu do uruchomienia w pod'ach

### zbudowanie obrazu Docker za pomoca dockerfile przygotowanego przez deploy


```Dockerfile
FROM node:10

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]

```

![zdj4](./Screenshots/docker-build.png)

## URuchomienie aplikacji z obrazu w Docker

![zdj5](./Screenshots/docker-build.png)

![zdj6](./Screenshots/test-build-docker.png)

## Utworzenie poda

```Yaml
apiVersion: v1
kind: Pod
metadata:
  name: calcium
spec:
  containers:
  - name: calcium
    image: calcium
    imagePullPolicy: Never
    ports:
    - containerPort: 3000
    command: ["/bin/bash","-c","cd calculator && npm start"]
```

![zdj7](./Screenshots/pod-apply.png)

![zdj8](./Screenshots/pod_launch.png)

## Forward portów

![zdj_port](./Screenshots/port.png)

## deploy

### Yaml deploya:

```Yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: calcium
  labels:
    app: calcium
spec:
  replicas: 3
  selector:
    matchLabels:
      app: calcium
  template:
    metadata:
      labels:
        app: calcium
    spec:
      containers:
      - name: calcium
        image: calcium
        imagePullPolicy: Never
        ports:
        - containerPort: 3000
```

![zdj9](./Screenshots/pod-deploy.png)

![zdj10](./Screenshots/pod-deploy-graphic.png)


