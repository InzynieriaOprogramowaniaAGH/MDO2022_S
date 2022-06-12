# Sprawozdanie Lab12 Jan Święs 402998

**Cel labortariów:** Wdrażanie na zarządzakne kontenery Kubernetes

# Instalacja klastra Kubernetes
Pierwszym krokiem była instalacja curl. Następnie pobrano i zainstalowano minikube'a

![minikube_install](../Lab11/1.png)

![minikube_install](../Lab11/2.png)

Pobranie pakietów instalacyjnych kubectl, oraz sprawdzenie sumy kontrolnej, aby wzmocnić bezpieczeństwo instalacji:

![kubectl_install](../Lab11/3.png)

![kubectl_install](../Lab11/4.png)

![kubectl_install2](../Lab11/5.png)

Instalacja kubestl:

![kubectl](../Lab11/6.png)

![kubectl](../Lab11/7.png)

Próba pierwszego uruchomienia minikube:

![error](../Lab11/8.png)

Wykonano zaleconą operację dodania użytkownika do grupy docker i uruchomiono minikube.

![minikube_start](../Lab11/9.png)

Uruchomienie dashbord'u

![dashboard](../Lab11/10.png)

Instalacja kubernetesa wymaga 20 GB wolnej przestrzeni dyskowej. Minikube potrzebuje również środowiska konteneryzajci, w tym przypadku jest to docker.

# Analiza posiadanego kontenera

Aplikacja używana we wcześniejszych laboratoriach jest napisania w Node.Js i jednak nie udostępniała portu. Wykoszytałem więc inną.

![sample-app](../Lab11/11.png)

Utworzono następujący Dockerfile:

![kubectl_nodes](../Lab11/12.png)

Uruchamiany tu jest przykładowy skrypt ```sample-nodejs-app```, oraz udostępniany jest port 3000.

Build obrazu:

![docker_build](../Lab11/16.png)

# Uruchamianie oprogramowania

Utworzenie pliku definicji pod.yml dla aplikacji.

```
apiVersion: v1
kind: Pod
metadata:
  name: sample-nodejs
  labels:
    app: sample-nodejs
spec:
  containers:
    - name: sample-nodejs
      image: sample-nodejs-app
      imagePullPolicy: Never
      ports:
      - containerPort: 3000
      
```

Utworzono pod'a i sprawdzono jego działanie:

![kubectl_error](../Lab11/13.png)

Pod nie działa. Ustawienie w pliku definicji ```imagePullPolicy: Never``` mówi, że obraz nie będzie pobierany z internetu, tylko będzie poszukiwany w lokalnej bazie obrazów w aktualnym nodzie. Problem rozwiązano za pomocą optymalizacji przepływu pracy i uruchomienu docker build na podstawie utworzonego wcześniej ```Dockerfile```:

![error3](../Lab11/15.png)

Kolejnopodjęto kolejną próbę utworzenia Pod'a.

![error5](../Lab11/17.png)

Pod działa prawidłowo, dashboard:

![dashboard](../Lab11/18.png)

Kolejnym krokiem było wyprowadenie portu celem dotarcia do eksponowanej funkcjonalności i przedstawienie działania w przeglądarce.

![port_forward](../Lab11/19.png)

![port_forward](../Lab11/20.png)

Utworzenie drugiego pliku Pod do wdrożenia z 3 replikami:

![pod2](../Lab11/21.png)

Utworzenie Pod'a i przedstawienie działania:

![deployment](../Lab11/22.png)

# Lab 12

Utworzenie pod'a, zbadanie stanu wdrożenia za pomocą ```kubectl rollout```, oraz wyświetlenie podów:

![pod_create](./1.png)

![pod_rollout](./2.png)

# Przygotowanie nowego obrazu

W celu skorzystania z DockerHub'a zalogowano się na maszynie wirtualnej przy pomocy klucza sha.

![dockerhub_login](./3.png)

Utworzenie obrazu i wypchnięcie go na dockerhub

![docker_push](./4.png)

Usunięcie kilku niezbędnych skryptów w programie, oraz utworzenie obrazu i wypchnięcie go na dockerhub.

![docker_build_fail](./5.png)

![docker_build_fail1](./6.png)

Zmiana w pliku definicji pod.yml obrazu na ten obierany z dockerguba, oraz usunięcie linii ImagePullPolicy: Never. Teraz jeśli w repozytorium lokalnym nie będzie obrazu, to zostanie on pobrany z repozytorium z dockerhub. 

![pod3](./7.png)

![dashboard_latest](./8.png)

Działanie w dashboardzie:

![dashboard_latest](./9.png)

Zmiana obrazu na błędny i działanie w dashboardzie:

![dashboard_latest1](./10.png)

Wyświetlono hisotrii poprzednich wdrożeń i wyświetenie szczegółów wdrożenia 1:

![kubectl_revision](./11.png)

Przywrócenie 1 wdrożenia:

![rollback_undo](./12.png)

# Kontrola wdrożenia

W tym kroku utworzono prosty skrypt w bashu, który sprawdza czas tworzenia się wdrożenia. Jeśli czas jest większy niż 60 sekund skrypt zwraca informacje o błędzie.

![skrypt](./13.png)

Działanie skryptu:

![script](./14.png)

# Strategie wdrożenia

- **Strategia Recreate**

Ta strategia zabija stare wersje aplikacji i wdraża nowe wersje. W tej strategii najpierw zabijane są wszystkie stare wersje, gdy to nastąpi wdrażane są nowe.

![strategia](./15.png)
