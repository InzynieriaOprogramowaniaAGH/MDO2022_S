# Zajęcia 11
### 2022-05-23 -- 2022-05-27

# Wdrażanie na zarządzalne kontenery: Kubernetes (1)

## Zadania do wykonania
### Instalacja klastra Kubernetes
 * Zaopatrz się w implementację stosu k8s: minikube
 
 ![curl minikube](Pictures/1.png?raw=true)
 
 ![minikube version](Pictures/2.png?raw=true)
 
 * https://minikube.sigs.k8s.io/docs/start/
 * Przeprowadź instalację, wykaż poziom bezpieczeństwa instalacji
 * zaopatrz się w polecenie kubectl
 
 ![curl kubectl](Pictures/3.png?raw=true) 
 
 ![curl checksum](Pictures/4.png?raw=true)
 
 ![kubectl install/version](Pictures/5.png?raw=true)
 
 * Uruchom Kubernetes, pokaż działający kontener/worker
 
 ![sudo groupadd](Pictures/6.png?raw=true) 
 
 ![minikube start](Pictures/7.png?raw=true)
 
 * Zmityguj problemy wynikające z wymagań sprzętowych lub odnieś się do nich (względem dokumentacji)
 * Uruchom Dashboard, otwórz w przeglądarce, przedstaw łączność
 
 ![dashboard](Pictures/8.png?raw=true)
 
 ![dashboard](Pictures/9.png?raw=true) 
 
 * Zapoznaj się z koncepcjami funkcji wyprowadzanych przez kubernetesa (pod, deployment itp)
 
### Analiza posiadanego kontenera
 * Projekt został wymieniony na obraz postgres
   
### Uruchamianie oprogramowania
 * Uruchom kontener na stosie k8s
 * Kontener uruchomiony w minikubie zostanie automatycznie ubrany w pod.
 * ```minikube kubectl run -- <nazwa-wdrożenia> --image=<obraz-docker> --port=<wyprowadzany port> --labels app=<nazwa-wdrożenia>```
 
 Po uprzednim zaciągnięciu obrazu postgresa uruchomiono kontener poleceniem `minikube kubectl run -- postgres --image=postgres --port=5432 --labels app=postgres --env="POSTGRES_PASSWORD=admin"`
 
 Aby wykazać, że działa użyto komendy `kubectl get pods` oraz `kubectl describe pod postgres`
 
 ![pod running](Pictures/10.png?raw=true)
 
 ![dashboard](Pictures/11.png?raw=true) 
 
 * Wyprowadź port celem dotarcia do eksponowanej funkcjonalności
 * ```kubectl port-forward <nazwa-wdrożenia> <LO_PORT>:<PODMAIN_CNTNR_PORT> ```
 * Przedstaw komunikację z eskponowaną funkcjonalnością
 
 Zainstalowano klienta postgresa:
 
 ![postgresql client](Pictures/12.png?raw=true)  
 
 Wyprowadzono port:
 
 ![port forward](Pictures/17.png?raw=true)
 
 Połączono się z eksponowaną funkcjonalnością:
 
 ![postgresql](Pictures/13.png?raw=true)  
 
### Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)
 * Zapisanie wdrożenia jako plik YML
 * Dodanie replik
 * ```kubectl apply``` na pliku
 
 Utworzono plik `deployment.yml`:
 
 ```
 apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
spec:
  selector:
    matchLabels:
      app: postgres
  replicas: 2 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: postgres
    spec:
      containers:
      - name: postgres
        image: postgres
        ports:
        - containerPort: 5432
        env:
            - name: POSTGRES_PASSWORD
              value: admin
 ```
 
 Wykonano komendę `kubectl apply -f deployment.yml`, a następnie sprawdzono obecność nowych podów oraz wdrożenia:
 
 ![postgresql](Pictures/14.png?raw=true)
 
 ![postgresql](Pictures/15.png?raw=true)
 
 ![postgresql](Pictures/16.png?raw=true)   
 
