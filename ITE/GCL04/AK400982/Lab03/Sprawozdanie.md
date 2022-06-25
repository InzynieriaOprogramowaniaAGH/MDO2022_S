# Sprawozdanie z Lab03
### Pobranie bazowego obrazu
```
docker pull node
```
![This is an image](ssy/docker-pull-node.png)

### Uruchomienie kontenera w trybie interaktywnym
```
docker run -it node /bin/bash
```
![This is an image](ssy/docker-run--it.png)

### Sklonowanie repo
![This is an image](ssy/git-clone.png)

### Build projektu
```
npm run build
```
![This is an image](ssy/npm-run-build.png)

### Uruchomienie testów
```
npm run test
```
![This is an image](ssy/npm-run-test.png)

### Build dockerfile

```dockerfile
FROM node
RUN git clone https://github.com/stemmlerjs/simple-typescript-starter.git
WORKDIR /simple-typescript-starter/
RUN npm i && npm run build
```

### Test dockerfile

```dockerfile
FROM starter:latest
WORKDIR /simple-typescript-starter/
RUN npm run test
```

### Zbudowanie obrazów na podstawie obu plików

![This is an image](ssy/docker-build.png)

### Wykazanie, że kontener działa

![This is an image](ssy/docker-run.png)

#### Do wykazania tej części wykorzystałem trzeci dockerfile, który został zbudowany i uruchomiony

```dockerfile
FROM tester:latest
WORKDIR /simple-typescript-starter/
RUN npm run start
```


