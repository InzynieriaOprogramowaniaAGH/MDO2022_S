| Imię i nazwisko  | Grupa | Numer ćwiczenia     |
|------------------|-------|------------|
| Radosław Jurczak | 03    | Lab03 |

## Wybranym repozytorium jest deltachat-desktop:  
https://github.com/deltachat/deltachat-desktop

1. Pobranie obrazu node  
![](1.png)  
Sprawdzenie docker images  
![](2.png)  
Uruchomienie kontenera i pobranie repozytorium  
![](3.png)  
Przejście do katalogu głównego repozytorium  
![](4.png)  
Uruchomienie npm install  
W wyniku problemów z połączeniem internetowym dodano kilka linijek do npm config:  
![](0.png)  
npm install  
![](5.png)  
![](6.png)  
npm run build  
![](7.png)  
npm run test  
![](8.png)  
![](9.png)  

Utworzenie dockerfile dla build: build.dockerfile  

```FROM node:latest  
RUN git clone https://github.com/deltachat/deltachat-desktop.git  
WORKDIR /deltachat-desktop/  
RUN npm install  
RUN npm run build
```

Sprawdzenie działania:  
![](10.png)  
![](11.png)  

Utworzenie dockerfile dla test: test.dockerfile  

```FROM node-build:latest  
WORKDIR /deltachat-desktop/  
RUN npm run test  
```
Sprawdzenie działania  
![](12.png)  
![](13.png)  
