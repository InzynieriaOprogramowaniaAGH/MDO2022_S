# Michal Korzym nr.albumu 402568

## Sprawozdanie Pipeline!


1. Przygotowanie środowiska do realizacji zadania.

Zadanie zostaje przeprowadzone na VM utworzonej dzięki skorzystaniu z oprogramowania Oracle Virtual Box, konkretnie jest to obraz Ubuntu wersja 20. Ponadto część z operacji takich jak kopiowanie tworzenie plików wykonywałem na stacji roboczej z systemem Win.10. Na poczet projektu utworzyłem nową maszyne, ponieważ stara nie wyrabiała jeśli chodzi o pamięć. Tak więc przed przystąpieniem do realizacji zadania należy sobie zapewnić (o ile korzysta się z VM) conajmniej 20gb (według moich obliczeń) wolnego miejsca, ponieważ miejsce jest pochłaniane w dość zabójczym tempie.

2. Podstawa do realizacji pipeline, czyli Kontener Jenkins oraz DIND.

Podczas labolatoriów nr.4 należało utworzyć kontener ```Jenkins``` oraz ```DIND``` będący jego "pomocnikiem". Ich konfiguracja jest zdefiniowana przez zalecenia dostawcy oprogramowania.
*Jenkins* - kontener jenkinsa jest naszym kontenerem bazowym, zapewnia nam on środowisko wdrożeniowe Jenkinsa na którym możliwa jest automatyzacja przeprowadzanych operacji na naszym oprogramowaniu.
*DIND* - (Docker in docker) kontener uruchamiający w sobie kolejny kontener. Możemy dzięki niemu budować/uruchamiać wewnątrz kontenera kolejne kontenery przy pomocy instancji Dockera. 

Dla przypomnienia, na tym etapie należy:
- Utworzyć sieć dockerową (jenkins)
- Utworzyć plik dockerfile pozwalający na budowe obrazu ```myjenkins-blueocean:2.332.1-1``` posiadający WebUI, a następnie uruchomić build w folderze z dockerfilem.
- Uruchomienie kontenera DIND
- Uruchomienie kontenera Jenkins

Uruchomienie kontenerów DIND oraz Jenkins domyślnie będzie konieczne przy każdej nowej sesji, tak więc należy o tym pamiętać! Dodatkowo uruchamianie musi przebiegać z uprawnieniami administratora.

Kontener DIND uruchamiamy jako demona, dajemy mu wszystkie uprawnienia, przypisujemy mu sieć (w naszym przypadku Jenkins). Ponadto podajemy alias sieci używany w kontenerach, czy zmiennne środowiskowe za pomocą flagi ```env```. 

![](./screenshots/s2_DIND.png)

Kontener Jenkins, zbudowany ówcześnie obraz uruchamiamy z publikacją na port 8080. Dzięki czemu po wyszykaniu adresu ```localhost:8080```w naszej przeglądarce naszym oczom powinien ukazać się interfejs Jenkinsa.

![](./screenshots/s1_Jenkins.png)

Potwierdzenie utworzenia obu kontenerów umożliwi nam polecenie ```docker ps```. Poniżej umieszczam screen wyników wywołania tej komendy, podkreśliłem ID kontenera Jenkinsa, które to jest istotne w kontekście możliwości uruchomienia w aktywnym kontenerze np.bashowego terminalu.

![](./screenshots/s3_PS.png)

Jeśli chcemy uzyskać domyślne hasło do świeżo utworzonej instancji Jenkinsa w pierwszej kolejności za pomocą komendy ```docker exec -it < ID kontenera > /bin/bash``` a kolejno odczytujemy plik zawierający hasło ```cat /var/jenkins_home/secrets/initialAdminPassword```. Oczywiście ma to zastosowanie przy domyślnej konfiguracji konta Jenkinsowego.

3. Przygotowanie Pipelin'u.

# Definiowanie pipelina.

Tworzony przeze mnie pipeline będzie rurociągiem deklaratywnym, jest on idealnym wyborem dla prostych rurociągów. Nie jest on jednak tak elastyczny, ponieważ ogranicza to co jest dostępne dla użytkownika (struktura jest bardziej rygorystyczna). Skryptowy natomiast pozwala użytkownikowi na dużo więcej. Jedyne ograniczenia to te narzucone przez Groovy. Nadaje się on więc bardziej do złożonego rurociągu nastawionego na imperatywny model programowania.

W pierwszej kolejności należy dokonać forka repozytorium na którym pracujemy, w moim przypadku kontynuuje prace z *nodejs.org*. Fork pozwala nam na utworzenie kopi repozytorium i eksperymentowania na nim nie wpływając na oryginalny projekt. Oczywiście to czy fork będzie możliwy zależne jest od dostawcy oprogramowania.

![](./screenshots/s4_repoFork.png)

Zforkowane repo klonuje na stacje roboczą aby móc dodawać na nie pliki, konkretnie jenkinsfile'a i dockerfile'e automatyzujące i obsługujące przebieg Pipelina. 

