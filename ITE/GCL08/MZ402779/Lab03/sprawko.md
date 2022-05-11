# Michał Zając - sprawozdanie z DevOps z lab03

### Podjęte kroki podczas wykonywania zadania

1. Znalezienie repozytorium z kodem dysponującego otwartą licencją oraz narzędziami makefile, a także zawierające testy.

Link: https://github.com/restic/restic

2. Sklonowanie repozytorium
![Screen](./screeny/restic_clone.png)

3. Zbudowanie projektu za pomocą <code>make all</code>
![Screen](./screeny/restic_build.png)

> Aby projekt mógł zostać zbudowany należy zainstalować dodatkowo pakiet ***Go***. Instalujemy go za pomocą komendy <code>sudo apt install golang-go</code>

![Screen](./screeny/restic_install_go.png)

> Po zainstalowaniu Go ponawiamy <code>make build</code>

![Screen](./screeny/restic_working_build.png)

4. Uruchomienie testów jednostkowych za pomocą <code>make test</code>

![Screen](./screeny/restic_tests.png)

5. Uruchomienie kontenera z Node. **Jako, że obraz node'a pobrałem dwa tygodnie temu, nie będę go pullować ponownie**
![Screen](./screeny/docker_node_image.png)

> Jeśli nie posiadamy obrazu Node'a, należy co pullnąć za pomocą komendy <code>sudo docker pull node</code>

Uruchamiamy następnie kontener i w środku tworzymy nowy folder do którego będziemy klonować repo
![Screen](./screeny/run_node.png)

6. Zaopatrzenie kontenera w wymagania wstępne wiązało się z utworzeniem folderu, gdzie będzie klonowane repo, **a także doinstalowanie pakietu *Go*. Aby można było wszystko poprawnie uruchomić, należało także doinstalować <code>apt-get update</code> oraz <code>apt-get install sudo</code>**. 

> Tutaj apt-update
![Screen](./screeny/apt_update.png)

> Tutaj install sudo
![Screen](./screeny/install_sudo.png)

> Tutaj install *go*
![Screen](./screeny/install_go.png)

7. Po pobraniu wszystkich wymaganych paczek możemy za pomocą komendy <code>make all</code> zbudować projekt.
![Screen](./screeny/kontener_make.png)

8. Na sam koniec wykonujemy testy za pomocą <code>make test</code>. Pod spodem kilka zrzutów ekranu z testów.
![Screen](./screeny/kontener_test.png)
![Screen](./screeny/kontener_test2.png)
![Screen](./screeny/kontener_test3.png)

9. Tworzenie docker file'ów.
![Screen](./screeny/docker_files.png)

10. Treść dockerfile wykonującego wszystkie kroki aż do builda.
![Screen](./screeny/dockerfile_build.png)

11. Treść dockerfile bazującego na pierwszym i wykonującego testy.
![Screen](./screeny/dockerfile_test.png)

12. Potwierdzenie działania kontenera budującego:
![Screen](./screeny/build_working.png)

Oraz:
![Screen](./screeny/successful_build.png)

13. Potwierdzenie działania testów w kontenerze:
![Screen](./screeny/docker_test_build.png)
![Screen](./screeny/test_errors.png)

14. W stworzonym przez nas kontenerze pracuje nasz program. Poprzez uruchomienie go w kontenerze możemy go odizolować od systemu.
