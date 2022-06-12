# Instalacja minikube  
już działą
![](<./Zrzut ekranu 2022-06-10 153250.png>)  
# Pierwsze uruchomienie i konfiguracaj
![](<./Zrzut ekranu 2022-06-10 153447.png>)  
Srprawdzamy dashbord - dziala
![](<./Zrzut ekranu 2022-06-10 153539.png>)  
# Uruchomienie wybraniego obrazu
Generaplnie na początku chciałem odpalić swójn projekt, ale jako że pakuje sie on do zipa a nie do obrazu to okazało się to zbyt pracochłonne, żeby przełożyć to na obraz i zrezygnowałem. Potem chciałem postawic jenkinsa na tym - nie dzialal, wrzucilem w Google i jak zobaczylem co sie tam dzieje to tez odpuscilem. Potem mysle sobie - comoze byc trudnego w posstawieniu mariadb? No i postawilem. I analogicznie jak z jenkinsem, nie dziala a w necie jakeis chore rozwiazania. Wiec wzialem apacha bo no tu to juz naprawde nie ma co nie dzialac i sie komplikowac nie 🦄
![](<./Zrzut ekranu 2022-06-11 115941.png>)  
![](<./Zrzut ekranu 2022-06-11 120008.png>)  
Jak serwer dziala to robimy jeszcze port forward na zewnatrz.  
Ogolnie to tu tez chcialem wystawic na :80 ale tam tez jakies jaja xD tu brak uprawnien jakies porty zabezpieczone, zadne roziwazanie z ne ta nie dziala bo to nie kubernetes tylko jakis minikube bez fdaktycznej konsoli tylko jakims spawnem czy tam cos nie wiem naprawde
![](<./Zrzut ekranu 2022-06-11 121718.png>)  
![](<./Zrzut ekranu 2022-06-11 121434.png>)  
![](<./Zrzut ekranu 2022-06-11 121442.png>)  
Zeby troche se ulatwic zycie instalujemy Kompose ktory przetlumaczy docker-compose na te smieszne deploymenty
![](<./Zrzut ekranu 2022-06-11 121939.png>)  
Gdzies mi wcielo skrina to zrobilem nowego, w kazdym razie splakal sie ze nie ma explic podanej wersji na gorze pliku wiec sobie wezmie najstarszego alpha sprzed 15 lat bo czemu nie :>) 
![](<./Zrzut ekranu 2022-06-11 131140.png>)  
![](<./Zrzut ekranu 2022-06-11 122020.png>)  
![](<./Zrzut ekranu 2022-06-11 122213.png>)  
Wygenerowany plik, stawianie timestampow dziala bardzo dobrze jakc cos
![](<./Zrzut ekranu 2022-06-11 122256.png>)  
Wystawiamy andrzejka i smiga 
![](<./<./Zrzut ekranu 2022-06-11 122440.png>)  
Zmieniamy sobie liczbe replik na wiecej, wystawiamy i jest sobie ich wiecej
![](<./Zrzut ekranu 2022-06-11 122601.png>)  
![](<./Zrzut ekranu 2022-06-11 122642.png>)  
Albo jeszcze wiecej
![](<./Zrzut ekranu 2022-06-11 122940.png>)  
![](<./Zrzut ekranu 2022-06-11 123042.png>)  
Albo nie 
![](<./Zrzut ekranu 2022-06-11 123125.png>)  
Robimy Dockerfile ktory sie sypnie
![](<./Zrzut ekranu 2022-06-11 123523.png>)  
Aha no tak przeciez jak jest w ~ to bedzie mi chcial calego home spakowac XDDD kocham konputery to jest to
A w ogole to sie nie spakuje przeciez bo jest blad a docker jest mondry
![](<./Zrzut ekranu 2022-06-11 124005.png>)  
ale nie az tak i mozna go oszukac exit 0 🐳
![](<./Zrzut ekranu 2022-06-11 124046.png>)  
Pakujemy go 
![](<./Zrzut ekranu 2022-06-11 124259.png>)  
Zmieniamy  obraz w konfie (pliku konfiguracyjnym>)
![](<./Zrzut ekranu 2022-06-11 124336.png>)  
no i nie dziala 😮
![](<./Zrzut ekranu 2022-06-11 124427.png>)
no to se cofamy
![](<./Zrzut ekranu 2022-06-11 124504.png>)
i zas dziala 😎😎
![](<./Zrzut ekranu 2022-06-11 124512.png>)
skrypcior na autoweryfikacje i cofanie chociaz no nie wiem ja bym sie bal dac takie cosik na produkcjei
![](<./Zrzut ekranu 2022-06-11 124727.png>)
jak chcemy uzyc sobie innej strategii to mamy rekreate albo rolling update albo canary, canary mi sie nie chcialo robic bo tam trzeba drugiego yamla pisac i go wystawiac ale ponizej przyklad tych dwoch pierwszych strategi  
![](<./Zrzut ekranu 2022-06-11 130106.png>)
![](<./Zrzut ekranu 2022-06-11 130417.png>)
![](<./Zrzut ekranu 2022-06-11 130309.png>)
![](<./Zrzut ekranu 2022-06-11 130430.png>)