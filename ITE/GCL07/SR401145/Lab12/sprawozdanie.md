# Sprawozdanie Lab12
## Szymon Rewilak

0. Plik wdrożenia *nginx-deply.yaml* z poprzenich zajęć:

```
--- 
apiVersion: apps/v1
kind: Deployment
metadata: 
  labels: 
    app: nginx
  name: nginx-deployment
spec: 
  replicas: 2
  selector: 
    matchLabels: 
      app: nginx
  template: 
    metadata: 
      labels: 
        app: nginx
    spec: 
      containers: 
        - 
          image: "nginx:1.16"
          imagePullPolicy: Never
          name: nginx
          ports: 
            - 
              containerPort: 8080

```

1. Sprawdzono dostępne pod's. Są uruchomione dwa - z obrazami hello-world z poprzedniego laboratorium.

![](screen/1-pods.png)  

2. Uruchomiono nowy pod z obrazem nginx:

![](screen/2-nginx.png)   

![](screen/3-pods.png)  

3. Zrobiono przekierowanie na port 8080:  
   
![](screen/4-nginx-run.png)    

4. Uruchomiono nginx na adresie *localhost:8080*:   

![](screen/4-nginx-run.png)    

5. Następnie uruchomiono deployment z wykorzystaniem przygotowanego wcześniej pliku *.yaml*:    

![](screen/6-yaml-deploy.png)  

Działający deployment na dashboardzie:

![](screen/7-dashboard-yaml.png)

## Przygotowanie nowego obrazu

1. Przygotowano obraz wykorzystujący alpine:
```
FROM alpine:3.4

RUN apk update
RUN apk add vim
RUN apk add curl
```

2. Następnie utworzono obraz, który się zbuduje, lecz wyrzuci błąd przy uruchomieniu kontenera:
```
FROM alpine:3.4

RUN apk update
CMD apk -s BAD_COMMAND
```
3. Budowa działającego obrazu:  

![](screen/10-docker-good.png)
![](screen/11-docker-good-2.png)  

4. Budowa niedziałającego obrazu:    

![](screen/12-docker-bad.png)  

5. Zbudowane obrazy:  

![](screen/13-docker-images.png)  

6. Uruchomienie błędnego obrazu kończy się błędem:

![](screen/21-dockerfile-bad.png)  

![](screen/20-dockerfile-bad.png)  


## Zmiany w deploymencie

1. Zmieniono liczbę replik na 6:  

![](screen/14-6-replicas.png)  

Uruchomienie:

![](screen/15-6-replicas.png)

2. Zmniejszono liczbę replik do 1:
   
![](screen/16-1-replica.png)

Uruchomienie:

![](screen/17-1-replica.png)

3. Zmniejszono liczbę replik do 0:  

![](screen/18-0-replicas.png)

Uruchomienie:

![](screen/19-0-replicas.png)

4. Zmiana obrazu na *image-good*:

![](screen/22-image-good.png)

Uruchomienie:

![](screen/23-good-image.png)


5. Zmiana obrazu na *image-error*:  
   
![](screen/)

![](screen/25-image-err.png)

Uruchomienie:

![](screen/21-dockerfile-bad.png)


## Strategie wdrożenia: 

1. **Recreate**  
W tej strategii w miejsce starego deploymentu publikowany jest nowy:

![](screen/26-recreate.png)

Dzięki wykorzystaniu tej strategii nie jest konieczne usuwanie starego deploymentu przy publikowaniu nowego:

![](screen/27-recreate.png)

2. **Rolling Update**

W tej strategii stare pody są ubijane, a następnie uruchamiane jeszcze raz.  
Zmieniono liczbę maksymalnej liczby podów działających naraz na 2 (*maxSurge*) oraz maksymalną liczbę niedziałających podów (*maxUnavailable*)  
Liczbę replik ustawiono na 3, celem zweryfikowania działania strategii:  

![](screen/28-rolling-update.png)

Uruchomienie:

![](screen/29-rolling-update.png)

Jak widać, zostały utworzone 2 repliki, choć w specyfikacji założono liczbę replik równą 3.

3. **Canary** **Deployment** **workload**

Ta strategia polega na uruchomieniu dwóch podów, z czego jeden jest uruchomiomny w starej, a drugi w nowej wersji. Dzięki temu można w bezpieczny sposób wprowadzać zmiany do deploymentu, bez ryzyka utraty stabilnej wersji.