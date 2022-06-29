### Daniel Kabat
### Inzynieria Obliczeniowa
### INO GCL-01

# Projekt Zaliczeniowy 1

(Wszelkie czynności są wykonywane na wirtualnej maszynie Oracle VM VirtualBox na której zostało zainstalowane najnowsze Ubuntu 22)

W ramach przeprowadzenia zadań zawartych w treści wymagań do projektu, wybór oprogramowania padł na następującą aplikację o nazwie **Node-RED**, której repozytorium znajduje się na poniższym adresie

https://github.com/node-red/node-red


## PRZEBIEG
Oprogramowanie spełnia wszystkie trzy wstępne warunki mianowicie:
- jest oprogramowaniem Open Source
- jest poprawnie działającym programem w kontenerze wyprowadzającym port TCP
- posiada w repozytorium testy

Dla potwierdzenia tego należało wykazać następujące fakty:
- Wykaż stosowność licencji:

W repozytorium aplikacji znajduje się plik **LICENSE** mowiący o tym jaką licencją jest objęte owe oprogramowanie. W tym przypadku jest to licencja **Apache License 2.0** co widać na poniższym zrzucie, zatem jest ona stosowna do naszych działań i możemy bez obawy używać aplikacji w celach przeprowadzenia projektu.

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

Uruchomienia dokonuje przy pomocy polecenia 

**sudo docker run --name nodered -it node /bib/bash**

--name pozawala nadać nazwę kontenerowi

-it pozwala używać kontener w trybie interaktywnym

/bin/bash żeby "być w konsoli" i móc wydawać polecenia

Po wykonaniu powyższego polecenia widzimy, że jesteśmy wewnątrz kontenera i możemy zacząć działać.

![kontener_node_start](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/kontener_node_start.png)

Po wykonaniu wszystkich kroków uruchamiamy aplikację w kontenerze. Widać jej działanie na poniższysz zrzutach.

![npm_start1](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_start1.png)

![npm_start2](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/npm_start2.png)


- Gdy program pracuje, przedstaw sposób, w jaki można się z nim komunikować przez port. Przedstaw formę graficzną i z wykorzystaniem wiersza poleceń. Skuteczność komunikacji musi być jednoznaczna.

Komunikacja w sposób graficzny:

Aby uruchomić aplikację przechodzimy do folderu z pobrany repozytoriu i wykonujemy polecenie **npm start**, które uruchamiana naszą uprzednio zbudowaną aplikację. Widać to na załączonym ponizej zrzucie. Po uruchomienie w konsoli mamy podany także adres local hosta jaki musimy użyć w przeglądarce.

![app_start](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/app_start.png)

Po użyciu tego adresu uzyskujemy okno graficzne aplikacji.

![app_start_web](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/app_start_web.png)

Komunikacja z wykorzystaniem wiersza poleceń:

![app_start_console](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/app_start_console.png)


- Sforkuj repozytorium aplikacji tak, żeby połączyć je z przygotowanymi elementami DevOps

Na poniższym zrzucie widać sforkowane repozytorium Node-red które teraz jest jednym z moich repozytoriów.

![fork_repo](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/fork_repo.png)


## PIPLINE

W celu przygotwania i uruchomienia pipelinw'u potrzebujemy odpowiednie środowisko do tego. W tym celu wymagana jest instalacja **Jenkins'a**. Instalacja została dokonana krok po kroku zgodnie z instrujcją znajdującą się pod poniższym linkiem.

https://www.jenkins.io/doc/book/installing/docker/

Po zainstalowania i uruchomieniu przechodzimy do konfiguracji naszego projektu/pipelin'u.

Wybieramy opcje Nowy Projekt

![new_project](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/new_project.png)

Kolejno z opcji wybieramy **Pipeline** i nadajemy mu wybraną przez siebie nazwę.

Przechodzimy do konfiguracji. Wybieramy zakładkę Pipeline i tam uzupełniamy następujące pola.

- definition ustawiamy na **Pipeline script from SCM**
- SCM na **Git**
- w Repozytory URL podajemy link do naszego repozytorium ze sforkowany repozytorium aplikacji

![pipeline_definition](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/pipeline_definition.png)

- Branch ustawiamy na master

![pipeline_branch](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/pipeline_branch.png)

- Finalnie podajemy nazwę naszego pliku z podanego ówcześnie repozytorium w którym zawiera się definicja przebiegu naszego pipelinu

![pipeline_name](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/pipeline_name.png)


