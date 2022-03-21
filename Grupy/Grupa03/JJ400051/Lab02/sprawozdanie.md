0. sprawdzono aktualna konfiguracje laczenia (URL.png) i zmieniono ja na ssh (frot_URL_to_ssh.png). Zmieniono konfiguracje folderow i branchy na bardziej przejrzysta (dir_struct.png) wykonano push na stworzonym tagu (tags_pushed.png)

2. hook:

#!/bin/bash
if [[ $(cat $1) != JJ400051* ]]; then
    echo "niepoprawne"
    exit 1
fi
if ! grep -i "lab02" "$1" ; then
	echo "nieprawidlowe"
	exit 1
fi

1. Zmieniono tresc hooka i jego nazwe (hook_edit_and_rename.png) i przetestowano dzialanie (hook_testing.png)
3. W ustawieniach seci maszyny wirtualnej dla typu NAT, dodano opcję przekierowywania portów:
Protokół: TCP; IP hosta: 127.0.0.1; Port hosta 2222; IP gościa: 10.0.2.15; Port gościa: 22.
4. Zainstalowano OpenSSH (openssh_install.png), uruchomiono usluge poleceniem sudo service ssh start i sprawdzono status (active_Server.png). Polaczono sie z serwerem ssh przez Putty wpisujac dane z punktu 3. (ssh_login.png).
5. Zainstalowano dockera (docker_install.png). Uruchomiono poleceniem 'sudo systemctl start docker' i sprawdzono status (active_docker.png).
6. Pobrano obraz systemu linux, wykonano polecenie Hello world i sprawdzono zawartosc kontenera (docker_images.png). Sprawdzono zainstalowana wersje dockera (docker_version.png).
7. Zalozono konto na dockerhub (dockerhub.png)
8. Wszystkie screenshoty powstale na systemie Windows przeslano na maszyne wirtualna za pomoca programu Filezilla (filezilla.png).


