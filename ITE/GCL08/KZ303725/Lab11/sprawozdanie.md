# Lab11 - Krystian Zapart

###Zainstalowany kubectl
![vers](./screenshots/vers.jpg)
###node 
![nodes](./screenshots/nodes.jpg)
###Dashboard minikube'a
![dash](./screenshots/dash.jpg)
###Dockerfile aplikacji Calculator

```
FROM node:10

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]
```

###Uruchamianie aplikacji w kontenerze 
![image](./screenshots/image.jpg)

###Utworzenie Poda

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

![pod](./screenshots/pod.jpg)

###Uruchomiona aplikacja
![kubernetes](./screenshots/kubernetes.jpg)
![calc](./screenshots/calc.jpg)