# Opis pliku jenkinsfile

Plik jenkinsfile umieściłem w folderze jenkinsDir w katalogu głównym sklonowanego repozytorium. Jego zawartość prezentuje się następująco:

Jenkins pozwala nam na rozproszoną kompilacje poprzez delegacje do odpowiednich "węzłów agentów". Powodem takiego rozwiązania jest zapewnienie możliwości tworzenia kilku projektów przy pomocy jednej instancji Jenkinsa. W moim przypadku nie ma znakowania agentów (Linux, Windows), pipeline zostanie uruchomiony na dowolnym dostępnym węźle.

- Parametres, w sekcji tej umieściłem dwa parametry: programName oraz version. Są one podawane na wejściu, mają w dalszym kroku służyć do nazwania pliku artefaktu .tar. Ponadto wypisuje je w stage'u publisha. Aby potwierdzić poprawność ich zdefiniowania.

![](./screenshots/s21_parametres.png)

- Build, krok ten to nic innego jak utworzenie aplikacji w kontenerze. Konkretnie kontener *builder* który tworzymy posiada dependencje, w przypadku mojego  repozytorium jest to *npm* będący managerem pakietów dla środowiska Node.js. Tak więc wybór ten wydaje się być oczywistym. Odnosząc się do samego kodu za pomocą ```echo``` komunikuje na wyjściu rozpoczęcie tego etapu a następnie korzystam z pliku dockerfileBuild o którym wspomne później aby zbudować kontener.

- Test, w tym kroku dokonujemy testów, które są obecne w repozytorium. Tak więc tworzymy obraz testujący, u mnie *tester*. Korzystamy z utworzonego wcześniej obrazu buildera! Tak więc, ponownie korzystamy z dockerfila, którego strukture opisze poniżej. A następnie uruchamiamy obraz tester.  

![](./screenshots/s23_testJenkins.png)

- Deploy, tutaj pojawił się problem z voluminami konkretnie z osiągnięciem destynacji buildera na voluminie wyjściowym. Ciągły błąd ``` no such file in  directory``` sprawił, że wywiesiłem bardzo białą flage i zrezygnowałem z voluminów w przypadku deploya. Największym kłopotem było wycofanie się do ścieżki podrzędnej. Tak więc odwołałem się do obrazu buildera, tworzymy więc obraz *deploy* hostujący nasze pliki. Wybór serwera WWW hostującego padł na ```nginx'a```. Łatwa konfiguracja nie powinna sprawić nikomu problemu, jej rozwinięcie podczas opisu pliku dockerfileDeploy. Uruchomienie kontenera standardowo korzystamy z dyrektywy run, jednak następuje tutaj przekierowanie na port 3000 (domyślnie 80). Umożliwi to podgląd hostowanej strony. Na samym końcu wyłączamy kontener, gdyż w przeciwnym wypadku mogło by to doprowadzić do nieskończonego oczekiwania na jego zakończenie.

![](./screenshots/s24_deployJenkins.png)

- Publish, po poprawnie przeprowadzonych procesach: build, test oraz deploy przeszedłem do etapu publish. Tak więc zakładamy, że nasz build powinien zostać jako nowe wydanie programu. Budujemy więc artefakt, w moim przypadku jest to plik *TAR.XZ*. Kolejny raz korzystam z pliku dockerfile, następnie utworzony artefakt "wypycham" do voluminu. Na końcu korzystam z podanych na wejściu parametrów informując o nazwie programu oraz wersji. Tak więc plan minimum na artefakt zostaje osiągniety.

![](./screenshots/s25_publishJenkins.png)

- Sekcja post, ma ona na celu powiadomić w moim przypadku użytkownika o powodzeniu lub niepowodzeniu przebiegu pipelin'a. 

![](./screenshots/s38_post.png)

# Pliki dockerfile

W katalogu głównym repozytorium umieszczone został 4 dockerfil'e. Kolejno dockerfileBuild, dockerfileTest, dockerfileDeploy oraz dockerfilePublish. Pliki dodatkowo umieszczone zostały na repozytorium przedmiotowym. 

- dockerfileBuild

Kolejno korzystamy z obrazu bazowego *node:last*, następnie klonuje zforkowane repozytorium, poprzez komende ```git clone``` < ścieżka do mojego githuba z repo >. Przechodzimy do folderu roboczego, następnie instalujemy wymagane dependecje co jest bardzo ważne w kontekście poprawnego zbudowania programu. W moim przypadku ogranicza się to do npm'a, także nie jest to problematyczne. W ostatnim etapie uruchamiamy builda.

![](./screenshots/s26_dockerfileBuild.png)

-dockerfileTest

Dockerfile ten bazuje na zbudowanym uprzednio kontenerze *builder*,  następnie ustalamy katalog roboczy, za pomocą polecenia ls printuje zawartość katalogu repozytorium, a na samym końcu uruchamiam załączone testy. 

![](./screenshots/s27_dockerfileTest.png)

