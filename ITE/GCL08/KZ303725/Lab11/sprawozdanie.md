# Lab11 - Krystian Zapart

### Zainstalowany kubectl
![vers](./screenshots/vers.png)
### Nody minikuba 
![nodes](./screenshots/nodes.png)
### Dashboard minikube'a
![dash](./screenshots/dash.png)
### Dockerfile aplikacji Calculator

```
FROM node:10

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]
```

### Uruchamianie aplikacji w kontenerze 
![image](./screenshots/image.png)

### Utworzenie Poda

```
apiVersion: v1
kind: Pod
metadata:
  name: kolkulaor
spec:
  containers:
  - name: calc
    image: calc
    imagePullPolicy: Never
    ports:
    - containerPort: 3000
    command: ["/bin/bash","-c","cd calculator && npm start"]

```

![pod](./screenshots/pod.png)
### Port-forward pod'a
![port](./screenshots/port.png)
### Uruchomiona aplikacja
![kubernetes](./screenshots/kubernetes.png)
![calc](./screenshots/calc.png)
