
# Zajęcia 11
### maj/czerwiec - 2022 
---
## Instalacja Kubernetesa
**1.** Naszym zadaniem na zajęciach numer 11 była konfiguracja oraz instalacja Kubernetesa.

 - Ustawienie maszynie odpowiednich parametrów, jest to system Ubuntu, przeznaczyłem 8 rdzeni oraz 8gb ramu
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/8.PNG?raw=true)

 - Należało zapoznać się z dokumentacja oraz przeprowadzić instalacje k8s minikube.
 - Sprawdzenie komendą `uname -a` jaką architekturę systemu potrzebuje.

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/1.PNG?raw=true)

 - Pobranie odpowiedniego obrazu przy użyciu komendy :
 `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
 
 ![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/2.PNG?raw=true)
 - Instalacja minikube używając `sudo install minikube-linux-amd64 /usr/local/bin/minikube`
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/3.PNG?raw=true)
 - Oczywiście nie obyło się bez problemów, wyskoczył błąd który był spowodowany tym że potrzebne jest dodanie użytkownika do grupy dockerowej. 
 
![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/4.PNG?raw=true)

 - Poleceniem `sudo usermod -aG docker arczi && newgrp docker` dodałem użytkownika `arczi` do grupy.

 - Następnie uruchomiłem minikube poleceniem `minikube start`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/5.PNG?raw=true)

 - Doinstalowałem `minikube kubectl -- get pods -A`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/6.PNG?raw=true)

 - Dowoód na działający kontener przy użyciu `docker ps`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/7.PNG?raw=true)

**2.** Uruchomienie Dashboard, ukazanie poprawnego działania łączności:

Komenda `minikube dashboard`

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/10.PNG?raw=true)

 - Następnie zająłem sie deployem aplikacji do minikube'a, użyty został domyślny obraz echoserver:1.4.
 - Użyłem 3 następujące komendy:
1. `kubectl create deployment testlab11 --image=echoserver:1.4.` - tworzenie deploymentu
2. `kubectl expose deployment testlab11 -type=LoadBalancer --port=8080` - expose na port 8080
3. `kubectl get services testlab11`- włączenie obsługi

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/12.PNG?raw=true)

**3** Uzyskanie widoku naszej aplikacji. 

 - Należało przekierować kubeclt na port 7080 `kubectl port-forward service/testlab11 7080:8080`
i w tym momencie otrzymaliśmy aplikacje, po wejściu na `localhost:7080` otrzymałem taki widok:

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/13.PNG?raw=true)

 - Powrót na dashboard i przegląd wyników: 

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/14.PNG?raw=true)

![enter image description here](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/AW400107/INO/GCL02/AW400107/Lab11/15.PNG?raw=true)
