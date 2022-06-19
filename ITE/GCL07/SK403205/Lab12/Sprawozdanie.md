# Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML
wzbogacono obraz o 4 repliki oraz rozpoczecie wdrożenia 
`kubectl apply -f lab11.yaml`
![](./1.png)
w dashboardzie:
![](./2.png)
`kubectl rollout status deployment nginx-deployment`,  sprawdzenie stanu pliku.
## Przygotowanie nowego obrazu
wersja obrazu niginx: `nginx:1.14.2`
## Zmiany w deploymencie
zmniejszenie liczby replik do 1
![](./3.png)
zmniejszenie liczby replik do 0
![](./4.png)
zastosowanie nowej wersji obrazu (powyżej - wersja latest)
zastosowanie starszej wersji obrazu (nginx:1.14.2)
![](./5.png)
nadtepne polecenia
`kubectl rollout history deployment/nginx-deployment`
`kubectl rollout undo deployment/nginx-deployment`

 skrypt `script.sh`, weryfikuje czy wdrożenie zaszło w czasie 60 sekund. Sprawdzane jest to przy użyciu kubectl rollout status deployment/nginx-deployment i sleep 60.
 ![](./6.png)
 ## Recreate
 zmiany w pliku yaml
 ![](./7.png)
 `kubectl describe deployment nginx-deployment`
  ![](./8.png)
## RollingUpdate
analogiczna do poprzedniej zmiana w pliku yaml
 `kubectl describe deployment nginx-deployment`
  ![](./9.png)
 ![](./10.png)
 ## Canary Deployment workload
  ![](./11.png)
![](./12.png)
Recreate - strategia, w której ma miejsce zakończenie działania podów ze starą wersją zanim nastąpi zastąpienie nowszą, zapewniona zostaje ciągłość co do aktualizacji stanu aplikacji, znaczenie ma tu jednak czas przestoju wdrożenia

Rolling Update - charakterystyczne jest stopniowe aktualizowanie podów ze starą wersją

Canary Deployment workload - charakterystyczne podejście progresywne, gdzie jedna wersja aplikacji obsługuje większość użytkowników, natomiast nowsza wersja obsługuje użytkowników testowych (nowe oprogramowanie wdrażane obok starszych wersji)
