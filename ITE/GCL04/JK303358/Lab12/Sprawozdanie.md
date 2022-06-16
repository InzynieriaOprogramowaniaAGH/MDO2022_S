# Zajęcia 12
### 2022-05-30 -- 2022-06-03

# Wdrażanie na zarządzalne kontenery: Kubernetes (2)

## Zadania do wykonania
### Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML
 * Upewnij się, że posiadasz wdrożenie z poprzednich zajęć zapisane jako plik
 * Wzbogać swój obraz o 4 repliki
 
 W pliku wdrożeniowym zmieniono wartość parametru `replicas`
 
 ```yml
 apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
spec:
  selector:
    matchLabels:
      app: postgres
  replicas: 4
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
 
 * Rozpocznij wdrożenie za pomocą ```kubectl apply```
 * Zbadaj stan za pomocą ```kubectl rollout status```
 
 Uruchomiono kontener, rozpoczęto wdrożenie `kubectl apply -f deployment.yml`, sprawdzono stan `kubectl rollout status -f deployment.yml`
 
 ![apply rollout](Pictures/1.png?raw=true)
 
 ![dashboard](Pictures/2.png?raw=true)

### Przygotowanie nowego obrazu
 * Zarejestruj nową wersję swojego obrazu (w Docker Hub lub lokalnie)
 * Upewnij się, że dostępne są dwie co najmniej wersje obrazu z wybranym programem
 * Będzie to wymagać 
   * przejścia przez pipeline dwukrotnie, lub
   * ręcznego zbudowania dwóch wersji, lub
   * przepakowania wybranego obrazu samodzielnie np przez ```commit```
   
 Projekt nie wyprowadzał funkcjonalności na port - wykorzystano obraz postgres https://hub.docker.com/_/postgres  
   
 * Przygotuj wersję obrazu, którego uruchomienie kończy się błędem
 
 Aby uruchomienie kończyło się błędem można na przykład wykorzystać parametry minReadySeconds i progressDeadlineSeconds. Utworzono nowy plik wdrożeniowy `wrong_deployment.yml`:
 
 ```yml
 apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
spec:
  minReadySeconds: 5
  progressDeadlineSeconds: 10
  selector:
    matchLabels:
      app: postgres
  replicas: 4
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
 ```
 
 Uruchomiono wdrożenie z nowym plikiem i sprawdzono stan:
 
 ![wrong deployment](Pictures/3.png?raw=true) 
  
### Zmiany w deploymencie
 * Aktualizuj plik YAML z wdrożeniem i przeprowadzaj je ponownie po zastosowaniu następujących zmian:
   * zwiększenie replik

   Zwiększono ilość replik do 8:
   
   ![8 replicas](Pictures/4.png?raw=true)
   
   ![8 replicas](Pictures/5.png?raw=true)
   
   ![8 replicas](Pictures/6.png?raw=true)
   
   ![8 replicas](Pictures/7.png?raw=true)

   * zmniejszenie liczby replik do 1

   ![1 replica](Pictures/8.png?raw=true)
   
   ![1 replica](Pictures/9.png?raw=true)
   
   ![1 replica](Pictures/10.png?raw=true)

   * zmniejszenie liczby replik do 0

   ![0 replicas](Pictures/11.png?raw=true)
   
   ![0 replicas](Pictures/12.png?raw=true)

   * Zastosowanie nowej wersji obrazu

   Pobrano najnowszą wersję beta:
   
   ![docker pull](Pictures/13.png?raw=true)
   
   Przywrócono ilość replik do 2 oraz zmieniono obraz i nazwę w pliku wdrożeniowym.
   
   Uruchomiono wdrożenie:
   
   ![deployment](Pictures/14.png?raw=true)
   
   ![dashboard](Pictures/15.png?raw=true)
   
   ![dashboard](Pictures/16.png?raw=true)

   * Zastosowanie starszej wersji obrazu

   Pobrano obraz starszej wersji:
   
   ![docker pull](Pictures/17.png?raw=true)
   
   Ponownie edytowano plik wdrożeniowy oraz je uruchomiono:
   
   ![deployment](Pictures/18.png?raw=true)
   
   ![dashboard](Pictures/19.png?raw=true)
   
   ![dashboard](Pictures/20.png?raw=true)
   
   ![dashboard](Pictures/21.png?raw=true)

 * Przywracaj poprzednie wersje wdrożeń za pomocą poleceń
   * ```kubectl rollout history```

   `kubectl rollout history deployment/postgres`
   
   ![rollout history](Pictures/22.png?raw=true)

   * ```kubectl rollout undo```

   `kubectl rollout undo deployment/postgres --to-revision`
   
   ![rollout undo](Pictures/23.png?raw=true)
   
   ![rollout undo](Pictures/24.png?raw=true)

### Kontrola wdrożenia
 * Napisz skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund)
 
 ```shell
 kubectl apply -f deployment.yml
sleep 60
kubectl rollout status -f deployment.yml
if [[ "$?" -ne 0 ]]
then
	echo "deploy fail"
else
	echo "deploy success"
fi
 ```
 
 ![deploy script](Pictures/25.png?raw=true)
 
### Strategie wdrożenia
 * Przygotuj wersje wdrożeń stosujące następujące strategie wdrożeń
   * Recreate
   * Rolling Update
   * Canary Deployment workload
 * Zaobserwuj i opisz różnice
 * Uzyj etykiet
 * https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
 
