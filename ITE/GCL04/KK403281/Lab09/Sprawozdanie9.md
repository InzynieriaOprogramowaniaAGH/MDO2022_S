<h1>Sprawozdanie z Lab9</h1>

<h3> Konrad Krzempek</h3>
grupa lab 4

Wykonanie ćwiczenia:

<h3> Instalacja Fedory </h3>

    Przygotowanie maszyny wirtualnej:
![Image](screen1.png "ustawienia_instalacja")

Zainstalowana została Fedora 36 w wersji beta. Stworzono na niej konto roota i użytkownika (deployer). 

Wybrane ustawienia instalacji:
<ul>
<li>język angielski z polskim układem klawiatury </li>
<li>minimalna instalacja </li>
<li>30GB miejsca na dysku </li>
<li>manualne partycjonowanie </li>
</ul>
   
    Host name:
![Image](screen2.png "host_name")


    Po ukończeniu instalacji na maszynie znajduje sie plik anaconda-ks.cfg.
    Plik ten zawiera informacje dla instalatora umożliwiające szybkie odtworzenie instalacji bez konieczności ponownego wybierania opcji.
    Domyślnie znajdował się on na koncie root'a po czym został skopiowany na deployer'a.
![Image](screen3.png "fedora")

<h3> Instalacja drugiej Fedory z serwerem HTTP </h3>

    Utworzono drugą maszynę wirtualną w taki sam sposób jak wcześniej, po czym zainstalowano httpd.

    Aktualizacja listy pakietów:
![Image](screen4.png "aktualizacja")

    Instalacja httpd:
![Image](screen5.png "httpd_instalacja")

![Image](screen6.png "httpd-instalacja2")

    Uruchomienie httpd:
![Image](screen7.png "httpd-uruchomienie")

    Dodanie wyjątków do zapory:
![Image](screen8.png "httpd-zapora")

    Pierwsze połączenie się z serwerem:
![Image](screen9.png "polaczenie1")

    Połączenie po utworzeniu w folderze var/www/html folderu "test1" do którego skopiowano plik irssi.
![Image](screen10.png "polaczenie2")


    Instalacja wget na pierwszej maszynie wirtualnej:
![Image](screen11.png "wget")

    Pobranie irssi z serwera:
![Image](screen12.png "irssi_pobranie")

    Zmiana uprawnień do pliku irrsi tak aby można go było uruchomić:
![Image](screen13.png "zmiana_uprawnien")

    Uruchomienie irssi:
![Image](screen14.png "irssi_uruchomienie")

<h3>Przeprowadzenie instalacji nienadzorowanej </h3>

W celu przeprowadzenie instalacji nienadzorowanej konieczna będzie odpowiednia edycja pliku anaconda-ks.cfg i umieszczenie go na githubie.

    Przesłanie pliku anaconda-ks.cfg za pomocą FileZilli do katalogu roboczego.
![Image](screen15.png "anaconda_przeniesienie")

    Edycja pliku anaconda-ks.cfg:
![Image](screen16.png "anaconda_edycja")

Dokonane zmiany:
<ul>
<li>Zmieniono typ instalacji na tekstowy (linia 5) </li>
<li>Dodano informacje o repozytorium (linie 16-19)</li>
<li>Dodano zależności (linie 19-26</li>
<li>Pobieranie irssi (linie od 48) </li>
</ul>

    Plik ten został umieszczony na githubie w katalogu lab9.


    Utworzenie nowej maszyny wirtualnej:
![Image](screen17.png "fedora3")

    Uruchomienie instalacji nienadzorowanej:
![Image](screen18.png "fedora3_instalacja1")

![Image](screen19.png "fedora3_instalacja2")

![Image](screen20.png "fedora3_instalacja3")

![Image](screen21.png "fedora3_instalacja4")

![Image](screen22.png "fedora3_instalacja5")


    Uruchomienie irssi w celu sprawdzenia czy wszystko działa poprawnie:
![Image](screen23.png "fedora3_irssi")


