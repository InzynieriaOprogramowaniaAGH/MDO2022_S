# Lab03
### uruchomienie kontenera

![ss1](./SCREENSHOTS/docker_run.png)

### podłączenie się do kontenera

![ss2](./SCREENSHOTS/docker_attach.png)

### pobranie na kontener git'a z wczesniejszym updatem managera pakietów

![ss3](./SCREENSHOTS/apt-get_update.png)

### instalacja npm oraz innych wymaganych pakietów

Do tego podpunktu brakuje screenshotów, przez długi output konsoli
```console
apt-get install npm
```

### pobranie repozytorium

![ss4](./SCREENSHOTS/git_clone_text.png)

Link do Repozytorium
```
https://github.com/watson-developer-cloud/text-to-speech-nodejs
```

przejscie do katalogu repozytorium i uruchomienie w nim komendy

```console
npm install
```

### uruchomienie testów

```console
npm test
```
![ss5](./SCREENSHOTS/npm_test.png)

### napisanie pliku DockerFile

```DockerFile
FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install git -y
ENV Z=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$Z /etc/localtime && echo $Z > /etc/timezone
RUN apt-get install npm -y
RUN git clone https://github.com/watson-developer-cloud/text-to-speech-nodejs
WORKDIR "./text-to-speech-nodejs"
RUN npm install
```

![ss6](./SCREENSHOTS/Docker_file.png)

![ss7](./SCREENSHOTS/build_succes.png)

### stworzenie dockerFile bazujacego na wczesniej stworzonym obrazie uruchamiającego same testy

```DockerFile
FROM bigchad:latest
WORKDIR "./text-to-speech-nodejs"
RUN npm test
```

![ss8](./SCREENSHOTS/based_build_test.png)

Testy uruchamiają się jednak nie przechodzą przez brak połączenia z serwerami. Występuje nie tylko w dockerze.
