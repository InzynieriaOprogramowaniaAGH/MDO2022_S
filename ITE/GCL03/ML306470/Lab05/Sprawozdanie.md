#Cel
 Celem projektu było przygotowanie środowiska wdrożeniowego dla prostej aplikacji z Javy (Maven) odpowiedzialnej za wypisywanie na ekran "Hello world".
 
#Streszczenie kroków
 W Celu wykonania opisanych kroków należy mieć przygotowany działający Jenkins i Docker.

 1. W graficznym interfejsie Jenkinska należy wybrać "Nowy Projekt", następnie wpisać w pole nazwy projektu wybraną przez siebie nazwe projektu, wybrać "Pipeline" jako typ projektu i końcu wcisnąć przycisk potwierdzający "OK".
 
 
 ![](ScreenShots/JenkinsNewProject.png?raw=true)
 
 
 ![](ScreenShots/JenkinsNewPipeline.png?raw=true)
 
 
 2. W oknie konfguracji należy ustawić odpowiednie pola w sposób podany na poniższych zrzutach ekranu:
 
 
 
 ![](ScreenShots/PipelineConfig1.png?raw=true)
 
 
 ![](ScreenShots/PipelineConfig2.png?raw=true)
 

 Pierwsze pole, które należy zaznaczyć "Do not allow concurrent builds" nie pozwala na uruchamianie równoległych pipelinów.
 Następnie trzeba zazmaczyć GitHub project i podać link do wdrażanego projektu ```https://github.com/EchoOfCasual/Hello-World-With-Tests-Maven/```.
 
 Kolejnym krokiem już w sekcji Pipeline jest ustawienie poszczególnych pól:
 Definition -> ```Pipeline script from SCM``` (pipeline Jenkinsa będzie pobierany z pliku)
 SCM -> ```Git``` (informacja dla Jenkinsa, że plik będzie znajodwał się na Git)
 Repositories / Repository URL -> ```https://github.com/EchoOfCasual/Hello-World-With-Tests-Maven.git``` (informacja dla Jenkinska, na gdzie dokładnie jest plik Jenkinsowy)
 Repositories / Credentials -> ```- none -``` (parametry do logowania - są zbędne, gdyż repozytorium jest publiczne)
 Repositories / Branches to build / Branch Specifier (blank for 'any') -> ```*/master``` (gałąź, z której będzie pobierany Jenkinsfile)
 Repositories / Repository browser -> ```(Automatyczny)``` (wybór repository browser - automatyczny działa)
 Script Path -> ```Jenkinsfile``` (nazwa pliku Jenkinsowego - w tym przypadku Jenkinsfile)
 
 3. Po zapisaniu konfiguracji należy kliknąć "Zapisz" i uruchomić pipline wybierając opcje "Uruchom" (lewa część wyświetlonej strony).
 
  ![](ScreenShots/JenkinsPipelineConfigured.png?raw=true)
  
  Pipeline  w jego ostatecznej formie przyjmuje również parametry:
  
  -promote -> Czy publikować budowany artefakt
  -version -> Jaki ma być numer wersji wdrażanego artefaktu
  
  Jako, że przy pierwszym uruchomieniu Jenkins jeszcze o nich nie wie (znajdują się one w Jenkinsfilu), pierwsza próba uruchomienia nie będzie kompletna. Jednak zostaną pobrane informacje o istnieniu powyższych parametrów i przy najstępnym jego uruchomieniu będą możliwe do ustwaienia. (Można pierwsze uruchomienie po zakończeniu etapu Declarative: Checkout SCM, informacja o parametrach zostanie już pobrana.)
  
  ![](ScreenShots/FirstPipeline.png?raw=true)
 
 
 
 4. Następnie należy ponownie uruchomić pipeline tym razem wybierająć opcję "Uruchom z parametrami" (powinna zastąpić opcję "Uruchom" - należy jednak odświeżyć stronę).
 
 Tym razem przed uruchomieniem pipeline będzie konieczne wprowadzenie parametrów opisanych w kroku 3, należy je ustawić wedle woli, a następnie kliknąć przycisk "Buduj".
 
 ![](ScreenShots/RunWithParameters.png?raw=true)
 
 
 Po zakończeniu działania pipeline w przypadku zaznaczenia parapetru publikuj na stronie pojawi się artefakt projektu (po odświeżeniu strony). W przypadku tej aplikacji będzie to plik jar zawierający kod wykonawczy wraz z wszystkimi jego zależnościami. Można go po prostu uruchomić na komputerach z zainstalowaną virtualną maszyną Javy.
 
 ![](ScreenShots/PipelineCompleted.png?raw=true)
 


