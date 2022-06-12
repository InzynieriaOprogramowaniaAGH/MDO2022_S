## Sprawozdanie Lab09
##### Autor: Dawid Gabryś

1. Na początku przygotowałem maszynę wirtualną w ```VirtualBox```. Ustalono następujące parametry:

Nadałem nazwę oraz typ i wersję systemu:

![sc1](Screenshot_1.png)

Ilość pamięci RAM:

![sc2](Screenshot_2.png)

Utworzyłem wirtualny dysk twardy:

![sc3](Screenshot_3.png)

Wybrałem typ pliku z wirtualnym dyskiem na ```VHD```:

![sc4](Screenshot_4.png)

Oraz ustawiłem dynamicznie przydzielany plik twardego dysku. Następnie wybrałem lokalizację pliku dysku twardego oraz jego rozmiar na 16 GB:

![sc5](Screenshot_5.png)

Podłączyłem obraz systemu Fedora:

![sc7](Screenshot_7.png)

I uruchomiłem maszynę wirtualną. Po wybraniu opcji ```Install Fedora 36``` nastąpił etap konfiguracji i instalacji.

![sc10](Screenshot_10.png)

Ustawiłem język angielski i polską klawiaturę oraz przeszedłem do ustawień partycji:

![sc11](Screenshot_11.png)

![sc12](Screenshot_12.png)

![sc13](Screenshot_13.png)

![sc14](Screenshot_14.png)

Utworzyłem konto dla roota:

![sc15](Screenshot_15.png)

I użytkownika:

![sc16](Screenshot_16.png)

Wybrałem podstawowy zbiór oprogramowania:

![sc17](Screenshot_17.png)

Skonfigurowałem sieć:

![sc18](Screenshot_18.png)

I uruchomiłem instalację. Uzyskany rezultat po instalacji:

![sc19](Screenshot_19.png)

2. Zlokalizowałem i wypisałem plik odpowiedzi:

![sc23](Screenshot_23.png)

Zmodyfikowałem plik odpowiedzi dodając do niego:

- repozytoria:

![sc33](Screenshot_33.png)

- sekcję ```%post```:

![sc34](Screenshot_34.png)

Plik ```anaconda.ks``` przesłałem na GitHub.

3. Przeprowadziłem drugą instalację systemu Fedora z użyciem pliku odpowiedzi.

Przy uruchamianiu pierwszy raz VM kliknąłem przycisk ```TAB``` i wpisałem:

inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/DG306441/INO/GCL01/DG306441/Lab09/anaconda.ks

![sc20](Screenshot_20.png)

Po wciśnięciu przycisku ```ENTER``` uruchomiłem proces instalacji Fedory:

![sc22](Screenshot_22.png)

4. Na koniec połączyłem plik odpowiedzi z ISO. W tym celu wykonano poniższe kroki:

![sc25](Screenshot_25.png)

![sc26](Screenshot_26.png)

![sc27](Screenshot_27.png)

![sc28](Screenshot_28.png)

Dodałem ```ks=anaconda.ks``` na koniec linii w pliku ```isolinux.cfg```:

![sc29](Screenshot_29.png)

Oraz utworzyłem nowy obraz ISO:

![sc30](Screenshot_30.png)

![sc31](Screenshot_31.png)

![sc32](Screenshot_32.png)
