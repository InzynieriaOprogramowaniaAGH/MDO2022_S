<h1>Sprawozdanie z zajęć laboratoryjnych 12 Metodyki DevOps</h1>
<strong>Mateusz Janik</strong>

<strong>grupa laboratoryjna 03</strong>

Zadania, które wykonałem:

<strong>
Uruchomiłem poda z czterema replikami

![Image](1s.JPG " ")

![Image](2s.JPG " ")

Zbadałem stan/status

![Image](2s_2.JPG " ")

Stworzyłem obraz nginx, który zwróci bład przy uruchomieniu

![Image](3s_pop.JPG " ")
![Image](4s.JPG " ")

Zmieniłem ilość replik na 8

![Image](5s.JPG " ")

Zmieniłem ilość replik na 1

![Image](6s.JPG " ")

Zmieniłem ilość replik na 0

![Image](7s.JPG " ")

Zastosowałem nowszą wersję obrazu

Po zrobieniu tego pojawił się tymczasowy pod. Po chwili stare pody zostały zamienione na nowe z nowszą wersją obrazu.

![Image](8s.JPG " ")

Zastosowałem złą wersję obrazu

![Image](9s.JPG " ")

kubectl rollout history

kubectl rollout undo

![Image](10s.JPG " ")

minikube kubectl describe deployment

![Image](11s.JPG " ")

Recreate:

Strategia wdrożenia polegająca na tym, że wszystkiego pody są zabijane przed powstaniem nowych

Rolling Update:

Strategia polegająca na krokowym aktualizowaniu następnych podów.
Ta strategia zapewnia ciągłość działania aplikacji

Canary Deployment workload:

Jest to jedna ze strategii blue,green. Polega ona na tym, że nowa aplikacja jest wdrażana obok starej. Jeżeli wersja dobrze sobie radzi to poprzednia wersja jest wygaszana, a ruch przekierowywany jest do podów wersji wyżej.

