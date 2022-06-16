# Sprawozdanie - Lab 13



### VPS

Jenkins jest zainstalowany na VPS dlatego należało podpiąć serwer pod domenę. 

Do tego celu skorzystałem z CloudFlare:

<img src="0.png"  
alt="img1">

Należało również zainstalować i skonfigurować nginx:

<img src="01.png"  
alt="img1">

### Jenkins

Należało dodać URL repozytorium kodu oraz określić branch
<img src="1.png"  
alt="img1">


<img src="2.png"  
alt="img1">

Konfigurując budowanie Jenkinsa należało określić jak się powinien zachować, oraz gdzie powinien zostać przesłany obraz dockerowy. Do tego celu kopiowany jest utworzony jar.

<img src="3.png"  
alt="img1">


<img src="4.png"  
alt="img1">

Jak widać wszystko poprawnie jest przesyłane na dockerhub
<img src="5.png"  
alt="img1">