Nasz pipeline ma się składać z czterech kroków takich jak:

- Build
- Test
- Deploy
- Publish

W ramach kroku **Build** musimy wybrać odpowiedni kontener, w którym będzie się odbywał nasz build. W przypadku aplikacji dla której przygotowywany jest pipeline wybór padł na kontener **node** z racji ze bedziemy pracować z aplikacją node'ową więc wybór wydaje się jak najbardziej stosowny.

Nasz kontener nie wymaga zaopatrywania go w inne dodatkowe dependacjie. Aplikacja w trakcie przechodzenia builda dociągnie sobie zadane potrzebne dependencje.

Po przejściu pipelinu mozliwy jest odczyt logów z Jenkinsa. Nie dokonywałem dodatkwowej definicji zapisów logów jako artefaktów w definicji pipelinu.

W kroku build wykorzystywany jest dockerfile do stworzenia odpowiedniego kontenera do zbudowania tak zwanego buildera. Uzyty dockerfile jest następującej postaci.

![build_dockerfile](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/build_dockerfile.png)

Pierwsze polecenie nam definiuje na jakim obrazie ma zostać oparty nasz nowy utworzony obraz. Kolejno mamy dokonane klonowanie repozytorium. Poleceniem WORKDIR ustawiamy katalog roboczy i przy pomocy polecenia RUN definujemy co ma zostać wykonane.

Ponizej mamy zrzut przedstawiający definicję etapu build z jenkinsfile'a.

![build_jenkinsfile]()

Pierwsza linijka to podanie komunikatu o tym co bedzie teraz następować. Kolejno utworzenie nowego obrazu w oparciu o definicję podaną w dockerfilu. Pomyślne utworzenie swiadczy o bezproblemowym przejściu builda (zawartego w definicji pliku dockerfile). Będzie on w tym przypadku nosił nazwę nrbuild. Kolejno tworzony jest wolumin na który jest "pakowany" katalog ze zbudowaną już aplikacją. Przyda nam się to w części Deploy.

W ramch kroku **TEST** używamy naszego powstałego w kroku build obrazu jako obraz bazowy dla testów. Mamy już tam zainstalowaną aplikację więc jedyne co będziemy musieli zrobić to uruchomić testy. W celu utworzenia obrazu z testami mamy przygotowany odpowiedni plik dockerfile z przepisem na to. Wygląda on następująco.

![test_dockerfile](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/test_dockerfile.png)

Widzimy, iż za obraz bazowy pobierany jest poprzednio utworzony nrbuild. Ustawiany jest katalog roboczy oraz uruchamiane testy. Krok test w jenkinsfile'u wygląda następująco.

![test_jenkinsfile]()

Tak jak uprzednio mamy krótki komunikat, a następnie tworzony jest obraz nrtest w oparciu o definicje z dockerfile'a.

Przechodząc do kroku **Deploy** który ma na celu sprawdzenie czy nasza zbudowana aplikacja, przeniesiona w inne "miejsce" (w życiu codziennym w dokładne środowisko w jakim ma pracować) nie wykazuje problemów, uruchamia się i działa. Niestety w tym kroku napotkałem problem, z którym mimo wielu prób nie udało mi się uporać. Po uruchomieniu aplikacji nmp start w logach ukazywała mi się postać "wierszowa" uruchomienej aplikacji co świadczy o jej działaniu, jednak by jenkins mógł przejśc dalej z wykonywaniem pipeline'a konieczne jest zakończnie pracy aplikacji przy użyciu polecenia CTRL+C co nie udało mi się przekazać w skrypcie i mój pipeline działał "w nieskończoność". W celu choć minimallego sprawdzenia poprawności działania zostało użyte polecenie npm run a następnie sprawdzenie stanu kontenera i czy zwraca on wartość 0 świadczącą iż wszystko jest w porządku. Poniżej znajduje się fragment odpowiadający za krok Deploy.

![deploy_jenkinsfile]()

Jak uprzednio widzimy mamy linie odpowiadającą za krótką informacje, następnie usuwany jest kontener o zadanej nazwie jeśli istniej z racji, że gdy przy jednym pipelinie zostanie utworzony o danej nazwie co mam miejsce w kolejnej linii to przy kolejnym uruchomieniu pipelinu zostanie zwrócony błąd o niemożliwości utworzenia nowego o zadanej nazwie bo już taki istnieje. Widzimy, że przy okazji tworzenia jest montowany volumin zawierający katalog z już zbudowaną działającą aplikacją i dokonywane jest jej sprawdzenie. Kolejno sprawdzany jest Exit.Code w celu sprawdzenia czy wszystko jest w porządku. Najlepiej by było to zrobić jak wspamniano wcześniej uruchamijąc aplikację i pokazać jej działanie "wierszowe" jednak to blokowało pipeline i nie udało się tego pokonać na ten moment.

