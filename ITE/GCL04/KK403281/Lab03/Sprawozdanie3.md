<h1>Sprawozdanie z Lab3</h1>

<h3> Konrad Krzempek</h3>
grupa lab 4

Wykonanie ćwiczenia:

Ćwiczenie wykonałem z wykorzystaniem repozytorium przedstawianego na zajęciach IRSSI, 
szukałem innych repozytoriów do wykonania tego ćwiczenia, 
ale niestety wszystkie, które znalazłem nie działały poprawnie.

    1. W utworzonym folderze Lab03 wywołałem komendę docker images

![Image](p-images.png "Docker_images")

    2. Wszedłem do kontenera po czym uruchomiłem apt-get update

![Image](run_i_update.png "run_ubuntu_i_update")

    3. Następnie wykonałem: git clone https://github.com/irssi/irssi.git
    
    4. Instalacja make automake wget i meson

![Image](instalacja_fragment.png "fragment_instalacji")

    5. Przykład uruchomienia meson setup build, po uruchomieniu widzę jakie pakiety potrzebuję doinstalować w celu poprawnego zbudowania programu

![Image](przyklad.png "przyklad")

    6. Udany build po doinstalowaniu wszystkich niezbędnych pakietów:

![Image](p-build.png "udany_build")

    7. Uruchomienie testów:

![Image](p_testy.png "testy")

    8. Tworzenie docker file automatycznie instalującego niezbędne pakiety, kolnującego repo i uruchamiającego builda:

![Image](Docker-BLDR.png "docker-BLDR")

    9. Utworzenie nowego obrazu:

![Image](build.png "build")
    
    10. Efekt działania:

![Image](succesful_build.png "build_sukces")

![Image](docker_images.png "images")

    11. Sprawdzenie poprawności działania z użyciem komendy ninja:

![Image](ninja.png "ninja")

    12. Działające IRSSI:

![Image](irssi.png "irssi")

    13. Tworzenie Docker file wykonującego testy:

![Image](docker-tescik.png "nano_docker_tescik")

    14. Uruchomienie:

![Image](testy_build.png "testy_build")

    15. Wynik działania testów:

![Image](tesciki.png "testy_po_buildzie")

    16. Wszystkie utworzone obrazy:

![Image](docker_images_koncowe.png "images_koncowe")
