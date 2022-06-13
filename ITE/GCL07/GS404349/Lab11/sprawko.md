Zainstalowałem minikube
![dziaua](minikube.png)
Uruchomiłem kubernetes z driverem dockerowym
  minikube start --driver=docker
Nadałem uprawnienia aplikacji
  sudo usermod -aG docker $USER && newgrp docker
![pierwsze kroki](step1.png)
Pobrałem kubectl
  minikube kubectl
Uruchomiłem dashboard
  minikube dashboard
![w trudach, ale jest](dashboard.png)

Wykorzystałem prosty skrypt-stronę (całość to index.js),  która na curl portu 3000 zwróci domyślnie 5 nazw postaci z Gwiezdnych Wojen
![curled](curl.png)
stworzyłem Dockerfile
![file](dockerfile.png)
I obudowałem całość w kontener
![container](obraz.png)
Po uruchomieniu sprawdziłem połączenie
![jest poprawne](cont_curl.png)

Stworzyłem poda z gotowego kontenera
![jest pod](pod.png)
Stworzyłem plik konfiguracyjny poda **pod_def.yaml**
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: star-wars-deployment
  spec:
    selector:
      matchLabels:
        app: star-wars
    replicas: 2
    template:
      metadata:
        labels:
          app: star-wars
      spec:
        containers:
          - name: star-wars
            image: starwars-node
            ports:
              - containerPort: 3000
            imagePullPolicy: Never
Zaaplikowałem do kontenera
![alt_text](applied.png)

Otrzymałem działające pody
![działają](workingpods.png)


Sprawdziłem dashboard
![był dobry](browserview.png)]
Uruchomiłem poda według polecenia
![uruchomił się](uruchomienie poda.png)
Wyprowadziłem port 3000 poda na lokalny port 3070
![fajne to](wyprowadzenie.png)
Poprawiłem plik konfiguracyjny deploymentu zmieniając iloiśc replik na 5. Wymagało to  usunięcia obecnie żyhjącego deploymentu i reaplikowanie konfiguracji
  minikube kubectl delete deployment star-wars-deployment
  minikube kubectl -- apply -f pod_def.yaml
![jes wincyj](wincyj.png)
