# Sprawozdanie Lab11 Damian Zyznar ITE-GCL08

<br>

**Cel labortariów:** Wdrażanie na zarządzakne kontenery Kubernetes

</br>


# Instalacja klastra Kubernetes
Aby zaopatrzyć się w implementację stosu k8s: minikube potzrbne było narzędzie curl. Pierwszym krokiem była jego instalacja. Następnie pobrano i zainstalowano minikube'a

![minikube_install](../Lab11/screenshots/minikube_install.png)

Pobranie pakietów instalacyjnych kubectl, oraz sprawdzenie sumy kontrolnej, co znacząco wzmacnia bezpieczeństwo instalacji:

![kubectl_install](../Lab11/screenshots/kubectl_install.png)

Instalacja kubestl:

![kubectl_install2](../Lab11/screenshots/kubectl_install2.png)

Próba pierwszego uruchomienia minikube:

![error](../Lab11/screenshots/error.png)

Wykonano zaleconą operację dodania użytkownika do grupy docker i uruchomiono minikube.

![minikube_start](../Lab11/screenshots/minikube_start.png)

Wyświetlenie działających node'ów i pod'ów. Klaster składa się z jednego noda - master.

![kubectl_nodes](../Lab11/screenshots/kubectl_nodes.png)

Uruchomienie dashbord'u

![minikube_dashboard](../Lab11/screenshots/minikube_dashboard.png)

Największym wymaganiem sprzętowym do instalacji kubernetesa jest 20 GB wolnej przestrzeni dyskowej. Wymagania dotyczące procesora i pamięci RAM nie są zbyt wygórowane i zostaną spełnione przez dużą większość obecnych komputerów. Minikube potrzebuje również środowiska konteneryzajci, w tym przypadku jest to docker.

# Analiza posiadanego kontenera

Aplikacja używana we wcześniejszych laboratoriach jest napisania w Node.Js i podczas uruchomienia przykładowych skryptów udostępnia port 3000, więc aplikacja jak najbardziej nadaje się do wykonania tego laboratorium.

Utworzono następujący Dockerfile:

```
FROM node:latest

WORKDIR /usr/app

COPY package*.json ./

RUN npm install

COPY . .
EXPOSE 3000
CMD [ "node", "examples/content-negotiation"]
```

Uruchamiany tu jest przykładowy skrypt ```content-negotiation```, oraz udostępniany jest port 3000.

Build obrazu:

![docker_build](../Lab11/screenshots/docker_build.png)

Uruchomienie kontenera i przekierowanie portu 3000 z kontenera na port 49160 w localhost, oraz przedstawienie działania.

![docker_run](../Lab11/screenshots/docker_run.png)


# Uruchamianie oprogramowania

Utworzenie pliku definicji pod.yml dla aplikacji.

```
apiVersion: v1
kind: Pod

metadata:
  name: express
  labels:
    app: express

spec:
  containers:
    - name: express
      image: node-web-app
      imagePullPolicy: Never
      ports:
      - containerPort: 3000
      
```
Utworzono pod'a za pomocą polecenia ```kubectl -y apply -f pod.yml``` i sprawdzono jego działanie:
=-
![kubectl_error](../Lab11/screenshots/kubectl_error.png)

Pod nie działa. Jest to spowodowane tym, że w node, w którym obecnie pracujemy nie ma docker image o nazwie ```node-web-app```. Ustawienie w pliku definicji ```imagePullPolicy: Never``` mówi, że obraz nie będzie pobierany z internetu, tylko będzie poszukiwany w lokalnej bazie obrazów w aktualnym nodzie. Problem rozwiązano za pomocą optymalizacji przepływu pracy i uruchomienu docker build na podstawie utworzonego wcześniej ```Dockerfile```:

![error3](../Lab11/screenshots/error3.png)

Kolejnopodjęto kolejną próbę utworzenia Pod'a.

![kubectl_running](../Lab11/screenshots/kubectl_running.png)

Pod działa prawidłowo, dashboard:

![dashboard](../Lab11/screenshots/dashboard.png)

Kolejnym krokiem było wyprowadenie portu celem dotarcia do eksponowanej funkcjonalności i przedstawienie działania w przeglądarce.

![port_forward](../Lab11/screenshots/port_forward.png)

# Przekucie wdrożenia manualnego w plik wdrożenia

Utworzenie drugiego pliku Pod do wdrożenia z 3 replikami:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: express
  labels:
    app: express
