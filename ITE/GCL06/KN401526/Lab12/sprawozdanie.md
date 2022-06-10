# Sprawozdanie Lab_12 Kacper Nosarzewski
## 1. Cel cwiczenia

Wdrażanie na zarządzalne kontenery: Kubernetes (2)
## 2. Wykonanie cwiczenia

1. Powiekszenie ilosci replik zapisanych w pliku deploy.yaml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kn-nginx-deployment
  labels:
    app: knnginx1
spec:
  replicas: 4
  selector:
    matchLabels:
      app: knnginx1
  template:
    metadata:
      labels:
        app: knnginx1
    spec:
      containers:
      - name: knnginx1
        image: nginx
        imagePullPolicy: Never
        ports:
        - containerPort: 2222
```
2. Nowe wdrozenie wykonane poleceniem  `kubectl apply -f deploy.yaml` 

![img](apply.PNG)

![img](pods_4_t.PNG)

![img](pods_4.PNG)

3. Zbadanie nowego stanu poleceniem `kubectl rollout status -f deploy.yaml`

![img](rollout.PNG)


4. Utworzenie dockerfile `Dockerfile_kn_error_nginx` z nginx ktorego uruchomienie konczy sie bledem
```
FROM nginx:latest
CMD [ "exit", "1" ]
```
5. Zbudowanie nowego obrazu nginx poleceniem `sudo docker build . -f Dockerfile_kn_error_nginx -t kn_error_nginx`

![img](sudo_docker_build.PNG)

6. Zwiekszenie liczby replik z `4` na `7`

![img](pods_7_t.PNG)

![img](pods_7.PNG)

7. Zmniejszenie ilosci replik z `7` na `1` 

![img](pods_1_t.PNG)

![img](pods_1.PNG)

8. Ustawienie ilosci replik na `0`

![img](pods_0.PNG)

![img](pods_0_t.PNG)

9. Wyswietlenie repliki z dzialajacym nginx i z obrazem konczacym sie bledem poleceniem `kubectl describe pods kn-nginx-deployment-7db67c9dd9-9dzcg
`
![img](good_nginx.PNG)


![img](error_pods.PNG)

![img](error_pods1.PNG)

10. Wyswietlenie stanu dashboarda po wykonaniu wdrozenia z blednym obrazem

![img](error_nginx_dash.PNG)

11. Przywrocenie poprzednich wersji wdrozen poleceniem `kubectl rollout history deployment kn-nginx-deployment` i `kubectl rollout undo deployment kn-nginx-deployment`

![img](history.PNG)

![img](undo.PNG)

![img](undo_2.PNG)





