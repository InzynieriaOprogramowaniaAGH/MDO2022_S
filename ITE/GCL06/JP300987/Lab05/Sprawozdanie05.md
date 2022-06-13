**SPRAWOZDANIE PIPELINE:**

**CEL:**

Utworzenie pipeline''u w Jenkinsie, który zautomatyzuje czynności wykonane na poprzednich laboratoriach.
##
**WYKONANIE ĆWICZENIA:**

Zmieniłem repozytorium, którego używałem w poprzednich ćwiczeniach: https://github.com/deltachat/deltachat-desktop, ponieważ występował błąd npm, próby aktualizacji nie przyniosły skutku. Użyte repozytorium: https://github.com/DiscordSRV/DiscordSRV.

Zgodnie z poprzednią instrukcją należy uruchomić Jenkinsa'a skonfigurowanego na poprzednich zajęciach. Najpierw należy uruchomić DIND:

![1](https://user-images.githubusercontent.com/92218468/169685677-7348fb5b-a338-4f64-85e9-b3bbcee13f61.JPG)

Następnie Jenkins:

![2](https://user-images.githubusercontent.com/92218468/169685686-59e00798-ff54-4fb1-9ed5-38d0177e080c.JPG)

Uruchomione kontenery:

![3](https://user-images.githubusercontent.com/92218468/169685690-a76f39d0-71a9-479b-8d37-3c44d798a287.JPG)

Po zalogowaniu należy utworzyć Pipeline'a, następnie wybrać Nowy Projekt:

![4](https://user-images.githubusercontent.com/92218468/169685694-0a714343-f95b-401f-956f-50673747e256.JPG)

Dalej podać nazwę projektu oraz wybrać Pipeline:
![5](https://user-images.githubusercontent.com/92218468/169685701-1f15382c-bfe6-4346-98f4-44006f35e0ea.JPG)

Następnie przejść do zakładki Pipeline i dla pola Definition wybrać Pipeline script from SCM, dla SCM Git, w polu Repository URL wkleić ścieżkę do repozytorium przedmiotu, w polu Credentials należy dodać własne konto github'owe wraz z danymi, w polu Branch Specifier należy wybrać własną gałąź, następnie w Script path wpisuje się ścieżkę do katalogu w którym jest Jenkinsfile:
![6](https://user-images.githubusercontent.com/92218468/169685707-b81664e1-11a3-459d-bda0-18e7aef0dc37.JPG)
![7](https://user-images.githubusercontent.com/92218468/169685710-bca94f7e-4331-4768-824b-1fa4a6cebb3d.JPG)

W celu umożliwienia dostępu do artefaktów osobom niezalogowanym należy odpowiednio zmienić ustawienia:
![8](https://user-images.githubusercontent.com/92218468/169685717-35a2e527-2a33-4082-a44b-000c8a745f83.JPG)
##
**Parametry pipeline'u:**

Pipeline został sparametryzowany dwiema zmiennymi. Najpierw należało określić wersję, czyli dopisek który zostanie przyłączony do wygenerowanego artefaktu, następnie zmienną PROMOTE, która określa czy Publish się odbędzie:
![9](https://user-images.githubusercontent.com/92218468/169685727-4c88eaef-c383-4635-b986-ab070acaf388.JPG)

**Etap Clone:**

W tym kroku zostaje przygotowany obszar do późniejszego działania. Oprócz pozbycia się niepotrzebnych kontenerów następuje uruchomienie dockerfile'a, który ma za zadanie zbudować odpowiedni obraz kontenera. Potem obraz zostaje uruchomiony wraz z dołączeniem odpowiedniego woluminu wejściowego. Kontener zostaje uruchomiony wraz z odpowiednim wolumenem wejściowym oraz wyjściowym. Następnie zostaje wywołane budowanie projektu oraz skopiowanie uzyskanych danych z wolumenu wejściowego na wyjściowy.  

**Jenkinsfile:**

![10](https://user-images.githubusercontent.com/92218468/169685730-733c847b-6c88-41b4-96f9-869adfed6b21.JPG)

**Dockerfile:**

![11](https://user-images.githubusercontent.com/92218468/169685735-9c7eb1e5-3160-4fcd-b04c-24318bdde635.JPG)
##
**Etap Build:**

Celem tego etapu jest zbudowanie projektu, który został sklonowany w poprzednim kroku. Obraz został zbudowany na podstawie dockerfile'a. Sklonowane repozytorium zostało stworzone z użyciem Maven'a z tego powodu kontener będzie korzystał z obrazu Maven'a. 

**Jenkinsfile:**

![12](https://user-images.githubusercontent.com/92218468/169685738-b9165eef-6560-4507-8c7c-df4e7f7246e2.JPG)

**Dockerfile:**

![13](https://user-images.githubusercontent.com/92218468/169685748-7c81fd93-6dfe-4ee6-9eb5-090fbd0ff965.JPG)
##
**Etap Test:**

W tym etapie zostają wykonane testy jednostkowe, poprwne ich wykonanie skutkuje wykonywaniem dalszych instrukcji. Kontener został zbudowany zgodnie z dockerfile'm, wykorzystany został obraz z poprzedniego etapu. Testy zostają uruchomione wraz z kontenerem, który ma podpięty wolumin wejściowy.

**Jenkinsfile:**

![14](https://user-images.githubusercontent.com/92218468/169685760-459da2a4-5b00-4b73-ab91-157e2113b9d4.JPG)

**Dockerfile:**

![15](https://user-images.githubusercontent.com/92218468/169685763-e6dae32b-6c45-46f0-958b-e6615d224b75.JPG)
##
**Etap Deploy:**

W tym etapie nastąpiło sprawdzenie czy artefakt zawieta plik plugin.yml. Plik ten jest potrzebny do bezproblemowego działania pluginu na serwerze. Wyniki zbudowanego projektu zostają sprawdzone czy plik .jar został utworzony, następnie tylko on jest zostawiany. Następuje sprawdzenie czy ten plik zawiera plugin.yml, jeśli tak to deploy został przeprowadzony prawidłowo.

**Jenkinsfile:**

![16](https://user-images.githubusercontent.com/92218468/169685775-c02b1b40-b89f-4436-b15d-33eb934b60ce.JPG)
##
**Etap Publish:**

W tym etapie następuje publikacja zbudowanego artefaktu. Jeśli zmienna PROMOTE przyjmuje wartość "true" plik zostanie wygenerowany.

**Jenkinsfile:**

![17](https://user-images.githubusercontent.com/92218468/169685782-71105ef3-ef42-4897-b161-f9f9db9f97e1.JPG)
##
**KOŃCOWY EFEKT:**

**PARAMETRY:**
![19](https://user-images.githubusercontent.com/92218468/169685791-17cfd3cd-4468-4ab2-a99c-eb860348edb2.JPG)

**PROMOTE false:**
![18](https://user-images.githubusercontent.com/92218468/169685795-213ca468-ee85-4bb8-a0ce-5fcc27b6bcaf.JPG)

**PROMOTE true:**
![21](https://user-images.githubusercontent.com/92218468/169685797-242a2377-b6dc-430c-9ae7-f42253efcdf3.JPG)

**CREDENTIALS:**

![20](https://user-images.githubusercontent.com/92218468/169685805-97f8273b-a5e8-442a-9ef7-51047ce333af.JPG)