-dockerfileDeploy

Tak jak zostało to wspomniane powyżej praca z voluminami nie należała do najprostszych, tak więc postanowiłem bazować na obrazie builder'a, kopiuje z folderu build odpowiednie pliki do hostującego folderu z nginx'em. Tak więc wyciągam z buildera co warto tutaj zaznaczyć wyłącznie pliki z folderu *en*, gdyż hostowanie reszty uważam za zbędne. Ponadto kopiuje pliki odpowiadające za obsługe frontu html/css.

![](./screenshots/s28_dockerfileDeploy.png)

-dockerfilePublish

W ostatnim etapie odwołuje się do kontenera builder, a następnie tworze paczkę tar będącą artefaktem. 

![](./screenshots/s29_dockerfilePublish.png)

# Konfiguracja JenkinsBlueocean

Przechodzimy do UI Jenkinsa, w pierwszej kolejności tworzymy nowy projekt.

![](./screenshots/s30_blueOcean.png)

Wybieramy pipeline oraz podajemy nazwe swojego projektu, w moim przypadku nazwałem go najzwyczajniej na świecie ```Test```.

![](./screenshots/s31_blueOceanPip.png)

Ustawiamy definicje pipeline'u na ```Pipeline script from SCM``` oraz wybieram źródłówy system kontroli plików w tym przypadku jest to *Git*, na którym przechowuje repozytorium z jenkinsfilem.

![](./screenshots/s32_pipelineSetting1.png)

Kolejno ustawiamy źródło URL (tutaj adres repozytorium na moim koncie GitHub) i ustawiamy brancha, tutaj main.

![](./screenshots/s33_pipelineSetting2.png)

Na sam koniec ustalamy ścieżke do pliku jenkinsFile. W moim przypadku jest to ścieżka do folderu, znajdującego się w katalogu głównym. Na koniec wszystko zapisujemy.

![](./screenshots/s34_pipelineSetEnd.png)

# Rezultat "końcowy", logi uruchomionego Pipelina

Uruchomienie Pipelinu, podajemy początkowe parametry.

![](./screenshots/s18_PipelineStart.png)


-------------SCM JENKINSFIle------------------

![](./screenshots/s5_startPipeline.png)

------------BUILD-----------------------------

![](./screenshots/s6_build1.png)

![](./screenshots/s7_build2.png)

![](./screenshots/s8_build3.png)

![](./screenshots/s9_build4.png)

![](./screenshots/s10_succesBuild.png)

------------TEST---------------------

![](./screenshots/s11_test1.png)

![](./screenshots/s13_test3.png)

![](./screenshots/s14_test4.png)

![](./screenshots/s15_success.png)

-----------DEPLOY-------------------

![](./screenshots/s16_deploy1.png)

![](./screenshots/s17_deploy2.png)

----------PUBLISH--------------------

![](./screenshots/s19_Publish.png)

------WITH STAGE------------------

![](./screenshots/s35_staged.png)

---------LOG CONFIRM------------------

![](./screenshots/S20_results.png)

Krótkie wnioski do powyższych wyników, 17 test nie powiódł się gdyż nie zgadzała się nazwa artefaktu, jednak poprzednie stage'e się powiodły jak widać trwały zauważalny czas, szczególnie budowanie i testowanie. Widzimy jednak, że uruchomienie pipelinu po raz kolejny na tej samej sesji znacznie skraca swój czas, część plików zapisuje się w pamięci cache co znacząco skraca proces.

Na potwierdzenie utworzenia artefaktu załączam screena z wnętrza kontenera Jenkinsa, w folderze volumes znajdują się build (pozostałość po próbach pracy z voluminami) oraz dwa artefakty (mają one taką samą zawartość, jedynie inne nazwy).

![](./screenshots/s36_volumes.png)

Ponadto dzięki przekierowaniu portu jesteśmy w stanie po odwołaniu do ```localhost:8083``` ui startowew nodejs.org. Potwierdza to zarówno załączony zrzut ekranu z wyniku odwołania się do wspomnianego adresu jak i przekierowania portów wewnątrz kontenera jenkins jak i na zewnątrz.

![](./screenshots/s37_hosted.png)

![](./screenshots/s38_portForwarding.png)


# Wnioski i podsumowanie

Tworzenie pipelinu dla osoby będącej w temacie jedynie powierzchownie jest dość trudne, nie umniejsza jednak to w żaden sposób korzyścią jakie niesie ze sobą pipeline. Automatyzacja, uporządkowanie czy uniwersalność wykonywanych akcji prowadzi do tak powrzechnego zastosowania tego rozwiązania. Sam w sobie Jenkins ułatwia pracę integracyjną i daje nam sporo możliwości. W projekcie nie udało się skorzystać z voluminów za wyjątkiem publikacji artefaktu. Ponadto, poległem podczas definiowania nazwy artefaktu za pomocą wejściowych parametrów. Jednak podstawowe funkcjonalności pipelinu zostały zapewnione.






