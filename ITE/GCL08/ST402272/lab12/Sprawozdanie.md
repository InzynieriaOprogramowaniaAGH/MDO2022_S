# Szymon Twardosz - Lab 12 DevOps

## Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

Modyfikacja utworzonego w poprzednich laboratoriach pliku `pod-test2.yml` i zmienienie ilości replik na 4

```
spec:
  replicas: 4
```

Utworzenie poda oraz zbadanie jego stanu za pomocą polecenia `kubectl rollout status -f pod-test2.yml`

![screen19](screenshots/19.png)

Wyświetlenie statusu w dashboardzie:

![screen20](screenshots/20.png)

Modyfikacja utworzonego w poprzednich laboratoriach pliku `pod-test2.yml` i zmienienie ilości replik na 0

```
spec:
  replicas: 0
```

Dashboard:

![screen21](screenshots/21.png)

## Przygotowanie nowego obrazu

W celu skorzystania z DockerHub'a zalogowano się na maszynie wirtualnej do konta Dockera

![screen22](screenshots/22.png)

Utworzenie obrazu z dopiskiem `modified` (jest to ten sam Dockerfile, który był w poprzednych laboratoriach)

![screen23](screenshots/23.png)

I wypchnięcie go na dockerhuba

![screen24](screenshots/24.png)

Usunięcie kilku niezbędnych linii w Dockefilu (na przykład tych, w których występuje instalacja za pomocą npm), a następnie znowu zbudowanie obrazu i wrzucenie go na dockerhub (tym razem z dopiskiem `fail`)

![screen25](screenshots/25.png)

Obrazy udało się pomyślnie wrzucić (widok z przeglądarki z konta w dockerhubie)

![screen26](screenshots/26.png)

Zmiana kilku linii w pliku `pod-test2.yml` (usunięcie `imagePullPolicy: Never`, pobieranie obrazu z dockerhuba jeśli nie będzie go w repozytorium lokalnym)

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: express
  labels:
    app: express
spec:
  replicas: 1
  selector:
    matchLabels:
      app: express
  template:
    metadata:
      labels:
        app: express
    spec:
      containers:
      - name: express
        image: sgartkink/nodejs_app:modified
        ports:
        - containerPort: 3200
```

Działanie w dashboardzie (ta wersja jest wersją poprawną, więc na zielono)

![screen27](screenshots/27.png)

Teraz to samo, ale w `pod-test2.yml` zmieniam `image: sgartkink/nodejs_app:modified` na `image: sgartkink/nodejs_app:fail`, czyli wersję, która nie działa, i w efekcie mamy trochę czerwonego

![screen28](screenshots/28.png)

Przywrócenie poprzednich wersji wdrożeń (za pomocą polecenia `kubectl rollout history` (umożliwia wyświetlenie historii wersji w wersji ogólnej jak i trochę bardziej rozbudowanej)

![screen29](screenshots/29.png)

A następnie powrót do poprzedniej wersji (dokładnie to 1, czyli modified) za pomocę `kubectl rollout undo`

![screen30](screenshots/30.png)

## Kontrola wdrożenia

W tym kroku utworzono prosty skrypt w bashu, który sprawdza czas tworzenia się wdrożenia. Jeśli czas jest większy niż 60 sekund skrypt zwraca informacje o błędzie

```
#!/bin/bash

if [ $# -ne 2 ]; then
	echo "This script requires exactly 2 arguments."
	exit 1
fi

name=$1
deployment=$2

kubectl apply -f $name
timeout 60 /usr/local/bin/minikube kubectl rollout status $deployment

if [ $? -eq 0 ]; then
	echo "SUCCESS."
    exit 0
else
	echo "FAILURE."
    exit 1
fi
```

Efekt uruchomienia skryptu (2 razy)

![screen31](screenshots/31.png)
