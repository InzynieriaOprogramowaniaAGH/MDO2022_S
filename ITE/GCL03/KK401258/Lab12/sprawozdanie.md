Kamil Kalisztan <br>
WIMiIP, IT, sem.: VI <br>
DevOps GCL03

- - -

# Sprawozdanie

## Instrukcja XII

# Wdrażanie na zarządzalne kontenery: Kubernetes (2)

--- 

### Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML
 * Upewnij się, że posiadasz wdrożenie z poprzednich zajęć zapisane jako plik
 * Wzbogać swój obraz o 4 repliki
 * Rozpocznij wdrożenie za pomocą ```kubectl apply```
 * Zbadaj stan za pomocą ```kubectl rollout status```

 #### Wykonane kroki:
 * uruchomiłem minikube'a oraz dashboard
 * zmodyfikowałem plik utworzony na poprzednich zajęciach - deploy.yml - zmieniając w nim liczbę replik z 5 na 4
 ```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-nginx-deploy-2
spec:
  selector:
    matchLabels:
      app: devops-nginx-deploy-2
  replicas: 4
  template:
    metadata:
      labels:
        app: devops-nginx-deploy-2
    spec:
      containers:
      - name: devops-nginx
        image: nginx
        ports:
        - containerPort: 80
 ```
 * Wdrożyłem zmiany
  >```kubectl apply -f deploy.yml```
 * Zbadałem stan 
  >```kubectl rollout status -f deploy.yml```

![z_01.png](./z_01.png)
![z_02.png](./z_02.png)
![z_03.png](./z_03.png)

### Przygotowanie nowego obrazu
 * Zarejestruj nową wersję swojego obrazu (w Docker Hub lub lokalnie)
 * Upewnij się, że dostępne są dwie co najmniej wersje obrazu z wybranym programem
 * Będzie to wymagać 
   * przejścia przez pipeline dwukrotnie, lub
   * ręcznego zbudowania dwóch wersji, lub
   * przepakowania wybranego obrazu samodzielnie np przez ```commit```
 * Przyotuj wersję obrazu, którego uruchomienie kończy się błędem
 
 #### Wykonane kroki:
 
 * Utworzyłem dockerfile'a, który korzysta z obrazu nginx a następnie zwraca kod błędu 1:
  ```
FROM nginx:latest

CMD ["exit","1"]
 ```
 * zbudowałem obraz
 > ```docker build -t nginx-err:latest -f Dockerfile-L12-err .```
 
![z_04.png](./z_04.png)
![z_05.png](./z_05.png)
 
  
### Zmiany w deploymencie
 * Aktualizuj plik YAML z wdrożeniem i przeprowadzaj je ponownie po zastosowaniu następujących zmian:
   * zwiększenie replik
   * zmniejszenie liczby replik do 1
   * zmniejszenie liczby replik do 0
   * Zastosowanie nowej wersji obrazu
   * Zastosowanie starszej wersji obrazu
 * Przywracaj poprzednie wersje wdrożeń za pomocą poleceń
   * ```kubectl rollout history```
   * ```kubectl rollout undo```

 #### Wykonane kroki:
 * zwiększyłem liczbę replik z 4 na 8 modyfikując plik deploy.yml
![z_06.png](./z_06.png)
![z_07.png](./z_07.png)
 
 * zmniejszyłem liczbę replik do 1
![z_08.png](./z_08.png)
![z_09.png](./z_09.png)
![z_10.png](./z_10.png)

 * zmniejszyłem liczbę replik do 0
![z_11.png](./z_11.png)
 
 * zastosował◙em nowy obraz - zmiana obrazu z nginx na nginx-err oraz zwiększenie replik z 0 na 4
![z_12.png](./z_12.png)
 
 * powróciłem do starego obrazu
![z_12.png](./z_13.png)
 
 * Przywróciłem poprzednie wersje wdrożeń za pomocą poleceń
   * ```kubectl rollout history```
   * ```kubectl rollout undo```
![z_14.png](./z_14.png)
![z_15.png](./z_15.png)
![z_16.png](./z_16.png)
 