Odpowiadając na pytanie czy program powinien zostać zapakowany do jakiegoś przenośnego formatu stwierdzam że w zadanym przypadku tak. Ponieważ w uzasadnonych przypadkach dystrybucja programu w formacie "paczki" gdzie jedynie należy ją pobrać, rozpakować i wszystko działa jest dużo łatwiejsza niż w sytuacji gdy program byłby dystrybuowany jako obraz dockerowy gdyż wymaga to od nas więcej pracy do uruchomienia gdy nie mamy odpowiednio przygotowanego środowiska. 


Ostani krok publish zakłada już przygotowanie formy do dystrybucji naszej aplikacji. W tym przypadku padł wybór na spakowanie folderu ze zbudowaną aplikacją i publikowanie w formacie TAR.XZ. Krok w jenkinsfile'u odpowiadający za to jest przedstawiony poniżej.

![deploy_jenkinsfile]()

Fragment w tym przypadku jest nieco dłuższy ale jego działanie przbiega następująco. Mamy instrukcje warunkową która odpowiada za to czy zbudowana aplikacja z danego wywołania pipelinu ma być publikowana (przy uruchamianiu pipeline'u mamy checkbox'a do wyboru czy publikacja ma nastąpić czy nie).
Kolejno tworzony jest nowy katalog (w naszym jenkinsowym workspacie). Kolejno usuwany jest kontener o nazwie nrpublish jesli istnieje by zapobiec sytuacji że nasz pipieline napotka problem w kolejnym kroku przy tworzeniu z racji że już taki istnieje. Tworzony jest kontener oparty o obraz powstały w naszym buildzie (czyli zawierający zbudowaną, sprawną i przetestowaną aplikacje w kroku test). Kolejno kopiowany jest z niego katalog ze sprawną aplikacją do naszego workspaceu jenkinsowego. Kolejno katalog ten zostaje spakowany, folder usunięty a nasz "tar" opublikowany w sekcji artifacts co umożlwia nam pobranie go z poziomu jenkinsa i po rozpakowaniu otrzymujemy sprawną działającą aplikację. 


Nasz jnkinsfile zawiera jeszcze dwie sekcje. Jedna poprzedzająca cały ciąg Build-Test-Deploy-Publish następującej postaci.

![parameters_jenkinsfile]()

Odpowiedzialna jest ona za wersjonowanie naszej otrzymywanej aplikacji po publishu. Po uruchomieniu pipelinu pojawia nam się okno gdzie podajemy wersję oraz nazwę i w przypadku zaznaczenia opcji publish otrzymywany artefakt jest oznaczany podanymi przez nas danymi. Wygląda to następująco.

![jenkins_UI](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/jenkins_UI.png)

oraz nasz otagowany/owersjonowany artefakt który jest gotową aplikacją do instalcji wyłacznie poprzez rozpakowanie.

![artefakt](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/tag_version.png)

W celu potwierdzenia tego popbrałem mój artefakt, rozpakowałem go a następnie wykonałem polecenie npm star by przetestować czy aplikacja się poprawnie uruchomi. Wszystko przebiegło pomyślnie co widać poniżej.

![final_app](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/final_app.png)

Ostatnią sekcją w jenkinfilu natomiast jest skecja odpowiadająca za poinformowanie o przebiegu pipelinu.

Zadanie sprawiło nieco trudności, głownie były one spowodowane odpowiednim zapisem poleceń w jenkinsfilu. Mimo wszystko udało się przygotować sprawny pipeline realizyjący wszystkie cztery założenia i dostarczajączy "na życzenie" gotową aplikację tylko wymagającą rozpakowania. 

Poniżej znajdują się jeszcze logi z pipelinu.


![pipeline_start](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/pipeline_start.png)

![logi1](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/logi1.png)

![logi2](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/logi2.png)

![logi3](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/logi3.png)

![logi4](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/logi4.png)

![logi5](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/logi5.png)

![logi6](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/logi6.png)

![logi7](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/DK290596_termin2/INO/GCL01/DK290596_termin2/logi7.png)


