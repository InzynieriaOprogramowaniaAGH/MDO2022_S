 #Sprawozdanie Lab11
 ###Izabela Wenda
 ##Instalacja klastra kubernetes
- Kubernetesa instaluje na ubuntu na virtualnej maszynie.
- Lączę się za pomoca Putty przez SSH do VM.
- Sprawdzam architekture systemu za pomocą: ```uname -a```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/1.png)
- Pobieram obraz kubernetesa ```curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/2.png)
- Przeprowadzam instalacje minikube ```sudo install minikube-linux-amd64 /usr/local/bin/minikube```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/3.png)
- Startujemy klaster ```minikube start```
- Dodanie uzytkownika do grupy docker za pomocą komendy ```sudo usermod -aG docker devops && new grp docker```
- ![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/4.png)
- Instalacja i wykonanie polecenia ```minikube kubectl --get pods -A```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/5.png)
- uruchomienie kubernetesa, dzialajacy kontener ```docker ps```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/6.png)
- Zmityguj problemy wynikające z wymagań sprzętowych lub odnieś się do nich (względem dokumentacji)
- Przydzieliłam 4 rdzenie, karta mostkowa.
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/procesory.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/rdzenie.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/karta.png)
- Uruchom Dashboard, otwórz w przeglądarce, przedstaw łączność.
- Wyświetlam klaster razem z interfejsem graficznym przy pomocy ```minikube dashboard```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/7.jpg)
- Deploy aplikacji do minikube'a
- Tworze deployment za pomocą: ```kubectl create deployment <nazwa> --image=<nazwa_obrazu:tag>```
- Ekspozycja na port 8080: ```kubectl expose deployment hello-minikub1 -type=LoadBalancer --port=8080```
- włączam obsługe deploymentu: ```kubectl get services kuber```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/8.png)
- Przekierowuję na port 7080: ```kubectl port-forward service/kuber 7080:8080```
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/9.png)
- Po wysłaniu requesta na local hosta otrzymujemy nasza aplikacje
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/10.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/11.png)
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/42bdeaba4f3f6dcb7b5f46a69c8cac33ebc1fca9/INO/GCL02/IW402853/Lab11/12.png)
