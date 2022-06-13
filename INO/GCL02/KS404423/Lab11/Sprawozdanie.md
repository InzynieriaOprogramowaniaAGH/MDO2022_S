# Zajęcia 11 - Kubernetes

---

### Instalacja klastra Kubernetes

Najpierw pobrano wymagane zależności:

```bash
$ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

![image-20220612201915586](Sprawozdanie.assets/image-20220612201915586.png)

Zainstalowano je:

```bash
$ sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

![image-20220612201945241](Sprawozdanie.assets/image-20220612201945241.png)

Instalacja pobranej paczki z internetu za pomocą skryptu odtwarzanego przez roota nie brzmi jak bezpieczna opcja instalacji.

Uruchamiam klaster:

```bash
$ minikube start
```

![image-20220612202409247](Sprawozdanie.assets/image-20220612202409247.png)

Następnie zaopatruję się w polecenie `kubectl`;

```bash
$ minikube kubectl -- get pods -A
```

![image-20220612202504683](Sprawozdanie.assets/image-20220612202504683.png)

Utworzony kontener można wylistować następująco:

```bash
$ docker container ls
```

![image-20220612202602392](Sprawozdanie.assets/image-20220612202602392.png)

Nie miałem żadnych problemów z wymaganiami sprzętowymi, wszystko uruchamiane jest pod WSL2 na Windows 10, mój komputer spełnia podstawowe wymagania spisane w dokumentacji.

Na końcu uruchomiono Dashboard:

```bash
$ minikube dashboard
```

![image-20220612202815451](Sprawozdanie.assets/image-20220612202815451.png)

![image-20220612202830950](Sprawozdanie.assets/image-20220612202830950.png)



### Analiza posiadanego kontenera

Aby wdrożyć się w chmurę, najpierw poczynię lekkie zmiany w swoim Dockerfile dla etapu Deploy:

```dockerfile
FROM node:latest
RUN npm install http-server -g
COPY dist /home/simple-tetris
WORKDIR /home/simple-tetris
RUN  mv ascii-runner-browser.html index.html
ENTRYPOINT ["http-server"]
```

W powyższym zastosowaniu używam paczki `http-server`, żeby zestawić prościutki serwer HTTP do hostowania pliku `ascii-runner-browser.html`. W poprzednich labach łączyłem się z Dockerem przez terminal, więc nie potrzebowałem takiego zastosowania.

Pobieram i wypakowuję artefakt z Jenkinsa oraz umieszczam go w następujący sposób w folderze:

![image-20220613005756707](Sprawozdanie.assets/image-20220613005756707.png)

Następnie przełączam się na daemona Docker z Minikube, aby utworzyć obraz lokalnie, który będzie widoczny w dalszym etapie:

```bash
$ eval $(minikube docker-env)
```

Oraz buduję obraz:

```bash
$ docker build -f ./docker/deploy/Dockerfile -t simple-tetris-deploy .
```

Teraz będzie on widoczny w rejestrze:

```bash
$ docker image ls
```

![image-20220613010103092](Sprawozdanie.assets/image-20220613010103092.png)

Utworzony obraz taguję:

```bash
$ docker tag simple-tetris-deploy simple-tetris:jedyny-sluszny
```

Wdrażam pobrany kontener na stosie k8s:

```bash
$ minikube kubectl run -- simple-tetris --image=simple-tetris:jedyny-sluszny --port=8080 --labels app=simple-tetris
```

![image-20220613003952803](Sprawozdanie.assets/image-20220613003952803.png)

Jak widać pod działa:

```bash
$ minikube kubectl get pods
```

![image-20220613010407454](Sprawozdanie.assets/image-20220613010407454.png)



```bash
$ minikube kubectl -- expose pod/simple-tetris --type=NodePort --port=
8080
```

Następnie tworzę serwis dla aplikacji:

```bash
$ minikube service simple-tetris
```

![image-20220613014133313](Sprawozdanie.assets/image-20220613014133313.png)

Na końcu wyprowadzam port aby przetestować funkcjonalność:

```bash
$ minikube kubectl port-forward simple-tetris 1234:8080
```

I testuję funkcjonalność:

![image-20220613162502106](Sprawozdanie.assets/image-20220613162502106.png)



### Wdrożenie automatyczne

Na końcu gotowy plik wdrożeniowy zapisuję:

```bash
$ minikube kubectl get pod -- simple-tetris -o yaml > simple-tetris-deployment.yaml
```

![image-20220613163113490](Sprawozdanie.assets/image-20220613163113490.png)

Usuwam istniejące wdrożenie:

```bash
$ minikube kubectl delete pod simple-tetris
```

![image-20220613163402512](Sprawozdanie.assets/image-20220613163402512.png)

I testuję wdrożenie z pliku:

```bash
$ minikube kubectl create -- -f simple-tetris-deployment.yaml
```

![image-20220613163414767](Sprawozdanie.assets/image-20220613163414767.png)

![image-20220613163426085](Sprawozdanie.assets/image-20220613163426085.png)