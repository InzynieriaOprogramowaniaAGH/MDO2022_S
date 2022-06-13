# Metodyki devops sprawozdanie lab11

## Instalacja kubernates

Instalacja została przeprowadzona na maszynie wirtualnej (Oracle VirtualBox).
Kubernates wykorzystuje docker'a jako driver.

1. Dodanie użystkowanika do grupy `docker`

    Operacja ta była konieczna w celu podjęcia kroku nr 2

        sudo usermod -aG docker $USER

    *Aby zmiany zostały zastosowane należy wylogować, a następnie
    zalogować ponownie na konto*

2. Instalacja kubernates
    
        minikube start

    ![](ss/01-kubernates_installation.png)
    ![](ss/02-kubectl_alias_creation_and_run.png)

## Uruchamianie oprogramowania

    minikube kubectl run -- http-serv --image=httpd:2.4 --port=80 --labels app=http-serv

![](ss/03.1-dress_container_with_pod.png)

![](ss/03.2-it_works_view_after_forwarding.png)


## Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

Stan obrazów przed rozpoczęciem pracy
![](ss/06-docker_images_view.png)

Docker-compose użwany do budowania kontenerów
![](ss/04-docker-compose_before_conversion.png)

Komenda użyta do konwersji `docker-compose.yml`
(wywołana wewnątrz folderu z docker-compose)

    kompose convert

![](ss/05-conversion.png)

Edycja pliku `httpd-deployment.yaml` w celu zwiększenia liczby replik
![](ss/07-replicas_modification.png)

Rozpoczęcie wdrożenia

    kubectl apply -f .

![](ss/08-kubectl_apply.png)

Dashboard po zakończeniu procesu wdrożenia
![](ss/09-dashboard_with_deployments.png)
![](ss/10-dashboard_with_pods.png)

Zbadanie elementu

    kubectl rollout status deployment/httpd

![](ss/11-kubectl_rollout_status_deployment_httpd.png)

## Przygotowanie nowego obrazu

Do istniejących obrazów (prezentowanych powyżej) dodano obraz mający na celu
spowodować błąd
![](ss/12-creation_of_container_that_yields_error.png)

## Zmiany w deploymencie

Dashboard po zwiększeniu liczby replik do 8
![](ss/13-8pods.png)

Dashboard po zmniejszeniu liczby replik do 1
![](ss/14-1pod.png)

Dashboard po zmniejszeniu liczby replik do 0
![](ss/15-0pods.png)

Deployment starej oraz nowej wersji, sprawdzenie historii
![](ss/16-rollout_history_creation.png)

Przywrócenie poprzedniej wersji wdrożenia
![](ss/17-rollout_undo.png)

## Kontrola wdrożenia

Deplyment błędogennej wersji
![](ss/18-deploy_bad_image.png)
![](ss/19-result_of_deploying_bad_image.png)

Ręczny powrót do działającej wersji
![](ss/20-back_to_working_deployment.png)

Skrypt do automatyzacji powrotu do ostatniego deply'u,
w przypadku kiedy deployment nie zostanie wdrożony w przeciągu 1 minuty

![](ss/21-script.png)

```bash
#!/bin/bash

kubectl apply -f .
sleep 60
if ! kubectl rollout status deployment httpd; then
	echo "error, undoing changes"
	kubectl rollout undo deployment httpd
	exit 1
else
	echo "success"
fi
```

Działanie skryptu
![](ss/22-script_in_action_1.png)
![](ss/22-script_in_action_2.png)
