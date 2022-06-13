# Michał Wojdyła 401139

## Przygotowanie pipeline

<br/>

### Kontenery Jenkins oraz DIND które są niezbędne do utworzenia pipelnie na Jenkinsie:

![Containers](./containers.png)

<br/>

### Pliki Dockerfiles potrzebne do zbudowania kontenerów:

![Dockerfile_b](./dockerfile_build.png)

![Dockerfile_t](./dockerfile_test.png)

![Dockerfile_p](./dockerfile_publish.png)

#### Pliki dockerfile są zamieszczone na repozytorium przedmiotu w ściezce ITE/GCL08/MW401139 na branchu MW401139

 <br/>
 
 ### Skonfigurowany pipeline na Jenkis:

![Jenkins_1](./jenkins_1.png)

![Jenkins_2](./jenkins_2.png)

#### Skrypt Jenkinsfile jest pobierany z repozytorium o podanym url z wybranego przez nas brancha. Na dole ustawiliśmy ścięzkę do skryptu.

<br/>

### BUILD

#### W kroku build tworzę kontener na bazie node za pomocą pliku docker_build. W kontenerze następuje sklonowanie repozytorium, ustawienie katalogu roboczego, oraz zainstalowanie zaleźności i utworzenie builda.

![Build](./build.png)

<br/>

### TEST

#### W kroku test tworzę kontener na bazie na bazie kontenera budującego (w moim przypadku node-red_build) oraz uruchamiam w nim komendę npm run test która przeprowadza testy.

![Test](./test.png)

<br/>

### DEPLOY

#### W kroku deploy wysyłam obraz do swojego dockerhuba: mihaf70/node-red-devops-deploy

![Deploy](./deploy.png)

<br/>

### PUBLISH

#### W kroku publish tworzę kontener na bazie na bazie kontenera budującego (w moim przypadku node-red_build) oraz pakuje katalog node-red do pliku archive.tar.xz. Następnie, przy uzyciu woluminu, w ściezce /var/jenkins_home/workspace/node-red-pipeline dopisuje do nazwy pliku wersję oraz archiwuizuje plik aby był widoczny na Jenkinsie.

![Publish](./publish.png)

<br/>

### PIPELINE

#### Na Jenkinsie jest zamieszczony artefakt z ostatniego builda z wybraną przez nas wersją.

![Pipe_1](./pipe_1.png)

![Pipe_2](./pipe_2.png)

![Pipe_3](./pipe_3.png)

<br/>

### LOGI PIPELINE

#### Build

![Build_log](./build_log.png)

#### Test

![Test_log](./test_log.png)

#### Deploy

![Deploy_log_1](./deploy_log_1.png)

![Deploy_log_2](./deploy_log_2.png)

#### Publish

![Publish_log_1](./publish_log_1.png)

![Publish_log_1](./publish_log_2.png)
