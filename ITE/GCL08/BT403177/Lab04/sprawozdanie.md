# Sprawozdanie Lab04
## Zachowanie stanu na volumenie

### 1. utworzenie wolumenów

![s1](./SCREENSHOTS/volume_create.png)

```bash
sudo docker volume create input
sudo docker volume create output
```

### 2. Uruchomienie kontenera z podpiętymi wolumenami

![s2](./SCREENSHOTS/build_on_volume.png)

```bash
sudo docker run --name lab4_2 --mount 'type=volume,src=input,dst=\input' \
    --mount 'type=volume,src=output,dst=\output' -it ubuntu
```

### 3. Sklonowanie repozytorium git na wolumen wejściowy

![s3](./SCREENSHOTS/clone_to_volu.png)

Z poziomu hosta dockera uruchomienie komendy
```bash
sudo mkdir /var/lib/docker/volumes/input/_data/text-to-speech-nodejs && sudo git clone 
```

### 4. plik repozytorium znajduje sie na wolumenie

![s4](./SCREENSHOTS/mount_show_repo.png)

### 5. Kopiowanie plikow repozytorium na wolumin wyjsciowy oraz zbudowanie projektu

![s5](./SCREENSHOTS/install_succes.png)

### 6. Potwierdzenie istenienia projektu w volume output

![s6](./SCREENSHOTS/build_on_volume.png)

## Połączenie z kontenerem

### 1. Pobranie iperf3 oraz net-tools

![s7](./SCREENSHOTS/install_iperf3.png)

### 2. Uruchomienie servera iperf3  na porcie 2000

```bash
sudo iperf3 -s -p 2000
```

### 3. Uruchomienie testu połączenia kontener - kontener

![s8](./SCREENSHOTS/con-con-test.png)

### 4. Uruchomienie testu połączenia host - kontener

![s9](./SCREENSHOTS/vm-container-test-con-result.png)

### 5. Uruchomienie testu win - kontener

Pierwsze podejscie wyswietla błąd:

![s10](./SCREENSHOTS/win-con-issue.png)

Należy najpierw opublikować porty kontenera:

![s11](./SCREENSHOTS/port_publish.png)

odbywa się to z pomocą flagi <code> --publish port:port </code>

Sprawdzenie nasłuchujących usług na hoscie dockera (VM)

![s12](./SCREENSHOTS/listen-deamons.png)

Nastepna próba połączenia z kontenerem:

![s13](./SCREENSHOTS/win-con-pass.png)

## Instalacja instancji Jenkins

### 1. Stworzenie sieci na hoscie

![s14](./SCREENSHOTS/network_create.png)

### 2. Uruchomienie docker run

![s15](./SCREENSHOTS/docker_jenkins_run.png)

### 3. Stworzenie dockerfile

```Dockerfile
FROM jenkins/jenkins:2.332.1-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
```

### 4. Docker build jenkins

![s16](./SCREENSHOTS/docker_build_jenkins.png)

### 5. Wywolanie docker run Jenkins jako dzialająca usługa z udostępnionymi portami

![17](./SCREENSHOTS/docker_run_jenkins_build.png)

### 6. Działający Jenkins

#### Ekran startowy

![s18](./SCREENSHOTS/jenkins_activate.png)

#### Hasło w logach - instrukcje jak na ekranie startowym

![s19](./SCREENSHOTS/jenkins_pass.png)

#### Działający Jenkins Panel użytkownika

![s20](./SCREENSHOTS/jenkins_working.png)
