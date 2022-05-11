# Michał Wojdyła 401139

## Zachowywanie stanu
<br/>

 ### Utworzenie dwóch woluminów:

 ![Volumes_create](./volumes_create.png)

 
 ### Utworzenie kontenera node + podpięcię do niego wolumniów (wejściowy i wyjściowy):

 ![Create_container](./create_container.png)

 <br/>
 
 ### Sklonowanie repozytorium projektu node'owego:

 ![Clone_repo](./clone_repo.png)

 <br/>

 ### Zawartość woluminu:
 
 ![Vol_content_1](./vol_content_1.png)

 <br/>

 ### Zawartość woluminu z poziomu kontenera node:
 
 ![Vol_content_1](./vol_content_2.png)

 <br/>
 
 ### Zbudowanie projektu:
 
 ![Npm_i](./npm_i.png)
 ![Build](./build.png)

 <br/>

 ### Skopiowanie zbudowanego projektu do wyjściowego woluminu:
 
 ![Copy](./copy.png)

<br/>
<br/>

 ## Zachowywanie stanu
<br/>

 ### Zainstalowanie iperf3 oraz net-tools w kontenerze:
 
 ![Install_iperf](./install_iperf.png)
 ![Install_net_tools](./install_net_tools.png)

 <br/>

 ### Zainstalowanie iperf3 na hoście oraz sprawdzenie połącznenia między kontenerami:
 
 ![Connection](./connection.png)

 <br/>

 ### Utworzenie nowego kontenera z opcją --publish oraz sprawdzenie połączenia między kontenerem a komupterem (pominięto połączenie z hostem, gdyz nie uzywam maszyny wirtualnej):
 
 ![Connection_pc](./connection_pc.png)

 #### Najszybsze połączenie było pomiędzy kontenerami, o wiele większe niz pomiędzy kontenerem a komuptuerem. Mogło być to spowodowane problemami sieciowymi.
 
 <br/>
 <br/>

 ## Instalacja jenkins
 <br/>

 ### Utworzenie sieci mostkowanej w Dockerze:
 
 ![Jenkins](./jenkins.png)
 
 <br/>

 ### Pobranie obrazu docker:dind i uruchomienie:
 
 ![Dind](./dind.png)
 
 <br/>

 ### Utworzenie obrazu na bazie dockerile:

 `FROM jenkins/jenkins:2.332.1-jdk11`

 `USER root`

`RUN apt-get update && apt-get install -y lsb-release`

`RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \`
  `https://download.docker.com/linux/debian/gpg`

`RUN echo "deb [arch=$(dpkg --print-architecture) \ `
  `signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \`
  `https://download.docker.com/linux/debian \ `
  `$(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list`

`RUN apt-get update && apt-get install -y docker-ce-cli`

`USER jenkins`

`RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"`
 
 ![Jenkins_build](./jenkins_build.png)
 
 <br/>

  ### Uruchomienie kontenera jenkins:
 
 ![Jenkins_run](./jenkins_run.png)
 
 <br/>

  ### Wyświetlenie logów (dostęp do hasła admina):
 
 ![Logs](./logs.png)
 
 <br/>

 ### Ekran logowania Jenkins:
 
 ![Jenkins_logging](./jenkins_logging.png)
 
 <br/>

 
 

