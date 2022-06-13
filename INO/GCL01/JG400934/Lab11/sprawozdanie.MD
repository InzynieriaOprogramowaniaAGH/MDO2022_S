Instalacja minikube:

![](install%20minikube%201.png)


Start minikube:


![](minikube%20start.png)



Załączenie dashboardu:


![](minikube%20run%20dashboard.png)




Uruchomienie wybranego oprogramowania. W tym przypadku serwer HTTPD



![](cos1.png)



![](running%20httpd.png)



![](running%20httpd%202.png)



Port Forwarding:

![](port%20forward.png)



Konwersja do pliku yaml kubernetesa:

Do konwersji użyłem narzędzia Kompose.

Użyty do tego docker-compose:


```
version: "3"

services:
  httpd:
    image: httpd:latest
    ports:
      - "8080:80"

```




![](convert.png)



Gotowy plik do wdrożeń:


![](yml%20after%20covnert.png)



Wdrożenie go:


![](apply.png)




![](after%20apply%202%20replicas.png)
