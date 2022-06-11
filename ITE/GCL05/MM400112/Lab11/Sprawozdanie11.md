# Lab11
## Mikołaj Migacz
## Zadania do wykonania
### Instalacja klastra Kubernetes
 * Zaopatrz się w implementację stosu k8s: minikube
![image](./sc_devops_11/1.png)
 * zaopatrz się w polecenie kubectl
 * ![image](./sc_devops_11/4.png)
 * Uruchom Kubernetes, pokaż działający kontener/worker
 * ![image](./sc_devops_11/2.png)
 * Zmityguj problemy wynikające z wymagań sprzętowych lub odnieś się do nich (względem dokumentacji)
 Stworzyłem dual boot z Ubuntu, ponieważ na virtualBox'ie nie dałem rady zainstalować minikube'a. 
 * Uruchom Dashboard, otwórz w przeglądarce, przedstaw łączność
![image](./sc_devops_11/5.png)

### Analiza posiadanego kontenera
 * Zdefiniuj krok "Deploy" swojego projektu jako "Deploy to cloud":
 Wybrałem gotowy serwis "Redis"
   * Deploy zbudowanej aplikacji powinien się odbywać "na kontener"
   * Przygotuj obraz Docker ze swoją aplikacją
   * Wykaż, że wybrana aplikacja pracuje jako kontener
![image](./sc_devops_11/6.png)
   
### Uruchamianie oprogramowania
 * Uruchom kontener na stosie k8s
 * Kontener uruchomiony w minikubie zostanie automatycznie ubrany w pod.
 * ```minikube kubectl run -- <nazwa-wdrożenia> --image=<obraz-docker> --port=<wyprowadzany port> --labels app=<nazwa-wdrożenia>```
![image](./sc_devops_11/7.png)
 * Przedstaw że pod działa (via Dashboard oraz kubectl)
 * ![image](./sc_devops_11/8.png)
 * Wyprowadź port celem dotarcia do eksponowanej funkcjonalności
 * ```kubectl port-forward <nazwa-wdrożenia> <LO_PORT>:<PODMAIN_CNTNR_PORT> ```
![image](./sc_devops_11/9.png)
 * Przedstaw komunikację z eskponowaną funkcjonalnością
![image](./sc_devops_11/10.png)
 
### Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)
 * Zapisanie wdrożenia jako plik YML
 * Dodanie replik
 * ```kubectl apply``` na pliku
![image](./sc_devops_11/11.png)
![image](./sc_devops_11/12.png)
![image](./sc_devops_11/13.png)