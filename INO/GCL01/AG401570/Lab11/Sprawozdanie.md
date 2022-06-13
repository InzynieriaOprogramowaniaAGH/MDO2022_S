Anna Godek

Inżynieria Obliczeniowa

GCL01

# Metodyki DevOps

## Laboratorium 11
## Wdrażanie na zarządzalne kontenery: Kubernetes (1)
**Instalacja klastra Kubernetes**
- Zaopatrz się w implementację stosu k8s: minikube.
Instrukcję przeprowadzono na Ubuntu 22.04 postawionym w VB. Pierwszym krokiem było pobranie plików binarnych i instalacja minkube.

![1](1.png)


Następnie spróbowano uruchomić minkube. Próba zakończyła się błędem, dodano więc użytkownika do grupy docker za pomocą polecenia:
```bash
sudo usermod -aG docker anngode9 && newgrp docker
```

![2](2.png) 


Zainstalowano kubectl i uzyskano dostęp do klastra.

![3](3.png)
![4](4.png)


Uruchomiono `minkube dashboard`.

![5](5.png)
![6](6.png)
![7](7.png)


Utworzono przykładowe wdrożenie.

![8](8.png)
![9](9.png)

Pobrano gotowy obraz nginx:stable.

![10](10.png)
![11](11.png)

Uruchomiono kontener.

![12](12.png)
![13](13.png)
![14](14.png)


Włączono obsługę deploymentu `kubectl get services hello-minikube`.
Przekierowanie na port.

![15](15.png)
![16](16.png)
![17](17.png)
![18](18.png)

Wdrożenie.
Utworzono plik `.yaml` za pomocą polecenia `touch nginx-deployment.yaml`. Zawartość pliku:
![19](19.png)
![20](20.png)
