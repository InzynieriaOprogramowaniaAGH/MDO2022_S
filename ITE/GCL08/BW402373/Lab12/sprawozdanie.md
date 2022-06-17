# Sprawozdanie - lab 12 - Bartłomiej Walasek
1. Zmiana liczby replik w pliku ```deploy.yml``` na 4.<br>
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mynginx-deployment
  labels:
    app: mynginx
spec:
  replicas: 4
  selector:
    matchLabels:
      app: mynginx
  template:
    metadata:
      labels:
        app: mynginx
    spec:
      containers:
      - name: mynginx
        image: nginx
        imagePullPolicy: Never
        ports:
        - containerPort: 2222
```
2. Rozpoczęto wdrożenie za pomocą polecenia ```kubectl apply -f deploy.yml```<br>
![deploy](1_deploy.PNG)
3. Zbadano stan kubectl za pomocą polecenia ```kubectl rollout status -f deploy.yml```<br>
![rollout](2_rollout.PNG)
4. Utworzono plik o nazwie "Dockerfile_error", którego uruchomienie kończy się błędem.<br>
```
FROM nginx:latest
CMD [ "exit", "1" ]
```
5. Zbudowano nowy obraz nginx poleceniem ```sudo docker build . -f Dockerfile_error -t mynginx-err```<br>
![dockerfile](3_first_build.PNG)<br>
Potwierdzenie utworzenia nowego obrazu<br>
![new_image](4_images_with_err.PNG)
6. Rozszerzono ilość podów do 8, zmieniając w pliku "deploy.yml" wartość ```replicas``` na 8.<br>
![8pods](5_8pods.PNG)
![8pods_in_browser](5_1_8pods.PNG)
7. Liczbę replik zmniejszono kolejno do 1 i do 0.<br>
![one_and_zero](6_one_and_zero.PNG)	
8. Wyświetlenie wdrożenia z działającym obrazem.<br>
![working](8_normal1.PNG)
![still_works](8_normal2.PNG)
9. Wyświetlenie wdrożenia błędnego obrazu. Wdrożenie utworzono przez zmianę wartości "image" w pliku "deploy.yml" na ```mynginx-err```.<br>
![bad1](9_bad_1.PNG)
![bad2](9_bad_2.PNG)
![bad_in_browser](9_bad_browser.PNG)
10. Wyświetlono historię zmian poleceniem ```kubectl rollout history deployment mynginx-deployment```.<br>
![rollout_history](10_rollout_history.PNG)
11. Przywrócono poprzednie wersje wdrożeń za pomocą ```kubectl undo deployment mynginx-deployment```<br>
![undo](11_undo.PNG)
![undo_in_browser](11_undo_browser.PNG)
