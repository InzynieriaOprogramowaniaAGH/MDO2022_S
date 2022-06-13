# Sprawozdanie Lab09 Michał Szymański ITE-GCL08


## Wykonanie laboratorium
<hr>


## Część 1: Instalacja Kubernetesa
-zainstalowano minikube zgodnie z instrukcją na stronie https://minikube.sigs.k8s.io/docs/start/ :
![1](1_instalacja.png)

-uruchomiono minikube
![2](2_start_kubectl.png)

-włączono dashboard i pokazano jego działanie
![3](3_dashboard.png)
![4](4_dashboard.png)
Wymagania sprzętowe nie są wygórowane, do płynnego działania wystarczą 2CPU, 2GB pamięci oraz 20GB miejsca na dysku


## Część 2: Analiza kontenera

Poprzednie, orygnialne repozytorium nie posiadało możliwości eksponowania portu. Wybrany został obraz-gotowiec. Obrazem tym była Grafana, narzędzie służące do wizualizacji danych na wykresach.

-ściągnięto obraz Grafany
![5](5_pull.png)


## Część 3: Uruchomienie oprogramowania

-uruchomiono kontener, który został automatycznie umieszczony w podzie- abstrakcyjnym obiekcie reprezentującym grupę kontenerów wraz z zasobami tej grupy, następnie wyprowadzono port i uruchomiono poda:
![6](6_pod_port_forward.png)
![6](6_pod.png)

-prezentacja działania poda w dashboard:
![7](7_grafana.png)
![8](7_pod.png)


## Część 4: Przekucie wdrożenia manualnego w plik wdrożenia

-utworzono plik ```grafana.yaml``` będący definicją wdrożenia

-wykazano działanie na dashboard:
![9](8_services.png)
![10](8_kubernetes.png)







