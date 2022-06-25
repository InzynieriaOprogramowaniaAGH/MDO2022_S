### Daniel Kabat
### Inzynieria Obliczeniowa
### INO GCL-01

# Projekt Zaliczeniowy 1

(Wszelkie czynności są wykonywane na wirtualnej maszynie Oracle VM VirtualBox na której zostało zainstalowane najnowsze Ubuntu 22)

W ramach przeprowadzenia zadań zawartych w treści wymagań do projektu, wubór oprogramowania padł na następującą aplikację o nazwie **Node-RED**, której repozytorium znajduje się na poniższym adresie

https://github.com/node-red/node-red


## PRZEBIEG
Oprogramowanie spełnia wszystkie trzy wstępne warunki mianowicie:
- jest oprogramowaniem Open Source
- jese poprawnie działającym programem w kontenerze wyprowadzającym port TCP
- posiada w repozytorium testy

Dla potwierdzenia tego należało wykazać następujące fakty:
- Wykaż stosowność licencji
W repozytorium aplikacji zanduje się plik **LICENSE** mowiący o tym jaką licencją jest objęto owe oprogramowanie. W tym przypadku jest to licencja **Apache License 2.0** co widać na poniższym zrzucie, zatem jest ona stosowna do naszych działań i możemy bez obawy używać aplikacji w celach przeprowadzenia projektu.

![apache_license](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/apache_license.png)

- Wykaż uruchomiony build i testy poza kontenerem
W tym celu należało pobrać repozytorium aplikacji. W tym celu używamy polecenia git clone i adres repozytorium. Po bobraniu powstaje nam katalog node-red i przechodzimy do niego. Całą operację widać na poniższym zrzucie.

![node_red_clone](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/node_red_clone.png)

Kolejno musimy pobrać wszelkie dependencje potrzebne do build'a. Zatem wykonujemy polecenie **npm install** (będąc w katalogu node-red).

![npm_install](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_install.png)

Po pobraniu wszelkich potrzebnych dependecji możemy przejść do kroku build który wykonujemy przy pomocy polecenia **npm run build**.

![npm_run_build](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_run_build.png)

Build przeszedł pomyślnie co możemu zobaczyć na poniższym zrzucie.

![npm_run_build_done](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_run_build_done.png)

Teraz przechodzimy do uruchomienia testów. Odbywa się to przy pomocy polecenia **npm test**.

![npm_test](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_test.png)

Testy przeszły pomyślnie co widać na poniższym zrzucie.

![npm_test_done](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_test_done.png)

- Wykaż działającą aplikację wewnątrz kontenera.

W tym celu potrzebujemy środowisko Docker które umożliwi nam zbudowanie i uruchomienie aplikacji w kontenerze. W celu zainstalowania Docker'a należy wykonać polecenia przedstawione w instrukcji instalacyjnej dla Dockera'a z poniższego linku.

https://docs.docker.com/engine/install/ubuntu/

Po przeprowadzeniu instalacji pobrałem kilka obrazów dockerowych w celu sprawdzenia czy wszystko działa. Pobrałem między innymi obrazy: node, ubuntu, fedora. Dokonałem tego przy pomocy polecenia **sudo docker pull [nazwa obrazu]**. Sprawdziłem czy posiadam pobrane obrazy przy pomocy polecenia **sudo docker images**. Widać to na poniższym zrzucie (są tam też inne obrazy ale powstały one przy instalacji Jenkinsa o czym będzie w dalszej części).

![docker_images](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/docker_iamges.png)


Aby finalnie przejść do ukazania działającej w kontenerze aplikacji musimy uruchomić kontener oparty na danym obrazie i w nim dokonać takich samych czynności jak wykonywaliśmy poza kontenerem. Zatem musimy pobrać repozytorium, przejść do katalogu aplikacji, zainstalować potrzebne dependencje, wykonać build i uruchomić aplikacje (do tego używamy polecenia **npm start**).
W obecnej sytuacji najelszym wyborem będzie użycie kontenera opartego o pobrany obraz **node**.

Uruchomienie dokonuje przy pomocy polecenia 
**sudo docker run --name nodered -it node /bib/bash**
--name pozawala nadać nazwę kontenerowi
-it pozwala używać kontener w trybie interaktywnym
/bin/bash żeby "być w konsoli" i móc wydawać polecenia

Po wykonaniu powyższego polecenia widzimy, że jesteśmy wewnątrz kontenera i możemy zacząć działać.

![kontener_node_start](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/kontener_node_start.png)

Po wykonaniu wszystkich kroków uruchamiamy aplikację w kontenerze. Widać jej działanie na poniższysz zrzutach.

![npm_start1](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_start1.png)

![npm_start2](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_start2.png)


- Gdy program pracuje, przedstaw sposó, w jaki można się z nim komunikować przez port. Przedstaw formę graficzną i z wykorzystaniem wiersza poleceń. 


