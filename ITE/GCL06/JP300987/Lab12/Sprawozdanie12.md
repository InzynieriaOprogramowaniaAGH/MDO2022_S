**SPRAWOZDANIE 12**
**Wdrażanie na zarządzalne kontenery: Kubernetes (2)**
##
**Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML:**

Wzbogacenie obrazu z poprzednich zajęć do 4 replik:
Plik .yml:
``
s1

Wdrożenie za pomocą polecenia `kubectl apply`. Zbadanie stanu po wdrożeniu za pomocą `kubectl rollout status`:
s2
s3
##
**Przygotowanie nowego obrazu:**
Przygotowanie obrazu, którego uruchomienie kończy się błędem za pomocą odpowiedniego dockerfile'a:
s4

Zbudowanie błędnego obrazu:
s5
##
**Zmiany w deploymencie:**
Zwiększenie ilości replik w pliku YAML z 4 na 5:
s6
s7

Zmniejszenie liczby replik z 5 na 1:
s8
s9

Zmniejszenie liczby replik na 0:
s10
s11


Uruchomienie nowej wersji obrazu z błędem, zmiana obrazu w pliku .yml:
s13

Wdrożenie błędnego obrazu:
s14
Próba zbadania stanu kończy się błędem poprzedzonym długim czasem oczekiwania.

Stan pods'ów w przypadku wdrożenia z poprawnym obrazem:
s12

Stan pods'ów w przypadku wdrożenia z błędnym obrazem:
s15

Dashboard z błędnym obrazem:
s16

Przywrócenie poprzedniej wersji wdrożenia za pomocą poleceń `kubectl rollout history` oraz `kubectl rollout undo`:
s17

Dashboard po przywróceniu:
s18

##
**Kontrola wdrożenia:**
Skrypt weryfikujące czy wdrożenie zdążyło się wdrożyć (60 sekund):
s19

Uruchomienie skryptu z plikiem .yml, który zawiera poprawny obraz:
s20

Uruchomienie skryptu z plikiem .yml, który zawiera błędny obraz:
s21

##
**Strategie wdrożenia:**
Przygotowanie wersji wdrożeń stosując różne strategie wdrożeń:
Recreate:
W celu użycia strategi Recreate należy w pliku .yml dodać w sekcji spec następujące linijki:
 strategy:
    type: Recreate

Wdrożenie:
22a

Dashboard:
22

Rolling Update:
W celu użycia strategi Rolling Update należy w pliku .yml dodać w sekcji spec następujące linijki:
strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1

Wdrożenie:
s23a

Dashboard:
23

Canary Deployment Workload:
W celu użycia strategi Canary Deployment Workload należy w pliku .yml dodać w sekcji metadata następujące linijki:
track: stable

version: "1.5"

Wdrożenie:
25

Dashboard:
24


Zaobserwowane różnice:
Działanie strategii Recreate sprowadza się do usunięcia istniejących pods'ów, następnie uruchamia nowe podsy. 

Strategia Rolling Update działa podobnie do strategii Recreate, z tym że w tym przypadku można określić ilość pods'ów usuwanych, działających na starym obrazie oraz na nowym.

Canary Deployment Workload dzięki tej strategii możemy dodać do naszych pods'ów etykiety określające wersję danego podsa co pomaga użytkownikom, którzy są zainteresowani określoną wersją.
