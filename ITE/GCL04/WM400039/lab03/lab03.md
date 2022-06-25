# Lab03

## W ramach laboratorium zdecydowałem się na wykorzystanie komunikatora Wire.
## https://github.com/wireapp/wire-webapp
## Doinstalowałem wymagane zależności (menedżer projektu yarn) 
![](yarn.png)
## Zbudowałem aplikację zgodnie z instrukcją zamieszczoną w repozytorium projektu
![](buildlocal.png)
## Uruchomiłem testy, żeby zweryfikować poprawność działania aplikacji
![](testlocal.png)

## Uruchomiłem kontener na bazie obrazu node:16.14.2-alpine w trybie interaktywnym
![](twkontenera.png)
## Zbudowałem aplikację w kontenerze, wcześniej instalując yarna i jego zależności
![](build.png)
## Testy
![](test.png)
## Po weryfikacji poprawnego działania aplikacji stworzyłem dwa dockerfile
## Build Dockerfile
![](builddockerfile.png) <br>
## Test Dockerfile
![](testdockerfile.png) <br>
## Mając już gotowe te pliki utworzyłem nowy obraz korzystający z dockerfila na bazie poprzedniego obrazu
![](buildimage.png)
![](sukceswbudowaniukontener.png)
## Analogicznie z testowym imagem, z taką różnicą, że do budowania testowego obrazu wykorzystałem obraz do budowania (widać to w dockerfilu)
![](przejscietestow.png)

<br> <br> <br> <br>
## <b> Problemy i porażki </b>
## W ramach laboratorium poświęciłem kilka godzin na poszukiwanie działającej 
## na kontenerze i posiadającej unit testy apki. Krótka lista sprawdzonych repozytoriów:
## <br>
## https://github.com/microsoft/PowerBI-JavaScript
## https://github.com/airsquared/blobsaver
## https://github.com/bootique/bootique
## https://github.com/ThrowTheSwitch/Unity
## https://github.com/ThrowTheSwitch/Unity
## https://github.com/jsbin/jsbin
## 
## <br> <b>Przykładowe problemy z wyżej wymienionymi aplikacjami: </b>
##  - aplikacja jest dekstopowa, co za tym idzie nie uruchomi się na dockerze; 
##  - aplikacja do testów wykorzystuje przeglądarki takie jake Chrome czy PhantomJS;  
##  pomimo usilnych prób nie udało mi się zainstalować tych przeglądarek na kontenerze;
##  - aplikacja jest leciwa, i co za tym idzie, wykorzystuje stare wersje NPMa i Noda, które
##   nie są kompatybilne z nowszymi; powoduje to problemy z instalacją i dziwne bugi; 

## <br> <br> Gdy już udało znaleźć mi się odpowiednią, działającą aplikację, okazała się ona zajmować ponad 3 GB miejsca na dysku. Pomijając problem ze zmieszczeniem jej na wirtualnej maszynie, budowała się ona każdorazowo ponad pół godziny.

