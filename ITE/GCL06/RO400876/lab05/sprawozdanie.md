# Rafał Olech - Sprawozdanie z laboratorium 5

## Cel i opis projektu:

Celem projektu było utworzenie pipeline'u za pomocą serwera Jenkins. Zadaniem utworzonego pipeline'u było wykonanie wszystkiech czynności przeprowadzonych na wcześniejszych laboratoriach ale w sposób zautomatyzowany. Pipeline ma na celu zbudownie, testowanie, wdrożenie oraz opublikowanie wybranego projektu. Jako projekt wzięty został program z open sourcowego repozytorium, który znajduję się pod następującym linkiem: https://github.com/RafalOlech00/cytoscape.js.  




## Wykonanie ćwiczenia:

### 1. Przygotowanie kontenerów.

Przed rozpoczęciem pracy z Jenkinsem należy przygotować kontenery, potrzebne do wykonania projektu. Potrzebne są dwa kontenery: kontener z Jenkinsem, który został utworzony pod nazwą jenkins-blueocean oraz kontener z obrazem DIND o nazwie jenkins_Container.
Szczegółowa instrukcja jak uruchomić wyżej wspomniane dockerowe kontenery znajduję na moim githubie w sprawozdaniu do lab04 znajdującym się pod linkiem: https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/RO400876/ITE/GCL06/RO400876/lab04/sprawozdanie.md

Aby sprawdzić czy uruchomienie kontenerów przebiegło pomyślnie należy skorzystać z komendy `sudo docker ps`, za pomocą której można zobaczyć aktualnie działające kontenery. 

![img](wyswietlenie_kontenerow.PNG)

### 2. Utworzenie projektu w Jenkinsie.

Jeżeli posiadamy działające kontenery, kolejnym krokiem jest zalogowanie się w Jenkinsie i utworzenie nowego projektu. Jako typ projektu należy wybrać pipeline, nadać nazwę projektu, a następnie zatwierdzić.

![img](tworzenie_projektu.PNG)

Po utworzeniu projektu należy skonfigurować pipeline w sposób pokazany poniżej, a więc należy zaznaczyć pola `Do not allow concurrent builds` oraz `To zadanie jest sparametryzowane`.

![img](konfiguracja_pipeline1.PNG)

Następnie w opcjach zaawansowanych jako Definition należy wybrać z listy rozwijanej `Pipeline script from SCM`, następnie jako SCM należy wybrać `Git`. Następnie jako Repository URL należy dodać repozytorium w tym przypadku jest to repozytorium przedmiotu `https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S`. 

![img](konfiguracja_pipeline22.PNG)

W kolejnym kroku jako Branch Specifier należy wpisać nazwę własnego brancha w moim przypadku jest to `*/RO400876`. W ostatnim polu o nazwie Script Path należy dodać ścieżkę do Jenkinsfile'a `ITE/GCL06/RO400876/lab05/RO_Jenkinsfile`.

![img](konfiguracja_pipeline3.PNG)

Po ukończeniu konfiguracji pipline ukaże się poniższy ekran startowy utworzonego projektu.

![img](jenkins_start.PNG)



### 3. Potrzebne dockerfile'e.

Aby przejść do pisania pipline'u wymagane jest umieszczenie trzech plików dockerfile'owych na repozytorium i w branchu dodanym podczas konfiguracji pipline'u.

![img](git_dockerfile.PNG)

Pierwszy z nich jest to dockerfile o nazwie `RO_Dockerfile_Build`odpowiedzialny za budowanie projektu. Znajdują się w nim komendy odpowiedzialne za sklonowanie repozytorium z wybranym projektem, następnie doinstalowanie potrzebnych zależności, a na samym końcu znajduje się polecenie rozpoczynające proces budowania projektu.

Zawartość `RO_Dockerfile_Build`:
```
FROM node:lts-bullseye
RUN git clone https://github.com/RafalOlech00/cytoscape.js.git
WORKDIR cytoscape.js
RUN npm install
RUN npm run build
```


Drugi z nich jest to dockerfile o nazwie `RO_Dockerfile_Test`odpowiedzialny za testowanie aplikacji. Znajduje się w nim polecenie `RUN npm test`, za pomocą której uruchamiane są testy znajdujące się w projekcie.

Zawartość `RO_Dockerfile_Test`:
```
FROM ro_build:latest
WORKDIR cytoscape.js
RUN npm test
```


Trzeci dockerfile o nazwie `RO_Jenkinsfile` jest to dockerfile, w którym znajduję się treść pipline'u i jego zawartość jest opisana w następnym punkcie.


### 4. Zawartość pipline'u.

* Parameters:

Pipline przyjmuje dwa parametry `PROMOTE` oraz `VERSION`, które są określone w sekcji `parameters`. Parametr `VERSION` oznacza wersję wydawanego programu. W tym przypadku parametr określający wersję domyślnie ustawiony jest na 1.0.0 lecz przy każdym uruchomieniu pipline'u istnieje możliwość zmiany wersji. Drugi parametr czyli `PROMOTE` decyduje czy sekcja Publish się wykona. Jeżeli wszystkie poprzednie etapy pipelin'u przejdą poprawnie i PROMOTE jest zaznaczone, sekcja Publish buduje publikowalny artefakt, o numerze wersji z parametru `VERSION`.

