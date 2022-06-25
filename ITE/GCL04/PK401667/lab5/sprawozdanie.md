Sprawozdanie z wykonania projektu z Metodyk DevOps
Wykonał: Piotr Kulis GCL.04

    CEL:
      celem projektu było przygotowania pipline, odpalanego w oparciu o jnkinsfile i zwracającego konretny plik wykonywalny.
      
Do uruchomienia piplina został wykorzystany plik jenkinsfile umieszczony na repozytorium MDO2022_S. Zawierał on 5 stagw-ów

1. Clone - odpowiada on za stworzenie kontenera na który zostanie sklonowane repo z projektem. 
      Do tworzonego kontenera tworzone są również odpowiednie voluminy.
              sh "docker system prune --all -f"
              sh 'docker volume  create --name repo_vol'
              sh 'docker volume  create --name build_vol'
              sh "docker build -t clone . -f ./ITE/GCL04/PK401667/lab5/docker_clone"
              sh "docker run -v repo_vol:/Guess-Word-Game clone"  
              
      Użyty tu dockerfile docekr_clone prezentuje się następująco:
              FROM debian:latest

              RUN apt update
              RUN apt install -y git

              RUN git clone https://github.com/LondonJim/Guess-Word-Game.git
              
2. Build - odpowiada on za stworzenie kontenera który w którym będzie bulid projektu.
            Oba uzyte polecenia przedstawiają podstawową procedurę, utworzenie obrazu a następnie uruchomienie kontenera.
               sh 'docker build -t build . -f ./ITE/GCL04/PK401667/lab5/docker_build'
               sh 'docker run --name build_container -v repo_vol:/Guess-Word-Game -v build_vol:/build build'
               
     Użyty tu dockerfile docker_build prezentuje się następująco:
              FROM debian:latest

              RUN apt update
              RUN apt install -y default-jdk gradle

              WORKDIR Guess-Word-Game

              CMD ["sh", "-c", "gradle build &&  cp ./build/libs/guess.jar /build"]
              
3. Test - uruchamia kontener na którym odbywa się test aplikacji
               
               sh 'docker build -t test . -f ./ITE/GCL04/PK401667/lab5/docker_test'
               sh 'docker run --name test_container -v repo_vol:/Guess-Word-Game test'
               
     Użyty tu dockerfile docker_test prezentuje się następująco:
               FROM build

               CMD gradle test
4. Deploy - uruchamia dwa kontenery do dostarczenia testowego i ostatecznego.

               sh 'docker build -t deploy_1 . -f ./ITE/GCL04/PK401667/lab5/docker_deploy'
              
                    script
                    {
                            try 
                            {
                                sh 'docker run --name deploy_container -v build_vol:/build deploy_1'
                            } 
                            catch (Exception e) 
                            {
                                echo 'Exception occurred: ' + "Graphic enviroment is needed to run this app"
                            }

                    }

                

                sh 'docker build -t deploy_final . -f ./ITE/GCL04/PK401667/lab5/docker_deploy_final'
                sh 'docker run --name deploy_container_final -v build_vol:/build deploy_final'

                sh "rm -rf artifact && mkdir artifact"
                sh 'docker cp deploy_container:./build/guess.jar artifact' 

                sh 'docker ps -a'
                
     Oba użyte tu dockerfile prezentują się praktycznie identycznie:
                
                FROM openjdk:11

                CMD java -jar ../build/guess.jar
5. Publish - uruchami kontener na którym voluminie wyjściwoym uzyskujemy gotowy produkt utworzony z użyciem pipelina

                script {
                    if(params.PROMOTE)
                     {
                         
                         sh "mv ./artifact/guess.jar ./artifact/guess_${VERSION}.jar"
                         archiveArtifacts artifacts: "artifact/guess_${VERSION}.jar"

                         sh "ls -a ./artifact"
                    }
                    else {
                        echo "Success, but not promoting to new version! (check button)"
                    }
                }
                
      Ostatecznie zwracany produkt zapisywany jest pod następującą ścieżką (długi nr to nr kontenera jenkins-blueocean)
      
      ![3](3.png "3")
      
      Wszystkie utworzone w czasie realizacji pipelina kontenery:
      
      ![4](4.png "4")
      
      Zakończony pipline:
      
      ![5](5.png "5")
      
      Definicja pipilina:
      
      ![1](1.png "1")
      ![2](2.png "2")