spec:
  replicas: 3
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
        image: node-web-app
        imagePullPolicy: Never
        ports:
        - containerPort: 3000
```

Utworzenie Pod'a i przedstawienie działania:

![deployment](../Lab11/screenshots/deployment.png)

# Sprawozdanie Lab12 Damian Zyznar ITE-GCL08
pods_dashboard

Modyfikacja utworoznego w poprzednich laboratoriach pliku Pod i zmienie ilości replik do liczby 4.

```
spec:
  replicas: 4
```

Utworzenie pod'a

![pod_create](./screenshots/pod_create.png)

Zbadanie stanu wdrożenia za pomocą ```kubectl rollout```, oraz wyświetlenie podów:

![pod_rollout](./screenshots/pod_rollout.png)

Wyświetlenie statusu w dashboardzie:

![pods_dashboard](./screenshots/pods_dashboard.png)

Zmiana ilości replik na 9, utworzenie poda i sprawdzenie statusu:

![kubectl_9_replicas](./screenshots/kubectl_9_replicas.png)

Dashboard:

![dashboard_9](./screenshots/dashboard_9.png)

Zmiana ilości replik na 1, utworzenie poda i sprawdzenie statusu:

![kubectl_1](./screenshots/kubectl_1.png)

Dashboard:

![dashboard_1](./screenshots/dashboard_1.png)

Oraz 0 replik:

![dashboard_0](./screenshots/dashboard_0.png)

# Przygotowanie nowego obrazu

W celu skorzystania z DockerHub'a zalogowano się na maszynie wirtualnej przy pomocy klucza sha.

![dockerhub_login](./screenshots/dockerhub_login.png)

Utworzenie obrazu i wypchnięcie go na dockerhub

![docker_push](./screenshots/docker_push.png)

Usunięcie kilku niezbędnych skryptów w programie, oraz utworzenie obrazu i wypchnięcie go na dockerhub.

![docker_build_fail](./screenshots/docker_build_fail.png)

Udowodnienie istnienia obrazów w zdalnym repozytorium:

![dockerhub](./screenshots/dockerhub.png)

Zmiana w pliku definicji pod.yml obrazu na ten obierany z dockerguba, oraz usunięcie linii ImagePullPolicy: Never. Teraz jeśli w repozytorium lokalnym nie będzie obrazu, to zostanie on pobrany z repozytorium z dockerhub. 

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
        image: damczi17/express:latest
        ports:
        - containerPort: 3000
```

Działanie w dashboardzie:

![dashboard_latest](./screenshots/dashboard_latest.png)

Zmiana obrazu na błędny i działanie w dashboardzie:

![dashboard_fail](./screenshots/dashboard_fail.png)

Wyświetlono hisotrii poprzednich wdrożeń i wyświetenie szczegółów wdrożenia 1:

![kubectl_revision](./screenshots/kubectl_revision.png)

Przywrócenie 1 wdrożenia:

![rollback_undo](./screenshots/rollback_undo.png)

# Kontrola wdrożenia

W tym kroku utworzono prosty skrypt w bashu, który sprawdza czas tworzenia się wdrożenia. Jeśli czas jest większy niż 60 sekund skrypt zwraca informacje o błędzie.

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
	echo "Deployment was successful."
    exit 0
else
	echo "Deployment failed."
    exit 1
fi
```

Działanie skryptu:

![script](./screenshots/script.png)


# Strategie wdrożenia

- **Strategia Recreate**

Ta strategia zabija stare wersje aplikacji i wdraża nowe wersje. W tej strategii najpierw zabijane są wszystkie stare wersje, gdy to nastąpi wdrażane są nowe.

```
spec:
  strategy:
    type: Recreate
```

![recreate](./screenshots/recreate.png)

- **Strategia RollingUpdate**

W strategii RollingUpdate nastepuje zakończenie działania uruchomnionych podów, a następnie ich uruchomienie. W tym przypadku nastepuje to w sposób progresywny.

```maxSurge``` określa ilość podów które mogą zostać dodane w określonym czasie, 

```maxUnavaliabe``` określa ilość podów które mogą być niedostępne w czasie wdrożenia

```
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 3
      maxUnavailable: 0 
```

![rolling_update](./screenshots/rolling_update.png)

![rolling_update2](./screenshots/rolling_update2.png)

- **Strategie Canary**

Strategia wdrażania canary polega na wdrażaniu nowych wersji aplikacji obok stabilnych wersji.

```
metadata:
  labels:
    app: express
    version: "3.0.0"
```

![canary](./screenshots/canary.png)