Sekcja `agent` konfiguruje, na których węzłach można uruchomić potok. Określenie `agent any` oznacza, że ​​Jenkins uruchomi zadanie na dowolnym z dostępnych węzłów.

```
parameters
    {
        string(name: 'VERSION', defaultValue: '1.0.0', description: '')
        booleanParam(name: 'PROMOTE', defaultValue: true, description: '')
     }
    
	agent any
```




* Prepare:

Krok `Prepare` został utworzony w celu uporządkowania skryptu aby był bardziej przejrzysty. W sekcji tej następuje ogólne przygotowanie projektu, w którym znajduję się utworzenie woluminów wejściowego o nazwie `volume_input` oraz wyjściowego o nazwie `volume_output`. W kroku tym usuwany jest także kontener o nazwie `ro_build`, który powstaje przy budowaniu projektu w kroku następnym. Kontener ten usuwany jest jeżeli istnieje, a ma to szczególne znaczenie jeśli projekt uruchamiany jest kilkukrotnie. Za pomocą komendy `docker volume prune -f` usuwane są także wszystkie aktualnie nie używane woluminy.


```
stage('Prepare')
		{
			steps
			{
				sh '''
				echo "Przygotowanie projektu..."
				
				docker rm -f ro_build || true
				docker volume prune -f
				docker volume  create --name volume_input
				docker volume  create --name volume_output
				 	      
                echo "Przygotowanie zakończone"
				'''	
			}
		}
```




* Build:

Krok `Build` odpowiada za zbudowanie projektu za pomocą dockerfile'a o nazwie `RO_Dockerfile_Build`. W kontenerze `ro_build` budowany jest projekt, do którego link znajduję się w dockerfilu pod ścieżką `ITE/GCL06/RO400876/lab05/RO_Dockerfile_Build`. Następnie zostaje uruchomiony kontener wynikowy o nazwie `ro_build` z podpiętym woluminem wejściowym o nazwie `volume_input`. Zbudowany projekt kopiowany jest do woluminów wejściowego `volume_input` oraz do wyjściowego `volume_output`. Aby sprawdzić czy poprawnie skopiowano zbudowany projekt wyświatlane są zawartości obu woluminów. 


```
stage('Build')
		{
			steps
			{
				sh '''
				echo "Budowanie projektu..."
				
				docker build . -f ./ITE/GCL06/RO400876/lab05/RO_Dockerfile_Build -t ro_build
                docker run --mount type=volume,src="ro_build",dst=/volume_input ro_build:latest bash -c "cd .. &&  cp -r /cytoscape.js /volume_input && cp -r /volume_input /volume_output && ls ./volume_input && ls ./volume_output" 
                    		 	      
                echo "Budowanie zakończone"
				'''
			}
		}
```




* Test:

Krok `Test` odpowiada za testowanie programu. Na początku usuwany jest kontener `ro_test` jeżeli istnieje. Jest to szczególnie ważne jeżeli projekt uruchamiany jest więcej niż jeden raz. Tworzony jest kontener `ro-test`, w którym za pomocą wcześniej opisanego dockerfile'a `RO_Dockerfile_Test` uruchamiane są testy znajdujące się w repozytorium programu. Następnie uruchamiany jest kontener o nazwie `test_container` z podpiętym woluminem wejściowym `volume_input`. 

```
stage('Test')
		{
			steps
			{
				sh '''
				echo "Testowanie projektu..."
				
				docker rm -f ro_test || true
				docker build . -f ./ITE/GCL06/RO400876/lab05/RO_Dockerfile_Test -t ro_test
				docker run --name test_container --rm --mount source=ro_test,target=/volume_input ro_test:latest
				
				echo "Testowanie zakończone"
				'''
			}
		}
```




* Deploy:

Krok `Deploy` odpowiada za wdrożenie projektu. W sekcji tej na początku usuwany jest kontener `deploy_container` o ile istnieje, jest to szczególnie ważne przy wielokrotnym uruchomieniu projektu. Następnie uruchamiany jest kontener przeznaczony do wdrożenia o nazwie `deploy_container` z podpiętym woluminem wyjściowym `volume_output`. Polecenie exit sprawdza status operacji, jeżeli wszystkie kroki przejdą pomyślnie pipline kontynuuje swoją pracę, natomiast jeżeli pojawi się błąd praca pipline'a zostaje zatrzymana. 

```
stage('Deploy')
        {
            steps
            {
                sh '''
                echo "Wdrażanie projektu..."
                
                docker rm -f deploy_container || true
                docker run -dit --name deploy_container --mount type=volume,src="volume_output",dst=/ro_project node
                exit $(docker inspect deploy_container --format="{{.State.ExitCode}}")
                
                echo "Wdrażanie zakończone"
            	'''
            }
        }
```




* Publish:

Krok `Publish` odpowiada za opulikowanie programu. W tej sekcji na początku sprawdzane jest czy parametr `PROMOTE` ustawiony jest na true. Warunek ten bierze pod uwagę chęci użytkownika, ponieważ użytkownik niekoniecznie przy każdej kompilacji będzie chciał wydawać nową wersję programu. Dlatego jeżeli przy uruchamianiu projektu użytkownik zaznaczy `PROMOTE`, po skompilowaniu zostanie wydana nowa wersja. Natomiast jeżeli użytkownik nie zaznaczy tego parametru nie zostanie opulikowana nowa wersja. To właśnie sprawdzane jest w początkowym warunku. Następnie tworzony jest folder o nazwie `ro_artifacts9`, dla którego następnie zmieniane są prawa dostępu na 777 czyli wszystkie uprawnienia dla wszystkich, ponieważ jeżeli tego nie zrobimy przy następnym uruchomieniu projektu nie będzie możliwe usunięcie plików z katalogu `ro_artifacts9` ponieważ nie będziemy mieć wymaganych uprawnień i dostaniemy błąd permission denied. W kolejnym kroku uruchamiany jest kontener do publikowania o nazwie `ro_publish` z podpiętym woluminem wyjściowym `volume_output`. Następnie tworzony jest artefakt o numerze wersji z parametru `VERSION`. Artefaktem tym jest możliwa do zainstalowania postać projektu, w tym przypadku jest to plik TAR.XZ. Jako wynik sekcji Publish otrzymujemy nową spakowaną wersję naszego projektu.    

```
stage ('Publish')
        	{
            	when
            	{
                	expression {return params.PROMOTE}
            	}
            	steps
            	{
            	 	echo "Publikowanie projektu..."
            	 
                	sh 'rm -rf /var/jenkins_home/workspace/ro_artifacts9'
                	sh 'mkdir /var/jenkins_home/workspace/ro_artifacts9'
                	sh 'chmod -R 777 /var/jenkins_home/workspace/ro_artifacts9'
                	sh 'docker rm -f ro_publish || true'
                	sh 'docker run -d --name ro_publish --mount type=volume,src="volume_output",dst=/usr/local/ro_project --mount type=bind,source=/var/jenkins_home/workspace/ro_artifacts9,target=/usr/local/ro_copy node bash -c "chmod -R 777 /usr/local/ro_project && chmod -R 777 /var/jenkins_home/workspace/ro_artifacts9 && cp -R /usr/local/ro_project/. /usr/local/ro_copy"'
                	sh "tar -zcvf cytoscape_${params.VERSION}.tar.xz -C /var/jenkins_home/workspace/ro_artifacts9 ."
                	archiveArtifacts artifacts: "cytoscape_${params.VERSION}.tar.xz"
                
                	echo "Publikowanie zakończone"
                
            	}
        	}
```




* Clean:

Krok `Clean` został utworzony w celu uporządkowania skryptu aby był bardziej przejrzysty. W sekcji tej następuje ogólne czyszczenie projektu po zakończonej najważniejszej pracy. Znajdują się tutaj polecenia do usuwania kolejnych kontenerów: `ro_build`, `ro_test`, `deploy_container` oraz `ro_publish`. Zabieg ten zapobiega nadpisywaniu się danych. 

```
stage('Clean')
		{
			steps
			{
				sh '''
				echo "Czyszczenie projektu..."
				
				docker rm -f ro_build || true
                docker rm -f ro_test || true
                docker rm -f deploy_container || true
                docker rm -f ro_publish || true
				
				echo "Czyszczenie zakończone"
				'''
			}
		}
        
        
	}
```




Na samym końcu pipline'u znajduję się fragment skryptu odpowiedzialny za wypisanie wiadomości `Pipeline zakończony sukcesem!` jeżeli wszystkie wcześniejsze kroki przejdą pomyślnie lub `Pipeline zakończony z błędem!` jeżeli którykolwiek krok zakończył się niepowodzeniem. 

```
post 
{
    success 
        {
            echo 'Pipeline zakończony sukcesem!'
        }
    failure 
        {
            echo 'Pipeline zakończony z błędem!'
        }
}
``` 




### 5. Uruchomienie projektu.

Aby przetestować działanie projektu należy uruchomić projekt za pomocą `Uruchom z parametrami`, następnie pojawi się okienko z domyślnymi wartościami parametrów. Domyślnie parametr `VERSION` ustawiony jest na 1.0.0, a parametr `PROMOTE` jest zanznaczony, natomiast przy każdym uruchomieniu projektu jesteśmy zmieniać wartości parametrów. 

![img](parametry.PNG)

Po ustawieniu wartości parametrów i wciśnięciu przycisku `Buduj` ukaże się status każdego kroku w pipeline. W tym przypadku każdy z etapów projektu został podświetlony kolorem zielonym, a więc można stwierdzić, że projekt działa poprawnie. Dla przetestowania projekt został uruchomiony kilkukrotnie. Na samej górze istnieje ikona spakowanej nowej wersji programu `cytoscape_1.0.0.tar.xz`, która powstała poprzez uruchomienie projektu i jest gotowa do pobrania.

![img](uruchomienie1.PNG)




### 6. Diagram przepływu czynności w ramach pipeline'u.

![img](diagram_screen.PNG)