#Etapy pipeline
 - Clone
 Etap ten składa się następujących kroków
 ```
	sh 'docker system prune --all -f'
				
	sh 'docker volume create vol-in'
	sh 'docker volume create vol-out'

	sh 'docker build -t cloner:latest . -f /var/jenkins_home/workspace/PiplineForDevOps/Docker-clone'
	sh 'docker run --mount source=vol-in,destination=/inputVol cloner:latest'
 ```
 
 Pierwszy krok pozbywa się pozostałości po poprzednich przejściach pipeline.
 Następnie tworzone są dwa woluminy vol-in (na repozytorium) i vol-out (na zbudowany program)
 Kolejnymi krokami jest tworzenie obrazu dockerowego służącego do klonowania i uruchomienie go z podpięciem woluminu vol-in.
 
 
 - Build
 Etap ten składa się następujących kroków
 ```
	sh 'docker build -t builder:latest . -f /var/jenkins_home/workspace/PiplineForDevOps/Docker-build'
	sh 'docker run --mount source=vol-in,destination=/inputVol --mount source=vol-out,destination=/outputVol builder:latest'
 ```
 
 Tworzony jest obraz dockerowy służący do budowania programu, a następnie uruchamiany z podpięciem woluminów odpowiadających za przechowywanie repozytorium (vol-in jako inputVol) i zbudowany program (out-vol jako outoputVol).
 
 
 - Test
  Etap ten składa się następujących kroków
  ```
	sh 'docker build -t tester:latest . -f /var/jenkins_home/workspace/PiplineForDevOps/Docker-test'
	sh 'docker run --mount source=vol-in,destination=/inputVol --mount source=vol-out,destination=/outputVol tester:latest'
  ```
 
 Tworzony jest obraz dockerowy służący do testowania programu, a następnie uruchamiany z podpięcie woluminów odpowiadających za przechowywanie repozytorium (vol-in jako inputVol) i zbudowany program (out-vol jako outoputVol).
 
 
 - Deploy
   Etap ten składa się następujących kroków
  ```
	sh 'docker build -t deployer:latest . -f /var/jenkins_home/workspace/PiplineForDevOps/Docker-deploy'
	sh 'docker run --name deployC --mount source=vol-out,destination=/outputVol deployer:latest'
	
	sh 'rm -rf artifacts'
	sh 'mkdir artifacts'
	sh 'docker cp deployC:outputVol/SimpleApp.jar ./artifacts'
  ```
 
 Tworzony jest obraz dockerowy służący do wdrażania programu, a następnie uruchamiany z podpięciem woluminu odpowiadającego za zbudowany program (out-vol jako outoputVol).
 Następnie w razie jeśli istnieje folder artifacts jest on usuwany z całą jego zawartośćią. 
 Po czym tworzony jest na nowo (lub po raz pierwszy) i kopiowana jest do niego plik jar z woluminu wyjściowego.
 
 
 - Publish
   Etap ten składa się następujących kroków
  ```
	script{
		if(params.promote){
		 sh 'mv ./artifacts/SimpleApp.jar ./artifacts/SimpleApp-${version}.jar'
		 archiveArtifacts artifacts: 'artifacts/SimpleApp-${version}.jar'
		}
		else{
		 echo 'Pipeline finished work sucessfully but new version wasn\'t published.'
		}	
	}
  ```
  W celu użycia instrukcji warunkowej zawarość kroku "Publish" jest umieszczona w 'script'.
  Zależnie od podanego przez użytkownika parametru "promote" (boolean) pipeline zmienia nazwę artefaktu SimpleApp.jar na SimpleApp-```version```.jar
  i publikuje zmiany na swojej stronie lub wypisuje w konsoli informacje o powodzeniu procesu, lecz nie publikowaniu nowej wersji.
  
  
#Diagram


 **Diagram aktywności**
 
 ![](ScreenShots/HelloWorldAppPiepeline.png?raw=true)
