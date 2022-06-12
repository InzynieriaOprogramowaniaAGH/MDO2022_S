# Sprawozdanie z przedmiotu Metody DevOps Jan Święs

# Etap 1 - Przygotowanie systemów (klienta i serwera)
W tym etapie pobrano obrazy systemu Fedora (wersja 36 netinstall), skonfigurowano oraz jej zainstalowano z widocznymi poniżej ustawieniami:

- Uruchomienie instalatora

![first_screen](pierwszy_ekran.png)

- Wybranie języka instalacji

![language](jezyk.png)

- Włączenie konta root'a. Należy tutaj pamiętać o zaznaczeniu checbox'a **zezwolenie na logowanie jako root przez SSH za pomocą hasła**, ponieważ jest to wymagane w celu przesłania artefaktów naszego programu na serwer.

![root](haslo_roota.png)

- Utworzenie partycji. Po dwukrotnym kliknięciu dysku, który nas interesuje należy zaznaczyć opcję **niestandardowa**.

![partition](miejsce_instalacji.png)

- Po klikcnięciu przycisku *gotowe* ukazuje się poniższy ekran. Należy wybrać opcję **Kliknąć tutaj, aby utworzyć je automatycznie**, zatwierdzić podsumowanie zmian oraz wrócić do głównego ekranu.

![partition](miejsce_instalacji_2.png)

![partition](miejsce_instalacji_3.png)

![partition](miejsce_instalacji_4.png)

- Po wykonaniu powyższych kroków ukazuje się ekran **Wybór oprogramowania**. Należy tutaj zaznaczyć **minimalna instalacja**.

![minimal_isntallation](minimalna_isntalacja.png)

- Sprawdzenie adresu IP maszyny, w celu pobrania pliku anaconda-ks.cfg przez SSH.

![ip_check](8.png)

- Pobranie pliku przy pomocy WinSCP

![anaconda_download](9.png)


# Etap 2 - konfiguracja serwera

- Instalacja httpd

![httpd](3.png)

- Dodanie wyjątków w zaporze sieciowej i jej przeładowanie

![firewall](4.png)

- Włączneie usługi httpd i sprawdzenie jej działania

![httpd_enable](5.png)

- Pobranie artefaktu z Jenkins's

![IP_serwer](1.png)

- Sprawdzenie adresu IP maszyny i przesłanie artefaktu za pomocą scp na serwer.

![IP_serwer](2.png)

- Utworzenie katalogu **/var/www/html/nexe** skopiowanie do niego artefaktu.

![copy_nexe](10.png)

# Etap 3 - pobranie artefaktu z serwera

- Instalacja pakietu wget.

![wget_install](6.png)

- Pobranie artefaktu

![wget](11.png)

Na tym etapie pracy napotkałem problem, którego nie udało mi się naprawić. Mianowicie maszyna nie była w stanie nawiązać połączenia z serwerem przy pomocy narzędzia wget. Występował tutaj błąd `nieudane: Brak trasy do hosta`. Wcześniej wykonane kroki sprawdzałem kilkukrotnie, dokonałem reinstalacji obu maszyn (klienckiej oraz serwera) z upewnieniem się, że dostęp przez SSH jest dozwolony oraz, że konfiguracja obu maszyn jest przeprowadzona poprawnie. Karty sieciowe obu maszyn zostały ustawione na mostkowane. Dodatkowo sprawdzałem, czy maszyny pingują się (robiły to obustronnie). Inne narzędzia, takie jak WinSCP nawiązywały z maszynami połączenie bez problemu i miały dostęp do ich plików. Problemu nie udało mi się rozwiązać, w związku z czym poniżej napiszę, jakie kroki następnie nalezało wykonać, aby zakończyć zadanie.

- Instalacja pakietu npm
- Instalacja mojego programu (nexe)

**Instalacja nienadzorowana:**

- Modyfikacja pobranego wczesniej pliku (dodanie instalacji pakietów wget i npm, sekcja post, polegająca na pobraniu artefaktu z serwera, tryb instalacji z graficznej na tekstową) anaconda-ks.cfg i wysłanie go na repo na githubie.
- Instalacja fedory, przy pomocy w.w. pliku.
- Zamontowanie w napędzie optycznym obrazu Fedory.
- Utworzenie katalogu /media/iso i zamontowanie w nim obrazu z napędu.
- Skopiowanie pliku anaconda-ks.cfg do obrazu i zmiana jego nazwy na ks.cfg
- Modyfikacja pliku isolinux.cfg
- Zainstalowanie pakietu genisoimage
- Utworzenie nowego obrazu ISO
- Pobranie przy pomocy WinScp wygenerowanego obrazu ISO
- Utworzenie nowej maszynę wirtualnej
- Uruchomienie instalacji z obrazu