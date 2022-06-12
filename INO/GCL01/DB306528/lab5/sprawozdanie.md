##DevOps Sprawozdanie 05



Instalacja Jenkins na podstawie https://www.jenkins.io/doc/book/installing/docker (ostatnie sprawozdanie. DIND (Docker-in-Docker) to kontener uruchomiony w innym kontenerze. Dzięki temu wewnętrzny kontener jest w stanie budować kontenery oraz je uruchamiać.

Najpierw uruchamiam oba kontenery:

DIND:
![DIND](01 start dind.png)

Kontener z Jenkinsem:
![JENKINS](02 start jenkins.png)

Sprawdzenie czy kontenery działają poprawnie **sudo docker ps**:
![docker ps](03 ps.png)

Pliki *Dockerfile* oraz plik *Jenkinsfile* zostaną zawarte w katalogu "lab05files" w repozytorium na mojej gałęzi.
![Jenkinsfile and Dockerfiles](04 Jen n DF.png)

Oczywiście z powodu mojej beznadziejnej pamięci, zapomniałem hasła do Jenkinsa, więc dodatkowo wykonałem procedurę wyłączenia zabezpieczeń, resetowania hasła i ponownego ustawienia potrzeby logowania.

Następnie stworzyłem obiekt projektowy pipeline i odpowiednio go skonfigurowałem. Najpierw zaznaczyłem opcję parametryzacji i ustawiłem 2 parametry- *Name*, oraz *Version*
![Name and Version](05 name&ver.png)

Następnie konfiguruję SCM ustawiając URL repozytorium, odpowiedni branch w tym repozytorium oraz ścieżkę do Jenkinsfile'a
![pajplajn1](06 pajplajn1.png)
![pajplajn2](07 pajplajn2.png)

####BUILD
Tutaj stworzony zostaje obraz builder bazujący na obrazie node. Najpierw następuje sklonowanie repozytorium z projektem nodejs.org, po czym następuje przełączenie na odpowiednią gałąź. Na końcu pobierane są dependencje i tworzą się zbuildowane pliki potrzebne do *npm run build*.
Dockerfile:
![Dockerfile nr 1](08 df1.png)
Fragment Jenkinsfile:
![Fragment Jenkinsfile 1](12 JFbuild.png)

####TEST
Tutaj stworzony zostaje obraz tester, którego zadaniem jest przeprowadzenie testów co do poprawności działania programu.
Dockerfile:
![Dockerfile nr 2](09 df2.png)
Fragment Jenkinsfile:
![Fragment Jenkinsfile 2](13 JFtest.png)

####DEPLOY
Tutaj uruchamiany jest obraz builder, oraz następuje podłączenie woluminu, na który skopiowane zostają foldery *en* oraz *static* zawierające potrzebne pliki. W kroku tym pliki z buildera zostają wyciągnięte z użyciem woluminu. Następnie tworzony jest obraz deploy, którego celem jest hostowanie aplikacji. Obraz opiera się o *nginx*. Aby wszystko działało poprawnie kopiuje folder build do woluminu, a zawartość folderów *en* i *static* do */usr/share/nginx/html*. Przekierowuje porty na 3000 by móc otworzyć stronę przez localhost.
Dockerfile:
![Dockerfile nr 3](10 df3.png)
Fragment Jenkinsfile:
![Fragment Jenkinsfile 3](14 JFdeploy.png)

####PUBLISH
Tutaj ma miejsce publikacja programu. Zeby to nastąpiło poprzednie kroki (build, test i deploy) muszą przebiec pomyślnie. Projekt nodejs nie wymaga instalatora, ponieważ zbuildowane pliki od razu są gotowe do wrzucenia i hostowania w kontenerze. Z racji problemów z publikacją, build został spakowany do pliku archive.tar.xz w celu uproszczenia przenośności.
Dockerfile:
![Dockerfile nr 4](11 df4.png)
Fragment Jenkinsfile:
![Fragment Jenkinsfile 4](15 JFpublish.png)

Sprawdziłem czy w kontenerze Jenkinsa znajduje się powstałe archiwum:
![Sprawdzenie archiwum](16 sprawdzenie archiwum.png)

Logi:
-Start:
![pipeline1](17 pipeline1.png)

-Build
![pipeline2](18 pipelinebuild1.png)
![pipeline3](19 pipelinebuild2.png)

-Test
![pipeline4](20 pipelinetest.png)

-Deploy
![pipeline5](21 pipelinedeploy.png)

-Publish
![pipeline6](22 pipelinepublish.png)

Stage view:
![pipeline7](23 pipeline stageview.png)