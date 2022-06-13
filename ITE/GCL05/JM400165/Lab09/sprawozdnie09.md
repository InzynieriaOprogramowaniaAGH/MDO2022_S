# Przygotowanie wdrożeń nienadzorowanych dla platform z pełnym OS-Jakub Michalik - LAB09

## Wykonane zadania:

### Przygotowanie systemu do pracy:
1. Utworzono nową maszynę wirtualną, na której należało zainstalować system Fedora Server 36, podany
przez prowadzącego zajęcia.

![](./screeny/install1.PNG)

2. Zgodnie z wydanym poleceniem, wybrano minimalną instalację.

![](./screeny/install1_1.PNG)

3. Kolejnym krokiem było utworzenie konta dla root'a, z nieskomplikowanym hasłem.

![](./screeny/install2.PNG)

4. Na nazwę hosta nadano nazwę pokazaną na zajęciach.

![](./screeny/install5.PNG)

5. Podsumowanie instalacji wygląda jak poniżej.

![](./screeny/install3.PNG)

6. Proces instalacji:

![](./screeny/install4.PNG)

7. Po zainstalowaniu systemu należało przeprowadzić jego restart, oraz zalogować się wcześniej 
ustalonymi danymi.

![](./screeny/fedora1.PNG)

8. Kolejnym krokiem było stworzenie drugiej maszyny z systemem Fedora. Różnica polega na tym że należało
wybrać "Fedora Server Edition":

![](./screeny/install_v2_1.PNG)

oraz jako nazwę hosta ustalono "lab09.http.agh" :

![](./screeny/install_v2.PNG)

9. Następnie zainstalowano system i zalogowano się:

![](./screeny/fedora2.PNG)

10. Potem skonfigurowano serwer poleceniem "dnf group install "Web Server" :

![](./screeny/fedora_dnf.PNG)

11. Po teście połączenia i połączeniu z serwerem, wyświetliła się strona testowa:

![](./screeny/testpage.PNG)

12. Następnie utworzono katalog, w którym umieszczono archiwum reprezentujące artefakt z pipelina. W tym celu 
wykorzystano program FileZilla, który okazał się być bardzo pomocny.

![](./screeny/petclinic1.PNG)

![](./screeny/petclinic2.PNG)

### Instalacja nienadzorowana

13. Aby zainstalować system w sposób nienadzorowany niezbędne było zdobycie pliku konfiguracyjnego 
"anaconda-ks.cfg". W pliku tym dodano klazulę %post - %end, gdzie uzyto polecenie
"scp root@192.168.12.34:/var/www/html/petclinic/org.springframework.petclinic.repository.eclipselink-2.1.0.release.jar ./petclinic"

14. Utworzono nową maszynę, i po naciśnięciu klawisza TAB należało wpisać ścieżkę do repozytorium:

![](./screeny/nienad1.PNG)

15. Po wciśnięciu Enter, rozpoczął się proces instalacjii:

![](./screeny/nienad2.PNG)

![](./screeny/nienad3.PNG)

![](./screeny/last.PNG)




