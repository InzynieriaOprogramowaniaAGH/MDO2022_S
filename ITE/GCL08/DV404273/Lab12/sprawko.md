# Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

- Zwiększono ilość replik o 4

- rozpoczęto wdrożenie za pomocą komendy `kubectl apply -f deploy.yml`
    ![spheal](./screeny/1.png)

- Zbadano stan za pomocą komendy `kubectl rollout status -f deploy.yml`
    ![spheal](./screeny/2.png)

# Przygotowanie nowego obrazu

- utworzono Dockerfile o treści
```
FROM mysql:5.6
ENV MYSQL_ROOT_PASSWORD=password
```

- utworzono nowy obraz za pomocą dockerfile'a
    ![spheal](./screeny/10.png)

- Zbudowany obraz dodano do dockerhube'a
    ![spheal](./screeny/11.png)

- utworzono Dockerfile o treści
```
FROM mysql:5.6
ENV MYSQL_ROOT_PASSWORD=password
CMD ["exit", "1"]
```

- utworzono nowy obraz za pomocą dockerfile'a
    ![spheal](./screeny/13.png)

- Zbudowany obraz również dodano do dockerhube'a

# Zmiany w deploymencie

- Zwiększono ilość replik o 4
```
spec:
    replicas: 7
```
    ![spheal](./screeny/7.png)

- Zmniejszono ilość replik do 1
```
spec:
    replicas: 1
```
    ![spheal](./screeny/8.png)

- Zmniejszono ilosć replik do 0
```
spec:
    replicas: 0
```
    ![spheal](./screeny/9.png)

- Zastosowano nową wersję obrazu
    ![spheal](./screeny/12.png)

- Zastosowano wersję obrazu zwracającą błąd
    ![spheal](./screeny/14.png)

- Spróbowano przywrócić starszą wersję obrazu za pomocą komend
```
kubectl rollout history
kubectl rollout undo
```
![spheal](./screeny/15.png)

niestety przez to że w poprzednich krokach występowały różne błędy których naprawienie wymagało częstego tworzenia i usuwania deploymentów i podów, starsza wersja nie została zachowana w historii.
Przywrócono ją więc przy użyciu pliku deploy.yml z poprzednich zajęć.

# Kontrola wdrożenia

- napisano skrypt liczący ile sekund zajmuje przeprowadzenie wdrożenia 

```
#!/bin/bash
start=$SECONDS
current=$(minikube kubectl -- get deployment mysql | tail -n+2 | awk '{print $2}' | cut -d "/" -f1)
desired=$(minikube kubectl -- get deployment mysql | tail -n+2 | awk '{print $2}' | cut -d "/" -f2)

while [ "$current" != "$desired" ]
do
    current=$(minikube kubectl -- get deployment mysql | tail -n+2 | awk '{print $2}' | cut -d "/" -f1)
    desired=$(minikube kubectl -- get deployment mysql | tail -n+2 | awk '{print $2}' | cut -d "/" -f2)
done
duration=$(( SECONDS - start ))
echo "done in: $duration"
```

- Uruchomiono napisany skrypt przy uruchomieniu wdrożenia
![spheal](./screeny/17.png)

# Strategie wdrożenia

- Przygotowano wersję wdrożenia stosującą Recreate
```
spec:
  strategy: Recreate
```
    Zastosowana strategia sprawia że Wszystkie pody są usuwane jednocześnie oraz jednocześnie wstają.

- Przygotowano wersję wdrożenia stosującą Rolling Update
```
spec:
  strategy: RollingUpdate
```
Zastosowana strategia sprawia że Pody są usuwane pojedynczo lub w zdeklarowanych grupach. Dzięki temu użytkownik ma cały czas dostęp do usług.

- Przygotowano wersję wdrożenia stosującą Canary Deployment workload
```
spec:
  strategy: CanaryDeploymentWorkload
```
Zastosowana strategia sprawia że tworzone jest nowe wdrożenie z podami o zmienionych labelach. Gdy wdrożenie się powiedzie, zmienianey jest label selector w serwisie. W wyniku tego traffic jest routowany na nowe pody bez prawie żadnego downtime'u.

