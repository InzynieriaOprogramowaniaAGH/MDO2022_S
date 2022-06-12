# Lab 10
#### Witam was ja jestem Daniel Bobula a to kolejny odcinek z naszej serii Metodyki Devops. W dzisiejszym odcinku ustawiamy orchestrator w formie ansible.

- Zaczynam od stworzenia dwóch fedor

![fota](1.png)

- Ustawilem karty sieciowe obu maszyn na bridged w VirtualBoxie a nastepnie przeprowadziłem test pingowania

![fota](2.png)

- Zainstalowałem na hoscie ansible komendą `dnf --assumeyes install ansible`

![fota](3.png)

- Plik `/etc/ansible/ansible.cfg`

![fota](4.png)

-Nastepnie edytowałem plik `/etc/ansible/hosts`

![fota](5.png)

- Pierwsza próba odpalenia ansible w celach pingu zakończona niepowodzeniem, należało doinstalowac sshpass

![fota](6.png)

- Kolejna próba tym razem pokazuje nam sie cudowny zielony tekst

![fota](7.png)

- Na komputer hosta zassałem wgetem plik first_playbook.yml ze ścieżki `https://docs.ansible.com/ansible/latest/_downloads/588d4b6e9316c8eb903fbe2485b14d64/first_playbook.yml`

![fota](8.png)

- Do ww pliku wprowadziłem zmiany aby zainstalowac package rpmfusion

![fota](9.png)

- Niestety instalacja na klientach nie powiodła się

![fota](10.png)

- Poprawiona wersja pliku:

![fota](11.png)

- Niestety napotkałem kolejny problem:

![fota](12.png)

- Rozwiązaniem było dodanie klucza `disable_gpg_check=true` oraz wyżej zmiana `gather_facts` na `true`

![fota](13.png)

- Odpalenie playbooka powiodło się, na kliencie posiadamy najnowszy wget oraz rpm

![fota](14.png)

![fota](15.png)

![fota](16.png)
