<h1>Sprawozdanie z Lab12</h1>

<h3> Konrad Krzempek</h3>
grupa lab 4

Wykonanie ćwiczenia:


    Zmiana ilości podów na 4:
   
     W pliku z poprzednich zajęć zmieniona została liczba podów z 2 na 4
![Image](Screen1.png "")

![Image](Screen2.png "")

![Image](Screen3.png "")

    Sprawdzenie stanu "Kubectl rollout status" 

![Image](Screen4.png "")

    Stworzenie obrazu nginx, który ma zwracać błąd

![Image](Screen5.png "")

![Image](Screen6.png "")

    Ustawienie ilości replik na 9

![Image](Screen7.png "")

![Image](Screen8.png "")

    Ustawienie ilości replik na 1

![Image](Screen9.png "")

    Usunięcie wszystkich podów poprzez ustawienie ilości replik na 0

![Image](Screen10.png "")

    Zmiana wersji obrazu na nowszą:

![Image](Screen11.png "")

![Image](Screen12.png "")

    Zmiana wersji obrazu na nie działającą:

![Image](Screen13.png "")

![Image](Screen14.png "")

    Uzycie rollout history w celu pokazania histori zmian, a następnie wrócenie do działającej wersji z użyciem komendy rollout undo:

![Image](Screen15.png "")

![Image](Screen16.png "")

    Describe deployment:

![Image](Screen17.png "")


<h2>Różnice między Recreate, rolling update i canary deployment workload:</h2>

Recreate w odróżnieniu od pozostałych 2 strategii wdrożeń nie zapewnia ciągłości działania aplikacji, ponieważ zabija wszystkie pody przed powstaniem nowych. Canary Deployment workload pozwala na wdrażanie nowej wersji w taki sposób że działa ona równolegle ze starą wersją i stara wersja jest wygaszana dopiero w momencie gdy nowe wdrożenie będzie działać poprawnie.