### Kontrola wdrożenia
 * Napisz skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund)
 * Zakres rozszerzony: Ujmij skrypt w pipeline Jenkins (o ile minikube jest dostępny z zewnątrz)
 
 #### Wykonane kroki:
 * utworzyłem skrypt 
  ```
 #!/bin/bash
kubectl apply -f deploy.yml
sleep 60
kubectl rollout status deployment/devops-nginx-deploy-2
if [[ "$?" -ne 0 ]]; then
    echo "Err"
else
    echo "OK"
fi
```
 
* zmieniłem prawa dostępu do skrytptu i wykonałem go po uprzednim usunięciu deploya za pomocą dashboard'a
![z_17.png](./z_17.png)
 
### Strategie wdrożenia
 * Przygotuj wersje wdrożeń stosujące następujące strategie wdrożeń
   * Recreate
   * Rolling Update
   * Canary Deployment workload
 * Zaobserwuj i opisz różnice
 * Uzyj etykiet
 * https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
 
 #### Wykonane kroki:
 * Recreate
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-nginx-deploy-2
spec:
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: devops-nginx-deploy-2
  replicas: 2
  template:
    metadata:
      labels:
        app: devops-nginx-deploy-2
    spec:
      containers:
      - name: devops-nginx
        image: nginx-err
        ports:
        - containerPort: 80
```

![z_19.png](./z_19.png)
![z_20.png](./z_20.png)

* Rolling Update
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-nginx-deploy-2
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  selector:
    matchLabels:
      app: devops-nginx-deploy-2
  replicas: 6
  template:
    metadata:
      labels:
        app: devops-nginx-deploy-2
    spec:
      containers:
      - name: devops-nginx
        image: nginx
        ports:
        - containerPort: 80
```

![z_20.png](./z_20.png)
![z_21.png](./z_21.png)

* Canary Deployment workload

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-nginx-deploy-canary1
spec:
  selector:
    matchLabels:
      app: devops-nginx-deploy-2
  replicas: 6
  template:
    metadata:
      labels:
        app: devops-nginx-deploy-2
        version: "1.0"
    spec:
      containers:
      - name: devops-nginx
        image: nginx
        ports:
        - containerPort: 80
```

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-nginx-deploy-canary2
spec:
  selector:
    matchLabels:
      app: devops-nginx-deploy-2
  replicas: 6
  template:
    metadata:
      labels:
        app: devops-nginx-deploy-2
        version: "2.0"
    spec:
      containers:
      - name: devops-nginx
        image: nginx
        ports:
        - containerPort: 80
```


![z_22.png](./z_22.png)
![z_23.png](./z_23.png)
![z_24.png](./z_24.png)
![z_25.png](./z_25.png)

####  Zaobserwuj i opisz różnice
* Recreate
	- strategia powoduje zabicie wszytskich istniejących podów, a następnie utworzenie nowych
	
* Rolling Update
	- strategia ta jest używana domyślnie
	- jej zastosowanie sprawia, że aktualizacja liczby podów nie powoduje przerwy w działaniu podów - jeśli zwiększamy liczbę podów z 2 na 6, wówczas 2 pody ciągle działają, a pozostsałe 4 są uruchamiane - jeśli zmniejszamy liczbę podów z 6 do 4, wówczas 4 pody ni eprzestają działać, natomiast dwa są zamykane
	
* Canary Deployment
	- tworzone są dwa deplomenty, które działają równolegle
	- deploymenty różnią się wersjami i za pomocą jakiegoś serwisu możemy rozdysponować ruch pomiędzy dwa deploymenty 
	
* Podsumowując, Recreate powoduje przerwę w działaniu aplikacji, ponieważ najpierw pody są usuwane, a dopiero później stawiane nowe. W przypadku Rolling Update działające pody są dostępne, lecz działamy na tym samym deplomencie, czyli jeśli wprowadzane zmiany spowodują błąd, wówczas cierpi cały deploy. W Przypadku Canary mamy kontrolę nad wprowadzaniem nowej wersji poprzez stopniowe wprowadzanie nowej wersji na nowym deploymencie i obserwowanie tego co się z nim dzieje. Jeśli coś jest nie tak możemy przekierować ruch spowrotem na starszą wersję.  
 

