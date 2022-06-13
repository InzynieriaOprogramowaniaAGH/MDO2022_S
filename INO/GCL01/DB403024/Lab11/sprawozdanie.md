# Lab 11

- Wybieram na stronie minikube odpowiednie ustawienia w celu instalacji minikube

![fota](1.png)

![fota](2.png)

- Proba odpalenia minikube skonczyla sie niepowodzeniem przez zbyt mala ilosc rdzeni

![fota](3.png)

![fota](4.png)

- elegancko

![fota](5.png)

- Sprawdzenie dzialania oraz dodania aliasu

![fota](6.png)

- Odpalenie minikube dashboard

![fota](9.png)

![fota](10.png)

- port forwarding 

![fota](11.png)

![fota](12.png)

- Wszystko smiga
- 
![fota](13.png)

- Zrezygnowalem z pracy na irssi na potrzebe tego zadania, uzywam servera apache httpd

![fota](14.png)
 
- Wygenerowany za pomoca kompose plik yaml, wygenerowany z `docker-compose.yml`:

```
version: "3"

services:
  httpd:
    image: httpd:latest
    ports:
      - "8080:80"
```

![fota](15.png)

- Dzialajacy obraz po komendzie `minikube kubectl -- apply -f httpd-deployment.yaml

![fota](16.png)
