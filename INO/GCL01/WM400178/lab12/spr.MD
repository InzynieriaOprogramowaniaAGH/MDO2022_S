# Kubernetes cz. 2 - Wiktor Młynarczyk

1. Z pierwszej części zajęć mam plik wdrożeniowy:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: todo-app
  labels:
    app: todo-app
spec:
  replicas: 4
  selector:
    matchLabels:
      app: todo-app
  template:
    metadata:
      labels:
        app: todo-app
        verion: "2"
    spec:
      containers:
      - name: todo-app
        image: 4202137/todo:latest
        ports:
        - containerPort: 8080
```
Od razu ustawiłem ilość replik na 4.

Wykonałem na nim następujące komendy:

# ![Alt text](3-komenda.PNG?raw=true)

I w dashboardzie mamy taki widok:

# ![Alt text](2-dashboard.PNG?raw=true)

2. Przygotowałem dwie nowe wersje mojego obrazu

Jedna jest zmodyfikowana po prostu o zmieniony napis:
# ![Alt text](4-modified.PNG?raw=true)

Druga wersja posiada nieprawidłowy wpis w CMD:
# ![Alt text](7-failure-dockerfile.PNG?raw=true)

Nie da się jej odpalić np. poprzez docker run:
# ![Alt text](7-potw.PNG?raw=true)

Tak prezentuje się mój dockerhub:
# ![Alt text](13-dasz.PNG?raw=true)

3. Następnie przeszedłem do zabawy wdrożeniem, czyli plikiem `.yaml`.

Na początku zwiększyłem liczbę replik do , potem ustawiłem do 0 i na koniec zmieniałem wersję obrazu.

# ![Alt text](8-10podow.PNG?raw=true)

# ![Alt text](9-1podow.PNG?raw=true)

# ![Alt text](10-0podow.PNG?raw=true)

Zmieniłem w jednym z nich werjsę obrazu na zmodyfikowana i zrobilem rollback tej wersji:
# ![Alt text](14-undoPNG.PNG?raw=true)

4. Przeszedłem następnie do napisania skryptu, który sprawdzi stan wdrozenia po 60 sekundach:
```
kubectl apply -f deploy2.yaml
timeout 60 kubectl rollout status deployment/todo-app
if [ $? -eq 0 ]
then
    echo "OK"
else
    echo "ERROR"
fi
   ```
Tak prezentuje się przykładowy wydruk skryptu:
# ![Alt text](5-skrypt-outpu.PNG?raw=true)
5. Przeszedłem do ostatniej części sprawozdania, która odpowiadała za zmiany strategii wdrażania

Zacząłem od strategi recreate (ią stara wersja jest zabijana i następuje wdrożenie nowej wersji):
```
strategy:
    type: Recreate
```

Następnie użyłem strategii Rolling Update (maxSurge określa  ilość podów które mogą zostać dodane w określonym czasie, a maxUnavaliabe oznacza ilość podów które mogą być niedostępne w czasie wdrożenia):

```
strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
```
A na końcu zastosowałem strategię Canary. W celu użycia tej strategii stworzyłem nowy plik .yaml z innym labelem:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: todo-app
  labels:
    app: todo-app-2
spec:
  replicas: 5
  selector:
    matchLabels:
      app: todo-app
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: todo-app
        version: "5"
    spec:
      containers:
      - name: todo-app
        image: 4202137/todo:modified
        ports:
        - containerPort: 8080
```

Tak się prezentuje zrzut ekranu z przebiegu wdrożen:
# ![Alt text](12-strategie-wdrPNG.PNG?raw=true)

`deploy3.yaml` to jest właśnie ten nowy plik .yaml.

Strategia  canary opiera się na wdrażaniu nowych wersji aplikacji obok stabilnych wersji produkcyjnych. Aktualne pody ze starej wersji zastepowane są nowymi.
Wszystkie pliki, które użyłem do ćwiczenia są dostępne na moim repozytorium
