## Zadania do wykonania
### Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML
 * Upewnij się, że posiadasz wdrożenie z poprzednich zajęć zapisane jako plik
![image](./sc_devops_12/1.png)
 * Wzbogać swój obraz o 4 repliki
![image](./sc_devops_12/2.png)
 * Rozpocznij wdrożenie za pomocą ```kubectl apply```
![image](./sc_devops_12/3.png)
 * Zbadaj stan za pomocą ```kubectl rollout status```
![image](./sc_devops_12/4.png)

### Przygotowanie nowego obrazu
Wybrałem obraz gotowy i używane będą "Redis 6" oraz "Redis 7" jako różne wersje.
  
### Zmiany w deploymencie
 * Aktualizuj plik YAML z wdrożeniem i przeprowadzaj je ponownie po zastosowaniu następujących zmian:
   * zwiększenie replik
![image](./sc_devops_12/6.png)
![image](./sc_devops_12/5.png)
   * zmniejszenie liczby replik do 1
![image](./sc_devops_12/7.png)
![image](./sc_devops_12/8.png)
   * zmniejszenie liczby replik do 0
![image](./sc_devops_12/9.png)
![image](./sc_devops_12/10.png)
   * Zastosowanie nowej wersji obrazu
![image](./sc_devops_12/11.png)
   * Zastosowanie starszej wersji obrazu
![image](./sc_devops_12/12.png)
 * Przywracaj poprzednie wersje wdrożeń za pomocą poleceń
   * ```kubectl rollout history```
   * ```kubectl rollout undo```
![image](./sc_devops_12/13.png)

### Kontrola wdrożenia
 * Napisz skrypt weryfikujący, czy wdrożenie "zdążyło" się wdrożyć (60 sekund)
Nie wiedziałem jak zastosować to w skrypcie ale działająca komenda od kubectl była by dobrym tropem. Czeka czy stan Poda jest "ready". Można byłoby opakoawć go w skrypt który czeka 60 sekund.
`minikube kubectl -- wait pod --for=condition=Ready -l app=$labelname`
 
### Strategie wdrożenia
 * Przygotuj wersje wdrożeń stosujące następujące strategie wdrożeń
   * Recreate
Ta strategia wdrożenia może powodować downtime ponieważ przykładowo w trakcie update'ów wszystkie pody są wyłączane jednocześnie i zastępywane nowymi wersjami.
![image](./sc_devops_12/14.png)
![image](./sc_devops_12/15.png)
   * Rolling Update
Ta strategia nie powoduje downtime'ów ponieważ aktualizuje po jednym pod'zie na raz.
![image](./sc_devops_12/16.png)
![image](./sc_devops_12/17.png)
   * Canary Deployment workload
![image](./sc_devops_12/18.png)
Canary Deployment otrzymujemy poprzez utworzenie dwóch różnych deploymentów ze wspólnymi etykietami. Działa to na zasadzie wystawienia dwóch różnych wersji z tym że wersja wdrażana otrzymuje mniejszy procent udziału w całym deploymencie.