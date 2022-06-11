4 Repliki:


![](4%20replicas.png)



Apply to było już w zeszłym labie to nie robie screenów znowu tego samego.


![](rollout.png)


Troche nie po kolei teraz robiłem, więc najpierw użycie różnych ilości replik.:


0 Replik:


![](0%20replica.png)


1 Replika:


![](1%20replicas.png)


12 Replik:


![](12%20replicas.png)




Utworzenie obrazu ktorego wdrozenie zakonczy sie bledem:


![](build%20errorrrr.png)


Wdrożenie go:


![](error.png)



Przywrócenie poprzedniej wersji, oraz pokazanie historii


![](history.png)



![](undo.png)




Skrypt ktory sam bedzie sprawdzal czy wszystko poszlo dobrze po minucie:


```
#!/bin/bash

kubectl apply -f httpd-deployment.yaml

sleep 60

check=$(kubectl rollout status  deployment/httpd)
succ="successfully"

if [[ $check == *"$succ"* ]];
then
	echo "jest essa"
else
	echo "nie ma essy"
	kubectl rollout undo deployment httpd
fi
```




Strategie wdrożeń:


Recreate:


![](recreate.png)


![](recreate%20describe.png)



RollingUpdate:


![](rollingupdate.png)




![](rolling%20update%20describe.png)





Canary Deployment:


Tu jest trochę inaczej, należy utworzyć drugi plik wdrożeniowy yml, z inną nazwa/labelem. Wdrażamy to na kubernetesa, migrujemy dane/klientów do nowego deploymentu, i dopiero wtedy wyłączamy stary.


![](canary%20describe.png)



![](canaryyy.png)



Dodatkowo w plikach znajdują sie pliki yml, docker build, docker-compose użyte do tego ćwiczenia.
