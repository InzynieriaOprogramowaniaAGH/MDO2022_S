Wszystkie pliki wdrożenia YML, Dockerfile, Jenkinsfile oraz skrypt znajdują się w repozytorium z tym sprawozdaniem.

**Część pierwsza - lab11**

Instalacja Kubernetesa

![Zrzut ekranu 2022-06-10 015604.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20015604.png)

Umożliwienie swojemu kontu dostęp do Dockera bez użycia sudo, co jest konieczne aby Kubernetes działał

> sudo usermod -aG docker $USER

![Zrzut ekranu 2022-06-10 015801.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20015801.png)

Uruchomienie Kubernetesa

> minikube start

![Zrzut ekranu 2022-06-10 020441.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20020441.png)

Działający kontener Kubernetesa w Dockerze

![Zrzut ekranu 2022-06-10 020541.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20020541.png)

Dodanie aliasu, aby łatwiej wpisywać komendy

![Zrzut ekranu 2022-06-10 020843.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20020843.png)

![Zrzut ekranu 2022-06-10 021202.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20021202.png)

Uruchomienie dashboardu

> minikube dashboard

![Zrzut ekranu 2022-06-10 022337.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20022337.png)

Modyfikacja kroku Publish w Jenkinsfile w celu wysłania gotowego obrazu przygotowanego podczas kroku Build na Dockerhub

![Zrzut ekranu 2022-06-13 005102.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-13%20005102.png)

![Zrzut ekranu 2022-06-10 032320.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20032320.png)


Wykazanie działania obrazu i jego pracy jako kontener łącząc się dzięki IP kontenera jak i przekierowanemu portowi

> docker run djwo/nodejs.org -p 2137:8080

![Zrzut ekranu 2022-06-10 033006.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20033006.png)
![Zrzut ekranu 2022-06-10 033401.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20033401.png)
![Zrzut ekranu 2022-06-10 033415.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20033415.png)

Uruchomienie kontenera na stosie k8s i wykazanie jego działania

> minikube kubectl run -- nodejsorg-deploy --image=djwo/nodejs.org --port=8080 --labels app=nodejsorg-deploy
> 
> kubectl get po -A

![Zrzut ekranu 2022-06-10 033945.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20033945.png)
![Zrzut ekranu 2022-06-10 034250.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20034250.png)
![Zrzut ekranu 2022-06-10 034528.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20034528.png)

Przekierowanie portów w celu sprawdzenia działania aplikacji

>kubectl port-forward nodejsorg-deploy 7080:8080 

![Zrzut ekranu 2022-06-10 034833.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20034833.png)

Utworzenie pliku YML odpowiedzialnego za wdrożenie kontenera, ustawienie liczby replik na 2

![Zrzut ekranu 2022-06-13 010910.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-13%20010910.png)

Uruchomienie z utworzonego pliku

> kubectl apply -f nodejsorg-deployment.yml

![Zrzut ekranu 2022-06-10 041118.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20041118.png)
![Zrzut ekranu 2022-06-10 041252.png](screens%2Flab11%2FZrzut%20ekranu%202022-06-10%20041252.png)

**Część druga - lab12**

Zmiana liczby replik na 4

![Zrzut ekranu 2022-06-10 185324.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20185324.png)

Rozpoczęcie wdrożenia, sprawdzenie jego stanu i pokazanie działania w dashboardzie

> kubectl apply -f nodejsorg-deployment.yml
> 
> kubectl rollout status deployment.apps/nodejsorg-deploy

![Zrzut ekranu 2022-06-10 190509.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20190509.png)
![Zrzut ekranu 2022-06-10 191259.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191259.png)

Utworzenie nowego kontenera, którego uruchomienie zawsze kończy się błędem i wysłanie go na Dockerhuba

> docker build -f dockerFailer -t djwo/nodejs.org:fail .
> 
> docker image push djwo/nodejs.org:fail

![Zrzut ekranu 2022-06-10 190509.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20190509.png)
![Zrzut ekranu 2022-06-10 190957.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20190957.png)

Zwiększenie liczby replik do 5 i wykazanie działania

![Zrzut ekranu 2022-06-10 191336.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191336.png)
![Zrzut ekranu 2022-06-10 191443.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191443.png)
![Zrzut ekranu 2022-06-10 191501.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191501.png)

Zmniejszenie liczby replik do 1 

![Zrzut ekranu 2022-06-10 191709.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191709.png)
![Zrzut ekranu 2022-06-10 191624.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191624.png)
![Zrzut ekranu 2022-06-10 191730.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191730.png)

Zmniejszenie liczby replik do 0

![Zrzut ekranu 2022-06-10 191747.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191747.png)
![Zrzut ekranu 2022-06-10 191836.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191836.png)
![Zrzut ekranu 2022-06-10 191849.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191849.png)

Zmiana wersji obrazu na kończący się błędem - kontener cały czas jest restartowany, a polecenie rollout status nie kończy się

![Zrzut ekranu 2022-06-10 191939.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20191939.png)
![Zrzut ekranu 2022-06-10 192508.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20192508.png)
![Zrzut ekranu 2022-06-10 192523.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20192523.png)

Zmiana na poprzednią wersję obrazu

![Zrzut ekranu 2022-06-10 192650.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20192650.png)
![Zrzut ekranu 2022-06-10 192736.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20192736.png)
![Zrzut ekranu 2022-06-10 192753.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20192753.png)

Sprawdzenie poprzednich wersji wdrożenia i sprawdzenie informacji na temat jednej

> kubectl rollout history deployment.apps/nodejsorg-deploy
> 
> kubectl rollout history deployment.apps/nodejsorg-deploy --revision=1

![Zrzut ekranu 2022-06-10 193137.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20193137.png)

Przywrócenie poprzedniej wersji wdrożenia 

> kubectl rollout undo deployment.apps/nodejsorg-deploy --to-revision=1

![Zrzut ekranu 2022-06-10 193238.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20193238.png)

Utworzenie skryptu, który sprawdzał czy wdrożenie udało się lub też nie. Skrypt czeka 10 sekund na wykonanie komendy rollout status, a następnie zwraca komunikat czy wdrożenie się powiodło lub też nie.

![Zrzut ekranu 2022-06-13 013909.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-13%20013909.png)
![Zrzut ekranu 2022-06-10 193804.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20193804.png)
![Zrzut ekranu 2022-06-10 193947.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20193947.png)

Zmiana strategii wdrożeń na recreate - pody są wyłączane i tworzone od nowa jednocześnie co powoduje chwilowy brak dostępu do aplikacji

![Zrzut ekranu 2022-06-10 194814.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-10%20194814.png)

Zmiana strategii na RollingUpdate, gdzie jednocześnie wyłączana jest zadana liczba podów, gdy one wstaną wtedy kolejne są uaktualniane co minimalizuje brak dostępu do aplikacji.

![Zrzut ekranu 2022-06-13 014931.png](screens%2Flab12%2FZrzut%20ekranu%202022-06-13%20014931.png)

Canary deployment workload - Manualnie zmieniamy wersję wdrożenia dla danego poda.