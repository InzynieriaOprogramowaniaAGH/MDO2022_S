# Sprawozdanie Lab11 Wiktoria Dęga Inżynieria Obliczeniowa 
## Wdrażanie na zarządzalne kontenery: Kubernetes (Część 1)
---
### Instalacja klastra Kubernetes

W pierwszym kroku skorzystałam z dokumentacji w internecie (https://minikube.sigs.k8s.io/docs/start/) w celu instalacji minikube. Za pomocą polecenia `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb` pobrałam najnowszą wersję minikube.
![1](./1.png)

W kolejnym kroku uruchomiłam instalację przy użyciu polecenia `sudo dpkg -i minikube_latest_amd64.deb`.
![2](./2.png)

Następnie uruchomiłam klaster przy użyciu komendy z przełącznikiem `minikube start --driver=docker`, napotykając na problemy takie jak poniżej. Poza tym zadanie musiało zostać wykonane na innej maszynie wirtualnej z powodu zbyt małej ilości miejsca.
![25](./25.png)
![4](./4.png)

W celu zwiększenia wątków procesora zmieniłam ustawienia wirtualnej maszyny:
![5](./5.png)

Ostatecznie problem został rozwiązany.
![6](./6.png)

Zaopatrzyłam się w polecenie kubectl.
![12](./12.png)

Następnie uruchomiłam polecenie `minikube kubectl -- get po -A`, w celu uzyskania dostępu do klastra.
![7](./7.png)

Za pomocą komendy `docker ps` pokazałam działający kontener.
![8](./8.png)

Podczas instalacji klastra jedyne ograniczenie stanowił 1 wątek CPU (co zostało rozwiązane poprzez zwiększenie do 2 wątków CPU), w związku z czym zostały spełnione podstawowe wymagania sprzętowe;
* 2 rdzenie dla procesora
* 3 GB pamięci RAM
* 60GB miejsca fizycznego
* kontener (Docker)

Poprzez komendę `minikube dashboard` uruchomiłam Dashboard:
![9](./9.png)

Następnie przez localhosta dostałam się do Dashboardu w przeglądarce:
![10](./10.png)
![10a](./10a.png)

## Analiza posiadanego kontenera

Na początku zalogowałam się do Dockera
![11](./11.png)

Deployowanym obrazem, który wykorzystałam był gotowy obraz `echoserver:1.4`.
Za pomocą polecenia `kubectl create deployment hello-minikube1 --image=k8s.gcr.io/echoserver:1.4` stworzyłam deployment.
![13](./13.png)

Następnie używam komendy `kubectl expose deployment hello-minikube1 --type=LoadBalancer --port=8080`, w celu wykonania kroku expose.
![14](./14.png)

Z kolei przy pomocy `kube get services hello-minikube1` została przeze mnie włączona obsługa deploymentu. 
![15](./15.png)

Następnie ma miejsce przekierowanie na port 7080 przy pomocy polecenia `kubectl port-forward service/hello-minikube1 7080:8080`
![16](./16.png)

Po wysłaniu requesta do localhost:7080 :
![17](./17.png)

![18](./18.png)
![19](./19.png)
![20](./20.png)

## Przekucie wdrożenia manualnego w plik wdrożenia (wprowadzenie)

W kolejnym kroku zapisałam wdrożenie jako plik YML, dodane zostały repliki.
![21](./21.png)
![22](./22.png)
![22a](./22a.png)

Skorzystałam z komendy `kubectl apply -f nginx-deployment.yaml` w celu stworzenia deploymentu na pliku YML.
![23](./23.png)

Sprawdzenie Dashboardu:
![24](./24.png)
![24a](./24a.png)
![24b](./24b.png)