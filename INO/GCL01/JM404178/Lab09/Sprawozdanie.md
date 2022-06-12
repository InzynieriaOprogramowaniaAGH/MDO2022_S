
# Sprawozdanie 9

## Przygotowanie wdrożeń nienadzorowanych dla platform z pełnym OS

* Przygotowanie systemu pod uruchomienie

Instaluje system Fedora w VirtualBoxie.

![VB Fedora](https://i.imgur.com/wp1ODKn.png)

Po podpieciu ISO uruchamiam maszyne oraz przechodze do ustawien instalacji.

![Editing installation](https://i.imgur.com/SCxVmdL.png)

W ustawieniach instalacji zmieniam jezyk i klawiature pod siebie, software selection zaznaczam na minimal install, nadaje haslo root'owi i tworze uzytkownika.

Nastepuje instalacja.

![Installation](https://i.imgur.com/iIX5dtN.png)

Instalacja ta konczy sie sukcesem.

![Install end](https://i.imgur.com/7VZ1jyR.png)

Na zainstalowanej fedorze mamy dostepny plik anadonda-ks.cfg, ktory umieszczam na repo.

![anaconda](https://i.imgur.com/Hv04FKt.png)

* Instalacja nienadzorowana

JAKO, ZE NIE MOGLEM POLACZYC SIE DO NASZEJ PIEKNEJ FEDORY POPRZEZ ROOTA, PONIEWAZ DOSTAWALEM ACCESS DENIED PRZY PRZEKAZYWANIU HASLA, SAM PLIK ANACONDA PRZEKOPIOWALEM NA HOME DO DEPLOYERA,
ZMIENILEM UPRAWNIENIA DO PLIKU ORAZ WTEDY PRZEKOPIOWALEM GO DO SIEBIE NA WINDOWSA za pomoca pscp.

![PSCP](https://i.imgur.com/1keS4xp.png)

![cp](https://i.imgur.com/L1jwML6.png)

Nastepnie wyciagnalem archiwum z jenkinsem i zupladowalem, aby moc je pozniej pobrac w pliku anaconda. Sam plik anaconda wrzucilem na sforkowane poprzednio repo z irssi.

Do anacondy dopisuje dependencje, sciagniecie i rozpakowanie archiwum z pipeline'a oraz inne rzeczy potrzebne do jej poprawnego dzialania.

Przez to, ze zapomnialem dodac wersjonowania w pipelinie SCM, to plik nazywa sie null.tgz.

![nulltgz](https://i.imgur.com/11N0JTG.png)

Link do pliku w repo nie nalezy do najkrotszych, dlatego tez przepisywaniego go conajmniej 2 razy (tak jak myslalem, plik anaconda nie wystartowal od razu po mysli) nie nalezy do najciekawszych czynnosci, wiec skorzystalem ze skroconego linku https://cutt.ly/rJrh261.

![install](https://i.imgur.com/NwNReIa.png)

Tworzymy nowa Fedorke, gdzie automatycznie zainstaluje nam sie to, co chcemy. Dodajemy tylko linka do anacondy, po kliknieciu przycisku `TAB` wpisujemy `inst.ks=https://cutt.ly/rJrh261`.

![FedoraAuto](https://i.imgur.com/uUJsEKd.png)

Po drodze wyskoczyl mi blad, ktory oznacza zbyt malo miejsca przydzielonego do maszyny- wiec trzeba przydzielic wiecej.

![NotEnoughSpace](https://i.imgur.com/f1JxFKc.png)

Po zainstalowaniu, aby sprawdzic czy dziala wszystko tak, jak bylo zamierzone- wpisujemy komende `irssi`. Wynik:

![irssi](https://i.imgur.com/I50NHW6.png)





