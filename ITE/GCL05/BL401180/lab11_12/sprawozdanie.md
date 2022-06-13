# Sprawozdanie lab 11-12 
## Bartosz Lidwin

### Lab 11

 Pobrałem minikuba zgodnie z instrukcją na stronie  
 ![Image](./scr/PNG1.png)
 ![Image](./scr/PNG2.png)
 
 W tes sam sposób postąpiłem z instalacją kubectl 
 
  ![Image](./scr/PNG3.png)

 Uruchomienie Kubernetesa i potwierdzenie jego działania po przez dockera i widać działający kontener minikuba o zablokowanej dla niego nazwie
 
  ![Image](./scr/PNG4.png)
  
 Ilość zasobów potrzebnych do uruchomienia jest dość duża. Często tworząc maszyny wirtualne potrzeba dużo mniej a co dopiero zwykłe obrazy dockerowe czy obraz jenkinsa który jest mniejszy 0,5GB, lecz jest to dużo bardziej rozbudowane narzędzie.
 
  ![Image](./scr/PNG5.png)
  
 Uruchomiłem Daskboard
 
  ![Image](./scr/PNG6.png)
  
 Jako, że mój krok deploy miał udostępniać deploy do chmury chyba nie muszę go modyfikować, lecz jako że nie wypuszczał on portu itp musiałem wykonać plan optimum i wybrać inną aplikację 
 
 ``` https://github.com/BartoszLidw/BoilAPI ```
 
 Uruchomienie aplikacji z udostępnionego przeze mnie obrazu i przetestowanie czy udostępniony port działa 
 
 ![Image](./scr/PNG7.png)
 ![Image](./scr/PNG8.png)
 
 Uruchomienie kontenera na stosie k8s i następnie wyeksponowanie portu żeby dotrzeć do chcianej dla nas zależności 
 
```
 minikube kubectl run -- boil --image=wiecznyprzegryw/boil:latest --port=8081 --labels app=boil
 kubectl port-forward boil 8082:8081

```
 ![Image](./scr/PNG9.png) 
 ![Image](./scr/PNG10.png) 
 ![Image](./scr/PNG11.png)
 
 
na powyszym screnie widać że port został użyty co potwierdza wyesponowanie i działanie wdrożenia

Teraz zostało stworzenie repliki na podstawie której będa tworzone podsy po przez zastosowanie apply na plik

![Image](./scr/PNG12.png) 
![Image](./scr/PNG13.png) 
![Image](./scr/PNG14.png)

wszystko wyszło tak jak było trzeba

### Cześć 2


Przerobienie yaml, żeby tworzył większą liczbę podów. Jako że 3 pody już istnaiły wdrożenie zostało skonfigurowane a nie stworzone i następnie został zbadany stan rollout

![Image](./scr/PNG15.png)


Stworzono dodatkowe wersje obrazu do testowania yamla

![Image](./scr/PNG16.png)

Testowanie różnych wariantów:
1 pod:

![Image](./scr/PNG17.png)
0 pod:

![Image](./scr/PNG18.png)
zastosowanie wersji 2.0:

![Image](./scr/PNG19.png)

zastosowanie wersji z errorem:


![Image](./scr/PNG20.png)
![Image](./scr/PNG21.png)

cofniecięcie zmian:

![Image](./scr/PNG22.png)


Skrytp sprawdzajacy czy się wdrożyło:
```
#!/bin/bash

appname=$1
kubectl wait --for=condition=Ready --timeout=60s deployments/boil
```

![Image](./scr/PNG23.png)

Dla wersji z errorem po 60s wyrzuca błąd:

![Image](./scr/PNG24.png)

Sposoby wdrożeń 

Recreate:

![Image](./scr/PNG25.png)

Rolling Update:

![Image](./scr/PNG26.png)

Przy recreate jak sama nazwa wskazuje zabija się wszystkie pody, żeby nateepnie je reaktywować gdzie w porównaniu z Rolling update są one podmieniane ze starych na nowe 




















 













 
 
 
 
 
 
 
	
	
	
	
	
	
	
	
	
	
	