# Michał Zając - sprawozdanie DevOps z lab_02

Przygotowałem git hooka, który sprawdzał czy tytuł commita odpowiada mojemu indeksowi, a treść commita odpowiada numerowi zadania.

[!plot](./screeny/folder_z_hookami.png)

W tym celu korzystając z polecenia touch, w folderze z hookami utworzyłem plik commit-msg.

> Pod spodem kod utworzonego hooka
```
#!/bin/bash

commit_title=`head -n1 $1`

commit_message=`tail -n1 $1`


if ! [[ "$commit_title" = 'MZ402779' ]]; then
    echo "Błędna nazwa commita"
    exit 1
fi

echo $commit_message | grep -q 'Lab0[0-9]' || 
{
    echo "Brak numeru laboratorium"
    exit 1
}
```

Po utworzeniu hooka wylistuję jeszcze raz folder z hookami aby upewnić się, że plik znajduje się na swoim miejscu.

[!plot](./screeny/po_utworzeniu_hooka.png)

> Możemy zauważyć, że plik nie ma uprawnień do wykonania. Gdybyśmy chcieli w tym momencie commitnąć zmiany, dostalibyśmy powiadomienie, że plik musi posiadać uprawnienia do wykonania.

[!plot](./screeny/permission_denied.png)

> Za pomocą polecenia chmod +x commit-msg w folderze z hookami dodajemy uprawnienia do wykonania dla naszego pliku. Pod spodem udokumentowanie zmian

[!plot](./screeny/changing_permissions.png)

Następnie przetestowałem działanie hooka.

[!plot](./screeny/hook_test.png)


Przygotowałem nastepnie środowisko dockerowe. Jako, iż w poprzednim sprawozdaniu wykazałem, że korzystam z maszyny wirtualnej poprzez połączenie się z nią poprzez ssh, a nie okienko, udokumentuję połączenie jeszcze raz.

> Tutaj wykazanie, że usługa ssh na wirtualce działa poprzez komendę systemctl status ssh.
[!plot](./screeny/ssh_status.png)

> Jako, że od poprzednich zajeć zmieniałem sieć, korzystałem z komendy ifconfig aby pobrać jeszcze raz adres ip.
[!plot](./screeny/ifconfig.png)

> Tutaj połączenie się wirtualką poprzez putty:
[!plot](./screeny/login_via_putty.png)

Następnie po zainstalowaniu dockera potrzebowałem wykazać, że jest on zainstalowany na mojej maszynie wirtualnej. 
> Tutaj poprzez wyświetlenie wersji istniejącego dockera:
[!plot](./screeny/docker_version.png)
> A tutaj poprzez sprawdzenie statusu usługi docker:
[!plot](./screeny/docker_service.png)

Za pomocą docker pull pobrałem obraz na maszynę wirtualną po czym wyświetliłem istniejące obrazy:
[!plot](./screeny/pull_fedora.png)

Następnie uruchomiłem za pomocą docker run istniejący kontener na podstawie obrazu, po czym z tego kontenera uruchomiłem polecenie wypisujące że działa:
[!plot](./screeny/fedora_dziala.png)

Po zakończeniu pracy przez utworzony kontener, ponownie za pomocą docker run uruchomiłem istniejący kontener, jednak pod inną nazwą. Dodatkowo w kontenerze użyłem polecenia uname -a wypisującego na ekran wersję aktualnego systemu, po czym za pomocą exit opuściłem kontener.

[!plot](./screeny/konterer_inna_nazwa.png)

Na sam koniec za pomocą polecenia docker start uruchomiłem kontener. Różnica między tym kontenerem a poprzednimi była taka, że ten kontener nie zakończył działania po wykonaniu wszystkich poleceń jakie miał zadeklarowane.
[!plot](./screeny/kontener_start.png)


Jeszcze potwierdzenie, iż założyłem konto na dockerhubie.
[!plot](./screeny/docker_hub.png)