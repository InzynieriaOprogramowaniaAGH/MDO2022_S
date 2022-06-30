# Metodyki DevOps lab01 - sprawozdanie
## 1. Utworzenie git hook'a
Do realizacji zadania wykorzystano git hook'a o nazwie
`prepare-commit-msg`. Jego zawartość przedstawia poniższy screen:

![hook](./ss/4_prepare-commit-msg_hook.png)

Poniższy zrzut ekranu prezentuje pomyślne wykonanie commit'a

![good_commit](./ss/2_allowed_commit_example.png)

W przypadku jeżeli commit nie spełnia określonych wytycznych wypisana
zostanie stosowana wiadomość, a operacja zostanie porzucona.

![bad_commit](./ss/3_prohibited_commit_example.png)

## 2. Umieszczenie pliku git hook'a w folderze ze sprawozdaniem

## 3. Przygotowanie środowiska Dockerowego
Środowisko pracy zapewnia łączność z maszyną wirtualna poprzez `ssh`
oraz `sftp`. Ponizszy zrzut ekranu przedstawia pomyślne połączenie się
z maszyną wirtualna poprzez `ssh` oraz `sftp`.

![ssh_connection](./ss/5_ssh_connection_from_w10.png)

![sftp_connection](./ss/6_sftp_connection_from_w10.png)

## 4. Działanie środowiska
Wykazanie ze Docker jest uruchomiony
![systemctl_docker](./ss/7_docker_status_checkout.png)

Pobranie oraz uruchomienie obrazu z Ubuntu
![running_ubuntu_image](./ss/8_running_docker_image.png)

## 5. Utworzenie konta na DockerHub
![docker_accout](./ss/9_docker_account.png)

