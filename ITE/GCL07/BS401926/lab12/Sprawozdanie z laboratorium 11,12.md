# Sprawozdanie z laboratorium 11,12 
 
## Wykonanie laboratorium część 1

**1. Instalacja klastra Kubernetes**

a) instalacja curl, minikube'a kubectl'a, wyświetlenie sumy kontrolnej

![x](../lab11/1-minikube-install.png)

![x](../lab11/2-kubectl-install.png)

![x](../lab11/2-kubectl-version.png)

b) uruchomienie minikube'a

![x](../lab11/3-minikube-start.png)

c) uruchomienie dashboardu i pokazanie łączności

![x](../lab11/4-dashboard.png)

Kubernetes wymaga 20 GB wolnej przestrzeni dyskowej, 2 rdzeni oraz 2 GB RAM-u. Aby go uruchomić należy także mieć połączenie ze środowiskiem konteneryzacji ,np.: Dockerem lub Hyperkitem. 

**2. Analiza posiadanego kontenera**

Wybrałem nową aplikację, ponieważ poprzednia nie udostępniała portów.

a) klonowanie

![x](../lab11/5-new-app.png)

b) aplikacja zawierała Dockerfile

![x](../lab11/6-dockerfile.png)

c) docker build

![x](../lab11/7-app-kontener.png)

d) uruchomienie kontenera i przekierowanie portu

![x](../lab11/8-docker-run.png)

**3. Uruchamianie oprogramowania**

a) utworzenie pliku definicji pod.yml

![x](../lab11/pod.png)

b) utworzono pod'a za pomocą polecenia kubectl apply

Próba utworzenia poda kończy się niepowodzeniem, ponieważ obraz jest utworzony w lokalnym dockerze, a nie w kubernetesie.
Ustawienie imagePullPolicy: Never powoduje, że obraz nie będzie zaciągany z internetu, tylko jest poszukwany lokalnie w danym nodzie.
Polecenie minikube docker-env zwraca zestaw zmiennych środowiskowych Bash, które służą do konfiguracji lokalnego środowiska w celu ponownego użycia Dockera wewnątrz Minikube. Użycie eval powoduje, że bash poprawnie utwozru poda

![x](../lab11/9-apply-eval.png)

c) utworzenie obrazu w node na podstawie tego samego Dockerfile

![x](../lab11/10-docker-build-new-image.png)

d) utworzenie poda i pokazanie działania

![x](../lab11/11-pods.png)

![x](../lab11/12-dashboard.png)

e) przekierowanie portów

![x](../lab11/13-ports.png)

**4. Przekucie wdrożenia manualnego w plik wdrożenia**

a) pod i dashboard

![x](../lab11/pod2.png)

![x](../lab11/14-dashboard-2.png)

## Wykonanie laboratorium część 2

**1. Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YML**

a) zmiana replik na 4

![x](./15-pod3.png)

![x](./16-dashboard.png)

**2. Przygotowanie nowego obrazu**

a) logowanie na dockerhuba

![x](./17-login.png)

b) buildowanie 2 obrazów - działającego i niekompletnego oraz pushowanie do repo na dockehubie

![x](./18-build.png)

![x](./19-modified.png)

![x](./20.png)

c) sprawdzenie repo

![x](./21.png)

**3. Zmiany w deploymencie**

a) zwiększenie replik do 20

![x](./22.png)

c) zmniejszenie do 0

![x](./23.png)

d) zwiększenie do 1 oraz zastosowanie wersji modified

![x](./24.png)

e) zastosowanie wersji failed

![x](./25-1.png)

![x](./25-2.png)

h) wyświetlenie historii wersji i przywrócenie wdrożeń

![x](./26.png)

**4. Kontrola wdrożenia**

a) utworzenie skryptu

![x](./27.png)

**5. Strategie wdrożeniowe**

a) Recreate - wszystkie aktualnie działające instancje są ubijane i następnie wdrażana jest nowa wersja
```
spec:
  replicas: 4
  strategy:
    type: Recreate
```
![x](./28.png)

b)  RollingUpdate - nowy zestaw replik; pody zabijane tak, aby liczba nadmiarowych nie przekroczła MaxSurge

```
spec:
  replicas: 6
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 0 
```

![x](./29.png)

c) Canary - Jedna replika nowej wersji jest wypuszczana obok starej i jeżeli nie wystąpią żadne błędy to zwiększa się liczba replik nowej wersji i usuwa stare wdrożenie

![x](./30.png)
