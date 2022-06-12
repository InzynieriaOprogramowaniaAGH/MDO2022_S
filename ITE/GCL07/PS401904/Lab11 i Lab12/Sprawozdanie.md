# Sprawozdanie
##
## Patryk Stefan GĆL_07
##
##

### Instalacja minikube

##### Instalacja minikube zgodnie z dokumentacją oraz sprawdzenie sumy kontrolnej.
![Screenshot](1.png)
![Screenshot](2.png)
##### Instalacja kubectl.
![Screenshot](3.png)
##### Próba uruchomienia minikube- zakończona niepowodzeniem.
![Screenshot](4.png)
##### Po wpisaniu komendy wyświetlonej przez logi minikube oraz kolejnym uruchomieniu wszystko poszło w porządku. (Pomijam problem z używaniem przez VB 1 rdzenia procesora, co też skutkowało problemem, ponieważ minikube zgodnie z dokumentacją wymaga przynajmniej 2 rdzeni. Pomijam, bo zapomniałem to udokumentować.). Ponadto sprawdzenie node'ów oraz podów.
![Screenshot](5.png)
##### Uruchomienie dashboardu komendą: minikube dashboard.
![Screenshot](6.png)

### Próba uruchomienia express.js.
Programem, który został wybrany do realizacji poprzednich laboratoriów jest express.js, który nadaje się do użycia, ponieważ podczas uruchamiania skryptów udostępnia port :3000.

##### Stworzenie dockerfile'a w celu utworzenia obrazu z artefaktem express.js oraz skopiowanie przykładowej apki do uruchomienia.
![Screenshot](7.png)
##### Budowa obrazu z dockerfile'a.
![Screenshot](8.png)
##### Poprawnie uruchomienie kontenera z wcześniej stworzonym obrazem, wyeksponowanie portu 49160 oraz potwierdzenie jego działania.
![Screenshot](9.png)
##### Po włączeniu kontenera jesteśmy w stanie uruchomić naszą apkę na porcie :49160.
![Screenshot](10.png)

### Pierwsze kroki z podami

##### Stworzony został następujący plik pod.yml.
![Screenshot](11.png)
##### Stworzenie poda na podstawie pliku pod.yml oraz sprawdzenie statusu- EeeImageNeverPull
![Screenshot](12.png)
##### Po przekopaniu stacka rozwiązaniem problemu okazało się to, że należy zadeklarować zmienną środowiskową w następujący sposób: eval $(minikube docker-env), aby obrazy dockerowe stworzone lokalnie były widoczne dla minikube.
##### Po wprowadzeniu powyższych zmian pod wystartował bez zarzutów.
![Screenshot](13.png)
##### Działanie poda- widoczne w dashboardzie.
![Screenshot](14.png)
##### Przekierowanie portu komendą port-forward z portu 3000 na port 7500.
![Screenshot](15.png)
##### Już po chwili można było połączyć sie localhostem na porcie :7500.
![Screenshot](16.png)

### Przekucie wdrożenia manualnego w plik wdrożenia

##### Na początku wzbogacony został plik pod.yml o stworzenie replik oraz zapisany jako plik podDeploy.yml.
![Screenshot](17.png)
##### Wyświetlenie działania (Dopiero pod koniec wykonywania laboratoriów zauważyłem, że działał jeszcze stary pod, który wyłączyłem dopiero pod koniec :|).
![Screenshot](18.png)
##### Działanie widoczne w dashboardzie (running 3 a nie 2 z powyższego powodu :|).
![Screenshot](19.png)

### Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

##### Wzbogacenie pliku podDeploy.yml do ilości replik=5 oraz uruchomienie, wyświetlenie działania podów oraz sprawdzenie rollout status.
![Screenshot](20.png)
##### Zmiana na 10 replik oraz sprawdzenie rollout status w trakcie wdrażania zmian.
![Screenshot](21.png)
##### Działanie w dashboardzie
![Screenshot](22.png)
##### Zmiana ilości replik na 1.
![Screenshot](23.png)
##### Działanie w dashboardzie.
![Screenshot](24.png)
##### Stworzenie nowego lokalnego obrazu- node-app-fail, który jak nazwa mówi nie działa poprawnie.
![Screenshot](25.png)
##### Usunięcie tego jednego poda, który działał od początku i przeszkadzał.
![Screenshot](26.png)
##### Działanie podów po zmianie na błędny obraz.
![Screenshot](27.png)
##### Sprawdzenie historii rollout oraz wyświetlenie konkretnych logów
![Screenshot](28.png)
##### Przywrócenie poprawnego wdrożenia
![Screenshot](29.png)
##### Potwierdzenie poprawności działania w dashbaordzie
![Screenshot](30.png)

### Kontrola wdrożenia

##### Napisanie skryptu bashowego, który zwraca błąd jeśli wdrożenie trwa dłużej niż 60 sekund.
![Screenshot](31.png)
##### Uruchomienie skryptu
![Screenshot](32.png)

### Strategie wdrożenia

##### Recreate
W tej strategii najpierw zabijane są stare wersje, a następnie wdrażane nowe.
Na zrzucie ekranu pod komendą "kubectl describe deployments" widać użytą strategię przy polu: StrategyType
![Screenshot](33.png)
##### RollingUpdate
W strategii RollingUpdate najpierw wyłączane są pody, a następnie progresywnie włączane.
Strategia RollingUpdate przyjmuje dwie właściwości:
- maxSurge - określa ilośc podów, które są włączane w określonym czasie
- maxUnavailable - określa ilość podów które mogą być niedostępne w trakcie wdrażania zmian

Na zrzucie ekranu pod komendą "kubectl describe deployments" widać użytą strategię przy polu: StrategyType
![Screenshot](34.png)
##### Canary
Strategia canary nie posiada swojego odpowiednika w kodzie .yml przy polu strategy: -> type:  tak jak RollingUpdate, czy Recreate ( lub jej nie znalazłem :|). Polega ona na wdrożeniu nowej wersji aplikacji obok starej- stabilnej wersji.








