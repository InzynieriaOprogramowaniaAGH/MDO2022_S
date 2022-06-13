# Sprawozdanie 12
# Agata Socha Inżynieria Obliczeniowa GCL02

##  Konwersja wdrożenia ręcznego na wdrożenie deklaratywne YAML

Na poprzednich zajęciach udało się stworzyć plik YAML i udało się go nie zgubić pomiędzy zaj 11 a 12 i na dole dowód, że taki plik dalej mam:


![](./img/1.PNG)


Na samym początku wzbogacono obraz o 4 repliki:

![](./img/2.PNG)


i wdrożono plik za pomocą komendy
`` kubectl apply -f file1.yaml ``

![](./img/7.PNG)

i zbadano stan pliku za pomocą komendy 

``kubectl rollout status deploymnt nginx-deployment``

![](./img/3.PNG)

![](./img/4.PNG)


## Przygotowanie nowego obrazu

Znaleziono nową wersję obrazu nginx, którym była wersja nginx:1.14.2

![](./img/5.PNG)


## Zmiany w deploymencie

Najpierw wykonywano zmiany na nowej wersji obrazu (nginx:latest) 
- zmniejszenie liczby replik do 1

![](./img/6.PNG)


- wdrożenie pliku i wykazanie działania 

![](./img/7.PNG)

- zmniejszenie liczby replik do 0

![](./img/8.PNG)


- wdrożenie pliku i wykazanie działania 

![](./img/9.PNG)

Po dokonaniu zmian, zmieniono jeszcze wersję obrazu na nginx:1.14.2 


![](./img/10.PNG)

i sprawdzono działanie:

![](./img/11.PNG)

Następnie sprawdzono historie wdrożeń za pomocą komendy 
``kubectl rollout history deployment/nginx-deployment``

![](./img/13.PNG)

I przywrócono wersję obrazu nginx:latest za pomocą komendy 

``kubectl rollout undo deployment/nginx-deployment``

![](./img/14.PNG)

![](./img/15.PNG)

![](./img/16.PNG)


## Kontrola wdrożenia

Aby napisać skrypt sprawdzający, czy wdrożenie zdążyło si wdrożyć w czasie 60s, należy wiedzieć, że status "wyrobienia się w czasie" sprawdzamy za pomoca komendy ``rollout status``. Czas, po którym sprawdzamy ten nasz status wdrożenia ustanawiamy poprzez komendę ``slep 60``. 
W skrypcie wykorzystujemy prostego if'a, który sprawdza czy właśnie po wywołaniu komendy ``rollout status`` po upływie 60s wypluwa sie słowo ``successfully``. Jeśli się wypluwa to znaczy, że wdrożenie się zdążyło zrobić a jeśli nie wypluwa to znaczy że się nie zdążyło zrobić lub powstał jakiś inny błąd. 


![](./img/17.PNG)

Nasz komunikat świadczący o tym, że wdrożenie się zrobiło to "zycie jest prawie piekne" i możemy zaobserwować właśnie pomyślne działanie skryptu na screenie poniższym: 

![](./img/18.PNG)


## Strategie wdrożenia

1. **Recreate**

Do zmiany typu strategii na Recreate użyliśmy podanego pliku: 

![](./img/20.PNG)

Sprawdziliśmy komendą ``kubctl describe deployment nginx-deployment`` czy pomyślnie się strategia zmieniła: 

![](./img/21.PNG)

I jeszcze się upewniliśmy w dashboardzie: 

![](./img/22.PNG)


2. **RollingUpdate** 

Na początku w pliku mieliśmy strategię RollingUpdate, gdzie maxSruge i maxUnavailable było podane procentowo: 

![](./img/19.PNG)

Zmieniliśmy sobie jeszcze dodatkowo te opcje jako podanie max  ilości podów  do dodania i ilości podów nieaktywnych liczbowo a nie procentowo: 

![](./img/23-rol.PNG)

![](./img/24-rol.PNG)

![](./img/25-rol.PNG)


3. **Canary deployment workload** 

W tym przypadku podano nowa nazwe i wersję:

![](./img/29.PNG)

I możemy zaobserwować działanie nowego deploymentu

![](./img/30.PNG)


### Obserwacje i różnice

**Rolling Update:**
- domyślna strategia
- zastępuje pody ze starą wersją aplikacji nową wersją, jeden po drugim, bez przestojów w klastrze

**Recreate**- kończy wszystkie pody i zastępuje je nową wersją

Plusy tej strategii - stan aplikacji jest całkowicie odnowiony 
Minusy - czas przestoju, który zależy zarówno od czasu zamknięcia, jak i czasu rozruchu aplikacji

**Canary deployment** - korzysta z podejścia progresywnego, przy czym jedna wersja aplikacji obsługuje większość użytkowników, a inna, nowsza wersja obsługuje niewielką pulę użytkowników testowych. Co najmniej dwie usługi lub wersje aplikacji są wdrażane równolegle, jedna z istniejącą wersją, a druga z nowymi funkcjami. Użytkownicy są stopniowo przenoszeni do nowej wersji, co pozwala na walidację nowej wersji poprzez udostępnienie jej prawdziwym użytkownikom. Jeśli nie zostaną zgłoszone żadne błędy, jedną z nowych wersji można stopniowo wdrażać u wszystkich użytkowników.

Plusy tej strategii - łatwe monitorowanie błedów i wydajności + szybkie cofanie 
Minusy - powolne wdrażanie 

