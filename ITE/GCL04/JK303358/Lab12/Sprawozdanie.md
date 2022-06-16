# Zajęcia 12
### 2022-05-30 -- 2022-06-03

# Wdrażanie na zarządzalne kontenery: Kubernetes (2)

## Zadania do wykonania
### Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML
 * Upewnij się, że posiadasz wdrożenie z poprzednich zajęć zapisane jako plik
 * Wzbogać swój obraz o 4 repliki
 
 W pliku wdrożeniowym zmieniono wartość parametru `replicas`
 
 ```
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
 
 ```
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
   * zmniejszenie liczby replik do 1
   * zmniejszenie liczby replik do 0
   * Zastosowanie nowej wersji obrazu
   * Zastosowanie starszej wersji obrazu
 * Przywracaj poprzednie wersje wdrożeń za pomocą poleceń
   * ```kubectl rollout history```
   * ```kubectl rollout undo```

### Kontrola wdrożenia
 * Napisz skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund)
 * Zakres rozszerzony: Ujmij skrypt w pipeline Jenkins (o ile minikube jest dostępny z zewnątrz)
 
### Strategie wdrożenia
 * Przygotuj wersje wdrożeń stosujące następujące strategie wdrożeń
   * Recreate
   * Rolling Update
   * Canary Deployment workload
 * Zaobserwuj i opisz różnice
 * Uzyj etykiet
 * https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
 
