# Sprawozdanie Lab 12

Sławomir Kotula

IT, DevOps, grupa lab 4

Data: 11.06.2022
# Uruchomienie poda z czterema replikami
W plik <b><i>nginx-deploymnet.yaml</i></b> z poprzednich zajęć zwiększono ilość tworzonych replik do czterech przez zmianę kodu
```
spec:
  replicas: 3
```
na
```
spec:
  replicas: 4
```
Po wykonaniu polecenia ```kubectl apply -f nginx-deploymnet.yaml``` pody zostały stworzone:
![web](screeny/01.png)
# Zbadaj stan za pomocą ```kubectl rollout status```
![status](screeny/02.png)
# Stworzono obraz nginx, który zwróci błąd przy uruchomieniu
![failed](screeny/03.png)
![failed](screeny/04.png)
# Zmiany w deploymencie
## Zmiana ilości replik:
```
spec:
  replicas: 6
```
![replicas](screeny/05.png)
<br/><br/>

Zostawienie jednej
```
spec:
  replicas: 1
```
![replicas](screeny/06.png)
<br/><br/>

Usunięcie wszystkich podów
```
spec:
  replicas: 0
```
![replicas](screeny/07.png)
# Zastosowanie nowszej wersji obrazu
Po zaktualizowaniu wersji obrazu do nowszej stworzony został nowy, tymczasowy pod. Po chwili stare pody zostały zastąpione nowymi, podczas aktualizowania do nowej wersji aplikacja nigdy nie przestała działać.
![upgrade](screeny/08.png)
![upgrade](screeny/09.png)

# Zastosowanie złej wersji obrazu
![failed](screeny/10.png)
### ```kubectl rollout history deployment nginx-deployment```
![rollout](screeny/11.png)
### ```kubectl rollout undo deployment nginx-deployment```
Wersja 

![rollout](screeny/12.png)
### ```minikube kubectl describe deployment```
![describe](screeny/13.png)