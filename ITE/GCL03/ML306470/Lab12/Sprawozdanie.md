### Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML
 * Upewnij się, że posiadasz wdrożenie z poprzednich zajęć zapisane jako plik
 * Wzbogać swój obraz o 4 repliki
 
 Zmieniono plik deployment.yaml (teraz ma 4 repliki)
 
 ```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pg
spec:
  selector:
    matchLabels:
      app: mypostgres
  replicas: 4 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: mypostgres
    spec:
      containers:
      - name: pg
        image: postgres
        env:
        - name: POSTGRES_PASSWORD
          value: "admin123"
        ports:
        - containerPort: 5432
 ```
 * Rozpocznij wdrożenie za pomocą ```kubectl apply```
 * Zbadaj stan za pomocą ```kubectl rollout status```
 
 Użyto komend ```kubectl apply -f deployment.yaml``` i ```kubectl rollout status -f deployment.yaml```
 
 
 ![](ScreenShots/SuccessfulCommandsFromStepOne.png?raw=true)
 
 ![](ScreenShots/FourReplicas.png?raw=true)

### Przygotowanie nowego obrazu
 * Zarejestruj nową wersję swojego obrazu (w Docker Hub lub lokalnie)
 * Upewnij się, że dostępne są dwie co najmniej wersje obrazu z wybranym programem
 * Będzie to wymagać 
   * przejścia przez pipeline dwukrotnie, lub
   * ręcznego zbudowania dwóch wersji, lub
   * przepakowania wybranego obrazu samodzielnie np przez ```commit```
   
 Projekt nie wyprowadzał portu więc wybarno obraz z DockerHuba - postgres (https://hub.docker.com/_/postgres)
  
 * Przyotuj wersję obrazu, którego uruchomienie kończy się błędem
  
 W celu by obraz zwracał błąd z pliku deployment.yaml usuwana jest zmienna środowiskowa POSTGRES_PASSWORD, tym przypadku, pody cały czas się restartują. Aby został zwrócony błąd dodano ```minReadySeconds: 55``` i ``` progressDeadlineSeconds: 60```.
 
 ```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pg
spec:
  minReadySeconds: 55
  progressDeadlineSeconds: 60
  selector:
    matchLabels:
      app: mypostgres
  replicas: 4 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: mypostgres
    spec:
      containers:
      - name: pg
        image: postgres
        ports:
        - containerPort: 5432

 ```
 
 ![](ScreenShots/ErrorYaml.png?raw=true)

 
### Zmiany w deploymencie
 * Aktualizuj plik YAML z wdrożeniem i przeprowadzaj je ponownie po zastosowaniu następujących zmian:
   * zwiększenie replik
   
   Zwiększono repliki z 4 do 8
   
   ![](ScreenShots/EightReplicas.png?raw=true)
   
   * zmniejszenie liczby replik do 1
   
   Zmniejszono repliki do 1
   
   ![](ScreenShots/OneReplica.png.png?raw=true)
   
   * zmniejszenie liczby replik do 0
   
   Zmniejszono repliki do 0
   
   ![](ScreenShots/ZeroReplica.png?raw=true)
   
   * Zastosowanie nowej wersji obrazu
   
   Zastosowano wersje ```postgres:15beta1``` i wrócono do 2 replik
   
   ![](ScreenShots/NewVersion.png?raw=true)
   
   * Zastosowanie starszej wersji obrazu
   
   Zastosowano wersje ```postgres:11```
   
   ![](ScreenShots/OldVersion.png?raw=true)
   
 * Przywracaj poprzednie wersje wdrożeń za pomocą poleceń
   * ```kubectl rollout history```
   * ```kubectl rollout undo```
   
   Użyto komend w celu pokazania historii i powrotu do jednej ze starszych wersji ```kubectl rollout history deployment/pg```, ```kubectl rollout undo deployment/pg --to-revision 4``` i ```kubectl rollout status -f deployment.yaml```
 
 ![](ScreenShots/HistoryUndo.png?raw=true)
  

### Kontrola wdrożenia
 * Napisz skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund)
 
 Skrypt:
 ```
kubectl apply -f $1

sleep 60
kubectl rollout status deployment/$2
if [ "$?" -ne 0 ]; then
    echo "deployment failed!"
else
    echo "deployment succeeded"
fi
 ```
 
 Uruchomiono skrypt dla działającego deploymentu "deployment.yaml" komendą ```./deployment.sh deployment.yaml pg```
 Uruchomiono skrypt dla nie działającego deploymentu "deploymentWithError.yaml" komendą ```./deployment.sh deploymentWithError.yaml pg```
 
 ![](ScreenShots/ScripErrorAndNotError.png?raw=true)
 
### Strategie wdrożenia
 * Przygotuj wersje wdrożeń stosujące następujące strategie wdrożeń
   * Recreate
   
   Strategia ta na nowo tworzy pody (usuwa stare -> tworzy nowe).
   
   ```yml
   
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pg
spec:
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: mypostgres
  replicas: 4 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: mypostgres
    spec:
      containers:
      - name: pg
        image: postgres
        env:
        - name: POSTGRES_PASSWORD
          value: "admin123"
        ports:
        - containerPort: 5432
        
   
   ```
   
   Użyto komend ```kubectl apply -f deploymentRecreate.yaml``` i ```kubectl rollout status -f deploymentRecreate.yaml```
   
   ![](ScreenShots/RecreateStrategy.png?raw=true)
   
   * Rolling Update
   
   Rolling update umożliwia aktualizowanie wdrożeń bez przerw w działaniu dzięki stopniowemu aktualizowaniu instancji podów o nowe. W tej strategii istotne są dwa argumenty: 
    - maxUnavailable - określa ile podów może być niedostępnych
    - maxSurg - ustawia maksymalną ilość podów, która jest tworzona ponad określoną ilość
	
   W tym przypadku obraz również został zmieniony w celu możliwości obserwacji zmian.
 
   
   ```yml
   
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pg
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  selector:
    matchLabels:
      app: mypostgres
  replicas: 4 
  template:
    metadata:
      labels:
        app: mypostgres
    spec:
      containers:
      - name: pg
        image: postgres:11
        env:
        - name: POSTGRES_PASSWORD
          value: "admin123"
        ports:
        - containerPort: 5432
        
        
   ```
   
   Użyto komend ```kubectl apply -f deploymentRollingUpdate.yaml``` i ```kubectl rollout status -f deploymentRollingUpdate.yaml```
   
   ![](ScreenShots/RollingUpdateStrategy.png?raw=true)
   
   * Canary Deployment workload
   
	Canary Deployment to strategia wdrażania, która stopniowo udostępnia aplikację lub usługę małemu zbiorowi użytkowników. Cała infrastruktura w środowisku docelowym jest aktualizowana w małych fazach np. 2%, 10%, 30%, 60%, 80%, 100%.