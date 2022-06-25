<h1>Sprawozdanie z Lab4</h1>

<h3> Konrad Krzempek</h3>
grupa lab 4

Wykonanie ćwiczenia:

<h3> Zachowanie stanu </h3>

    Przygotowanie woluminu wejsciowego i wyjsciowego:
![Image](in_out.png "voluminywejscie_wyjscie")

    Uruchomienie kontenera (kontener będzie służył tylko do budowania więc nie będzie na nim nigdy zainstalowany git):
![Image](brak_gita.png "Brakgita")

    Sprawdzenie poprawności utworzonych woluminów:
![Image](voluminy_powstaly.png "sprawdzenie")

    Wykonanie inspecta w celu wyświetlenia szczegółowych informacji o woluminach:
![Image](inspect.png "Inspect")

    Próba sklonowania z poziomu hosta na wolumin wejściowy repozytorium (odmowa dostępu)
![Image](permision_denied.png "odmowa_dostepu")

    Udane sklonowanie z poziomu hosta po przejściu na roota:
![Image](git_clone.png "_git_clone")

    Sprawdzenie czy sklonowane repo pojawiło się na kontenerze w woluminie wejscie:
![Image](wejscie_irssi.png "")

    Udany meson build, po zainstalowaniu wszystkich niezbędnych wymagań (tak jak w poprzednim ćwiczeniu ale bez gita)
![Image](mesonBuild.png "")

    Zapisanie powstałego builda na woluminie wyjscie:
![Image](build_wyjscie.png "")

<h3> Eksportowanie portu </h3>
    
    Zainstalowałem iperf3 na 2 kontenerach, hoscie i poza hostem.
    Instalowanie apt install iperf3:
![Image](install_iperf3.png "instalacja_iperf3")

    Serwer uruchomiony wewnątrz kontenera:
![Image](dockerrun.png "dockerrun")

![Image](iperf3_listening.png "listening")

    Sprawdzenie adresu IP
![Image](ip_check.png "sprawdzenie_IP")

    Połączenie się z serwerem z drugiego kontenera:
![Image](zkontenera.png "polaczenie_z_kontenera")

    Połączenie się z serwerem z poziomu hosta:
![Image](zhosta.png "polaczenie_z_hosta")

    Połączenie się z serwerem spoza hosta:
![Image](spozahosta.png "polaczenie_spoza_hosta")

    Wyniki kolejnych połączeń na serwerze. Jakw widać najlepsze wyniki zostały uzyskane przy łączeniu się z serwerem z poziomu hosta, odrobinę gorsze przy łączeniu z drugiego kontenera,
    natomiast podczas łączenia spoza hosta uzyskane wyniki były bardzo niskie.
![Image](wyniki.png "wyniki")

<h3> Instancja Jenkins </h3>

    Instalancja skonteryzowanej instancji Jenkinsa z pomockikiem DIND:
    docker run:
![Image](jenkins.png "jenkins")

    Utworzenie dockerfile:
![Image](dockerfile.png "dockerfile")

    Uruchomienie builda:
![Image](dockerBuild.png "build")

    Udany build:
![Image](sukces.png "sukces")

    Uruchomienie powstałego obrazu i udostępnienie go na portach 8080 i 50000:
![Image](dockerrun2.png "uruchomienie")

    Wejscie na adres localhost:8080:
![Image](unlockjenkins.png "unlockjenkins")

    Znalezienie hasla za pomocą docker exec:
![Image](exec.png "haslo")

    Pobranie wtyczek (sugestowanych):
![Image](gettingstarted.png "wtyczki")

    Strona Logowania:
![Image](stronaLogowania.png "strona_logowania")


    Udane logowanie:
![Image](zalogowanie.png "zalogowanie")

    Działanie kontenerów:
![Image](kontenery.png "kontenery")



