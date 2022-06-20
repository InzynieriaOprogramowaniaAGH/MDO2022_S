
# Projekt 
## Rosiak B³a¿ej
### Wdra¿anie na zarz¹dzalne kontenery: Kubernetes
Instalacja minikube'a:

![](1.png)

Uruchomienie minikube'a i dashboarda:

![](2.png)
![](3.png)

Kontener minikube'a:

![](4.png)

Utworzenia poda nginx:

![](5.png)
![](6.png)

Przekierowanie portów + sprawdzenie poprawnoœci dzia³ania:

![](7.png)
![](8.png)

Utworzenie YAML'a tworz¹cego dwa pody *nginx*, stworzenie podów na podstawie plików i sprawdzenie dzia³ania:

![](9.png)
![](10.png)
![](11.png)

Zmiana iloœci replik/podów na 4 (zmiana, wdro¿enie i sprawdzenie):

![](12.png)
![](13.png)
![](14.png)

Badanie stanu za pomoc¹ *kubectl rollout status*:

![](15.png)

Budowa obrazu, które zadaniem bêdzie zawsze zwróciæ b³¹d:

![](16.png)
![](17.png)

Zabawa podami (iloœci¹ replik):
- 8 replik:

![](18.png)
![](19.png)

- 1 replika:

![](20.png)
![](21.png)

- 0 replik:

![](22.png)
![](23.png)

- Nowsza wersja:

![](24.png)
![](25.png)

- Z³y obraz:

![](26.png)
![](27.png)

U¿ycie komendy *kubectl rollout history* w celu pokazania historii zmian oraz *kubectl rollout undo* w celu wycofania ostatniego, niedzia³aj¹cego kontenera:

![](28.png)

Utworzenie skryptu weryfikuj¹cego czy wdro¿enie zd¹¿y³o siê wdro¿yæ i uruchomienie go:

![](29.png)