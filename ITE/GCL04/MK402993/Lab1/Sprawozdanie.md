# Sprawozdanie DevOps lab1
## Michał Krzemień
### Informatyka Techniczna 
#### Grupa laboratoryjna 4.

W celu wykonania zadania skorzystano z maszyny wirtualnej z systemem Ubuntu 20.04.4 live server z wcześniej zainstalowanym serwerem ssh. 

![serverSSH](images/serverSSH.png)
![ssh_connection](images/ssh_server_connection.png)

1. Połączono się z serwerem ssh z maszyny hosta poprzez wykorzystanie narzędzia ssh z poziomu terminala Windows PowerShell. Połączenie zostało zrealizowane poprzez forward portu 22 z maszyny gościa.

![port_forward](images/port_forward.png)

2. Podjęto próbę instalacji obsługi gita na serwerze ssh, poprzez wykorzystanie polecenia: `sudo apt install git` . Instalacja nie została wykonana z powodu istniejącej na serwsze aktualnej wersji obsługi git.

![git](images/git_instalacja.png)

3. Do specjalnie przygotowanego folderu sklonowano repozytorium po HTTPS przy użyciu polecenia: `git clone link-do-repozytorium`.

![https_clone](images/https_clone.png)

4. Utworzono dwa klucze ssh przy pomocy polecenia `ssh-keygen` z wykorzystaniem ecdsa oraz ed25519. W trakcie tworzenia obu kluczy dodano hasło.

![ed25519](images/ed25519.png)
![ecdsa](images/ecdsa.png)
![ssh_keys](images/ssh_keys.png)

5. Utworzone klucze dodano do konta na githubie przy wykorzystaniu opcji githuba dostępnych z poziomu przeglądarki.

![git_keys](images/git_ssh_keys.png)

6. Sklonowano repozytorium przy użyciu połączenia po ssh wykorzystując polecenie `git clone`

![ssh_clone](images/ssh_clone.png)

7. Przełączono się na gałąź grupy ITE-GCL04 przechodząc poprzez gałąź main wykorzystując polecenie `git checkout`

![branch_jumping](images/branch_jumping.png)

8. Przy użyciu polecenia `git checkout -b` utworzono brancha MK402993 i przeniesiono się na niego.

![create_branch](images/create_branch.png)

9. Na nowo utworzonej gałęzi przeniesiono się do folderu grupy w którym utworzono katalog o nazwie MK402993.

![dir_create](images/dir_create.png)

10. Częściową wersję sprawozdania przesłano na serwer ssh przy pomocy oprogramowania FileZilla. 

11. Wprowadzone zmiany na gałęzi dodano poleceniem `git add .`, a następnie utworzono commita przy pomocy komendy `git commit -m`. Zmiany zostały wysłane do zdalnego źródła poleceniem `git push --set-upstream`.

![first_push](images/first_push.png)

12. Wykonano próbę połączenia utworzonej gałęzi MK402993 z gałęzią grupową. Na poziomie lokalnym próba zakończyła się powodzeniem, ale przy próbie wysłania zmian do źródła próba została odrzucona ze względu na to, że gałąź grupowa jest gałęzią chronioną.

![git_merge_failed](images/git_merge_failed.png)

13. Zaktualizowano sprawozdanie, przesłano je do repozytorium i wystawiono pull request'a.