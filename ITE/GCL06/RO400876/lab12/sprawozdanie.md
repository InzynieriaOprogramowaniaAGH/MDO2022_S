# Rafał Olech - Sprawozdanie z laboratorium 12

## Cel i opis projektu:

Celem ćwiczeń była dalsza praca z kubernetesem. 



## Wykonanie ćwiczenia:

### 1. Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML.

* Zmiana liczby replik na 4.

Zawartość pliku `deploy.yaml`:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploy
  labels:
    app: mynginx1
spec:
  replicas: 4
  selector:
    matchLabels:
      app: mynginx1
  template:
    metadata:
      labels:
        app: mynginx1
    spec:
      containers:
      - name: mynginx1
        image: nginx
        imagePullPolicy: Never
        ports:
        - containerPort: 2222
```

* Wdrożenie za pomocą polecenia `kubectl apply -f deploy.yaml`:

![img](apply.PNG)


* Zbadanie stanu kubectl poleceniem `kubectl rollout status -f deploy.yaml`:

![img](rollout.PNG)


### 2. Przygotowanie nowego obrazu.

* Utworzenie nowej wersji obrazu, którego uruchomienie zwróci błąd:

Zawartość pliku `dockerfile_lab12`:

```
FROM nginx:latest
CMD [ "exit", "1" ]
```


* Uruchomienie pliku zwracającego błąd poleceniem `sudo docker build . -f dockerfile_lab12 -t project_with_error`:

![img](docker_build.PNG)


* Wyświetlenie aktualnie działających obrazów za pomocą `sudo docker images`. Wśród nich jest obraz o nazwie `project_with_error`:

![img](sudo_docker_images.PNG)


### 3. Zmiany w deploymencie.

* Zwiększenie liczby replik do 8 w pliku `deploy.yaml`:

![img](get_pods.PNG)
![img](dashboard_8.PNG)


* Zmniejszenie liczby replik do 1 w pliku `deploy.yaml`:

![img](repliki_1.PNG)
![img](dashboard_1.PNG)


* Zmniejszenie liczby replik do 0 w pliku `deploy.yaml`:

![img](repliki_0.PNG)


* Zastosowanie starszej/dobrej wersji obrazu poleceniem `kubectl describe pods nginx-deploy-7b945b9d7d-7bvk6`:

![img](dobra_wersja_obrazu.PNG)


* Zastosowanie nowej/błędnej wersji obrazu poleceniem `kubectl describe pods nginx-deploy-7dbc85df-cs44f`:

![img](zla_wersja.PNG)
![img](dashboard_zly.PNG)


* Wyświetlenie historii zmian poleceniem `kubectl rollout history deployment nginx-deploy`:

![img](history.PNG)


* Przywrócenie poprzednich wersji wdrożeż za pomocą polecenia `kubectl rollout undo deployment nginx-deploy`:

![img](rollout_undo.PNG)
![img](undo_dashboard.PNG)


