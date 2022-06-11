**SPRAWOZDANIE 12**

**Wdrażanie na zarządzalne kontenery: Kubernetes (2)**
##
**Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML:**


Wzbogacenie obrazu z poprzednich zajęć do 4 replik:


Plik .yml:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jp-nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 4
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        imagePullPolicy: Never
        ports:
        - containerPort: 2222
```
        
![1](https://user-images.githubusercontent.com/92218468/173178604-d6526375-5dbb-4b53-bc9e-3506ca122da8.JPG)



Wdrożenie za pomocą polecenia `kubectl apply`. Zbadanie stanu po wdrożeniu za pomocą `kubectl rollout status`:

![2](https://user-images.githubusercontent.com/92218468/173178609-221d8759-eba5-40f7-9e95-ecb0d7f34a19.JPG)

![3](https://user-images.githubusercontent.com/92218468/173178615-a713fc58-2c43-4466-b9de-1489eb2f200e.JPG)

##
**Przygotowanie nowego obrazu:**

Przygotowanie obrazu, którego uruchomienie kończy się błędem za pomocą odpowiedniego dockerfile'a:

![4](https://user-images.githubusercontent.com/92218468/173178619-89cf19e0-0f93-45ab-942b-608677f5500e.JPG)

Zbudowanie błędnego obrazu:

![5](https://user-images.githubusercontent.com/92218468/173178622-8aba9c39-3bbc-4c21-b9e5-1250420206db.JPG)

##
**Zmiany w deploymencie:**

Zwiększenie ilości replik w pliku YAML z 4 na 5:

![6](https://user-images.githubusercontent.com/92218468/173178628-9a0b367f-4b60-489d-96e2-44f87d2ce573.JPG)

![7](https://user-images.githubusercontent.com/92218468/173178631-5906dd43-f5c3-455d-8278-6a30172d10fd.JPG)

Zmniejszenie liczby replik z 5 na 1:

![8](https://user-images.githubusercontent.com/92218468/173178636-7758154a-fdb9-4689-948c-c45bbfa8f2f0.JPG)

![9](https://user-images.githubusercontent.com/92218468/173178639-75da07c1-b2c5-45dc-b50e-0b6ed4895870.JPG)


Zmniejszenie liczby replik na 0:

![10](https://user-images.githubusercontent.com/92218468/173178645-d38b364e-c4df-4d6d-8c05-4acf1e73b1c9.JPG)

![11](https://user-images.githubusercontent.com/92218468/173178647-bbdcabf2-abe1-44b6-9b6f-4aaac0e4f8ee.JPG)

Uruchomienie nowej wersji obrazu z błędem, zmiana obrazu w pliku .yml:

![13](https://user-images.githubusercontent.com/92218468/173178653-b3c7f7f2-6607-43dd-85f4-ff486e19a0c8.JPG)

Wdrożenie błędnego obrazu:

![14](https://user-images.githubusercontent.com/92218468/173178673-de5b06f1-ef57-4bcd-a40f-515baab8aef5.JPG)


Próba zbadania stanu kończy się błędem poprzedzonym długim czasem oczekiwania.

Stan pods'ów w przypadku wdrożenia z poprawnym obrazem:

![12](https://user-images.githubusercontent.com/92218468/173178678-8fcccae7-571f-4f8a-a261-004956d605f9.JPG)


Stan pods'ów w przypadku wdrożenia z błędnym obrazem:

![15](https://user-images.githubusercontent.com/92218468/173178681-70359e12-09bf-488c-8253-7f615515c8fd.JPG)


Dashboard z błędnym obrazem:

![16](https://user-images.githubusercontent.com/92218468/173178693-4a2a9112-af95-4bce-8dfb-e043a8ff30a0.JPG)


Przywrócenie poprzedniej wersji wdrożenia za pomocą poleceń `kubectl rollout history` oraz `kubectl rollout undo`:

![17](https://user-images.githubusercontent.com/92218468/173178697-1fdfaf73-22d0-4134-af1f-72e9f2b2d78c.JPG)


Dashboard po przywróceniu:

![18](https://user-images.githubusercontent.com/92218468/173178702-9f59250b-1a47-42ac-8d41-8510a868a53e.JPG)


##
**Kontrola wdrożenia:**

Skrypt weryfikujące czy wdrożenie zdążyło się wdrożyć (60 sekund):

Zawartość skryptu:
```
#!/bin.bash
kubectl apply -f d.yml
sleep 60
kubectl rollout status deployment/jp-nginx-deployment
if [[ "$?" -ne 0 ]]; then
    echo "ERROR"
else
    echo "OK"
fi
```

![19](https://user-images.githubusercontent.com/92218468/173178715-17f12262-d328-4272-89cf-7c1eee5902c1.JPG)


Uruchomienie skryptu z plikiem .yml, który zawiera poprawny obraz:

![20](https://user-images.githubusercontent.com/92218468/173178721-025315dd-ddb3-43f0-ad4d-d59d27553447.JPG)


Uruchomienie skryptu z plikiem .yml, który zawiera błędny obraz:

![21](https://user-images.githubusercontent.com/92218468/173178723-f26b5f3a-651a-4453-8515-deaa4989d3f1.JPG)


##
**Strategie wdrożenia:**

Przygotowanie wersji wdrożeń stosując różne strategie wdrożeń:

Recreate:

W celu użycia strategi Recreate należy w pliku .yml dodać w sekcji spec następujące linijki:
 ```
 strategy:
    type: Recreate
```
Wdrożenie:

![22a](https://user-images.githubusercontent.com/92218468/173178728-651497f7-dd21-4a8b-8bcf-62707505c44f.JPG)


Dashboard:

![22](https://user-images.githubusercontent.com/92218468/173178729-3a9aa80a-7e0f-4b4c-abb4-316cf25c45e3.JPG)


Rolling Update:

W celu użycia strategi Rolling Update należy w pliku .yml dodać w sekcji spec następujące linijki:

```
strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
```
Wdrożenie:

![23a](https://user-images.githubusercontent.com/92218468/173178731-4a78a2a4-ef35-47be-8fae-12e8a466ec42.JPG)


Dashboard:

![23](https://user-images.githubusercontent.com/92218468/173178733-b84f257b-d9d2-4d51-9ce5-31313309b1f0.JPG)


Canary Deployment Workload:

W celu użycia strategi Canary Deployment Workload należy w pliku .yml dodać w sekcji metadata następujące linijki:
```
track: stable
version: "1.5"
```
Wdrożenie:

![25](https://user-images.githubusercontent.com/92218468/173178734-2c03d506-c480-47c4-95cc-9baed0e8e9c2.JPG)


Dashboard:

![24](https://user-images.githubusercontent.com/92218468/173178738-6fd4f82a-186c-4902-96bb-6cd123467b1c.JPG)



Zaobserwowane różnice:

Działanie strategii Recreate sprowadza się do usunięcia istniejących pods'ów, następnie uruchamia nowe podsy. 


Strategia Rolling Update działa podobnie do strategii Recreate, z tym że w tym przypadku można określić ilość pods'ów usuwanych, działających na starym obrazie oraz na nowym.


Canary Deployment Workload dzięki tej strategii możemy dodać do naszych pods'ów etykiety określające wersję danego podsa co pomaga użytkownikom, którzy są zainteresowani określoną wersją.
