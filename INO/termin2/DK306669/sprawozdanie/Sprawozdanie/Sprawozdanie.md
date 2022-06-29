# Projekt zaliczeniowy 1
## Metodyki DevOps
### Dawid Kosior - 306669
---

## Proces przebiegu tworzenia Pipeline'u

### Przygotowania

W celu prawidlowego wyprowadzenia portu TCP, ze srodowiskiem testowym, sforkowalem repozytorium "nodejs.org" dostępne w poniższym linku:

https://github.com/nodejs/nodejs.org

Licencja zezwala na dowolne operowanie plikami i wyglada nastepujaco:

The original contents of the nodejs.org repo are licensed for use as follows:

"""
Copyright Node.js Website WG contributors. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to
deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
"""

### Budowa

Sklonowałem sforkowane repo, a następnie dokonałem instalacji niezbednych pakietow:

![screen1](1.jpg)
![screen2](2.jpg)
![screen3](3.jpg)

Jak widać aplikacja prawidłowo się zbudowała:

![screen4](4.jpg)
![screen5](5.jpg)

### Testy

Wybrana przeze mnie aplikacja posiada gotowe do uzycia testy. Jak widac, proces testowania nie napotkal zadnych problemow:

![screen6](6.jpg)
![screen7](7.jpg)

### Konteneryzacja wraz z wdrozeniem

Dla spokoju ducha, projekt przeprowadzilem na swiezej instalacji systemu ubuntu. Wszelkie kroki z instalacji niezbednych pakietow (np. docker), pomijam. Z repozytorium dostepnych dockerowych narzedzi, pobieram node'a i klonuje repozytorium.

![screen8](8.jpg)
![screen9](9.jpg)

Nastepnym krokiem jest instalacja narzędzi, build, a także przeprowadzenie testow:

![screen10](10.jpg)
![screen11](11.jpg)
![screen12](12.jpg)
![screen13](13.jpg)

Kolejnym waznym krokiem we wdrozeniu aplikacji, jest utworzenie dockerfiles, na podstawie ktorych dokonywana bedzie budowa, testy, deploy i publish.

![screen16](16.jpg)
![screen17](17.jpg)
![screen14](14.jpg)
![screen15](15.jpg)

![screen18](18.jpg)
![screen19](19.jpg)

Do prawidlowej operacji nad kontekstem aplikacji, szczegolnie przy kroku wdrozenia (deploy na nginxie - z uwagi na aplikacje webowa), utworzone zostaly nastepujace woluminy:

![screen20](20.jpg)

Ostateczne pliki dockerowe i Jenkinsowe wygladaja nastepujaco:

![screen23](23.jpg)
![screen24](24.jpg)
![screen25](25.jpg)
![screen26](26.jpg)

Po wielu probach, w koncu udalo mi sie pozytywnie przejsc caly pipeline wdrozeniowy. Mialem sporo problemow z odpowiednim zastosowaniem woluminu, szczegolnie podczas kroku deployu, ale finalnie po 5635734347 probie, udalo mi sie. :) Mialem tez sporo problemow z prawidlowa konfiguracja pakietow npm, a mianowicie problematyczna okazala sie kompatybilnosc z aplikacja i srodowiskiem pracy.

![screen21](21.jpg)

Uwazam ze program nie powinien w zarchiwzowanej wersji produkcyjnej, zawierac logow z builda, gdyz koncowemu klientowi, nie jest to do niczego potrzebne. Powinien on dostac ostateczna wersje produktu, w pelni dzialajaca o odpowiednim numerze wersji.

### Komendy
Ponizej udostepniam uzyte komendy, ktore moglby nie zostac uwiecznione print screenowa migawka.

```bash
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf ~/.npm
sudo apt-get curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/dawid/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew uninstall --force node
brew install node

npm install eslint-plugin-n@latest --save-dev

sudo docker pull node
Inside docker:
sudo docker run --interactive --tty node sh
git clone.....
npm install
npm start
npm run build

sudo systemctl start jenkins
sudo systemctl status jenkins
```

### Diagram aktywnosci i wdrozenia
![diag1](diag1.jpg)
![diag2](diag2.jpg)

### Logi
```
Started by user Dawid Kosior
Obtained INO/termin2/DK306669/Jenkinsfile from git https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Pipeline
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
The recommended git tool is: git
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/Pipeline/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git # timeout=10
Fetching upstream changes from https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
 > git --version # timeout=10
 > git --version # 'git version 2.25.1'
 > git fetch --tags --force --progress -- https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git +refs/heads/*:refs/remotes/origin/* # timeout=90
 > git rev-parse refs/remotes/origin/DK306669_termin2^{commit} # timeout=10
Checking out Revision 578f6c8a6e5a2cb696895dab9958d2acb8fb892b (refs/remotes/origin/DK306669_termin2)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 578f6c8a6e5a2cb696895dab9958d2acb8fb892b # timeout=10
Commit message: "dziala"
 > git rev-list --no-walk 65454a1e9245f20a235682a53bec9f5ce4e5eeff # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] echo
BUILD
[Pipeline] git
The recommended git tool is: git
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/Pipeline/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git # timeout=10
Fetching upstream changes from https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
 > git --version # timeout=10
 > git --version # 'git version 2.25.1'
 > git fetch --tags --force --progress -- https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/DK306669_termin2^{commit} # timeout=10
Checking out Revision 578f6c8a6e5a2cb696895dab9958d2acb8fb892b (refs/remotes/origin/DK306669_termin2)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 578f6c8a6e5a2cb696895dab9958d2acb8fb892b # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D DK306669_termin2 # timeout=10
 > git checkout -b DK306669_termin2 578f6c8a6e5a2cb696895dab9958d2acb8fb892b # timeout=10
Commit message: "dziala"
[Pipeline] dir
Running in /var/lib/jenkins/workspace/Pipeline/INO/termin2/DK306669
[Pipeline] {
[Pipeline] sh
+ docker build . -f build.dockerfile -t builder
Sending build context to Docker daemon  8.704kB
 
Step 1/5 : From node:latest
 ---> 057129cb5d6f
Step 2/5 : RUN git clone https://github.com/DawidKosior/nodejs.org.git
 ---> Using cache
 ---> f118fd604d7d
Step 3/5 : WORKDIR /nodejs.org/
 ---> Using cache
 ---> 66004224292f
Step 4/5 : RUN npm install
 ---> Using cache
 ---> ae0546a872ab
Step 5/5 : RUN npm run build
 ---> Using cache
 ---> 4fcee3633ff1
Successfully built 4fcee3633ff1
Successfully tagged builder:latest
[Pipeline] }
[Pipeline] // dir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Tests)
[Pipeline] echo
TESTS
[Pipeline] dir
Running in /var/lib/jenkins/workspace/Pipeline/INO/termin2/DK306669
[Pipeline] {
[Pipeline] sh
+ docker build . -f test.dockerfile -t tester
Sending build context to Docker daemon  8.704kB
 
Step 1/3 : FROM build1:latest
 ---> 4fcee3633ff1
Step 2/3 : WORKDIR /nodejs.org/
 ---> Using cache
 ---> 36a521d74428
Step 3/3 : RUN npm run test
 ---> Using cache
 ---> 3d80ca4d26cb
Successfully built 3d80ca4d26cb
Successfully tagged tester:latest
[Pipeline] }
[Pipeline] // dir
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy)
[Pipeline] echo
DEPLOY
[Pipeline] sh
+ docker run --volume /var/jenkins_home/workspace/PipeLine/INO/termin2/DK306669:/build builder mv -n build /build
[Pipeline] dir
Running in /var/lib/jenkins/workspace/Pipeline/INO/termin2/DK306669
[Pipeline] {
[Pipeline] sh
+ docker build . -f deploy.dockerfile -t deployer
Sending build context to Docker daemon  8.704kB
 
Step 1/4 : FROM nginx:stable-alpine
 ---> c232c77bc4b8
Step 2/4 : FROM build1:latest
 ---> 4fcee3633ff1
Step 3/4 : WORKDIR /nodejs.org/
 ---> Using cache
 ---> 36a521d74428
Step 4/4 : RUN ls
 ---> Using cache
 ---> 79721930e145
Successfully built 79721930e145
Successfully tagged deployer:latest
[Pipeline] }
[Pipeline] // dir
[Pipeline] sh
+ docker run --volume /var/jenkins_home/workspace/PipeLine/INO/termin2/DK306669/build:/build -d -p 3000:80 deploy
1719e1fec97ca4210252723404a0a8f04de0bdf0f4b59dde5309ea7030dcad59
[Pipeline] sh
+ docker ps -a -q
+ docker stop 1719e1fec97c 7209c7fde43f 132728579ca5 f827d79dd144 3545b05e8dfc 408b81b90964 5438fb461885 3386f2066974 a36c99e37034 ff77492abf88 0ac3318a7487 f6adc6c733fc f0384c080a3d b377ad08a260 b5c2d02d4a88 ec26359c2f7a d5ae745b315a 488a1e20a7f4 2843c44a6a8a c69aaaf0bddf 04d26bb92e71 a9c81dc652e4 2928b442b5ec 14a3276a03c2 7fca20125277 11b5189dca5a 27398005db58 572ccc49df13 f92ab9c85aa8 3b8a5503bc43 840eff863204 ddb171f41f2e c4037449bc5b 255adc4cebed de5a307149ab 828d1d118b63 e28e644bf1c9 093af5f54b99 d5c0e2e13f87 a7b4d86f9cd8 ac203ebc2d1e 00ad77de9b07 cc2241443a26 e08e742d0b11 bb104364451d 12e8ae55c320 c2bb2759c968 d2914661cf75 9ab6c791a08f 68add50d0660 c6bdefda7256 1e8aa6131961 2c570a93ea5b 0617a9bdf4e5 8a95cf0eeec6 4ad5e63114ba
1719e1fec97c
7209c7fde43f
132728579ca5
f827d79dd144
3545b05e8dfc
408b81b90964
5438fb461885
3386f2066974
a36c99e37034
ff77492abf88
0ac3318a7487
f6adc6c733fc
f0384c080a3d
b377ad08a260
b5c2d02d4a88
ec26359c2f7a
d5ae745b315a
488a1e20a7f4
2843c44a6a8a
c69aaaf0bddf
04d26bb92e71
a9c81dc652e4
2928b442b5ec
14a3276a03c2
7fca20125277
11b5189dca5a
27398005db58
572ccc49df13
f92ab9c85aa8
3b8a5503bc43
840eff863204
ddb171f41f2e
c4037449bc5b
255adc4cebed
de5a307149ab
828d1d118b63
e28e644bf1c9
093af5f54b99
d5c0e2e13f87
a7b4d86f9cd8
ac203ebc2d1e
00ad77de9b07
cc2241443a26
e08e742d0b11
bb104364451d
12e8ae55c320
c2bb2759c968
d2914661cf75
9ab6c791a08f
68add50d0660
c6bdefda7256
1e8aa6131961
2c570a93ea5b
0617a9bdf4e5
8a95cf0eeec6
4ad5e63114ba
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Publish)
[Pipeline] echo
PUBLISH
[Pipeline] dir
Running in /var/lib/jenkins/workspace/Pipeline/INO/termin2/DK306669
[Pipeline] {
[Pipeline] sh
+ docker build . -f publish.dockerfile -t publisher
Sending build context to Docker daemon  8.704kB
 
Step 1/3 : FROM builder:latest
 ---> 4fcee3633ff1
Step 2/3 : WORKDIR /nodejs.org/
 ---> Using cache
 ---> 36a521d74428
Step 3/3 : RUN tar cfJ archive.tar.xz build
 ---> Using cache
 ---> 730cdd68a83a
Successfully built 730cdd68a83a
Successfully tagged publisher:latest
[Pipeline] }
[Pipeline] // dir
[Pipeline] sh
+ docker run --volume /var/jenkins_home/workspace/PipeLine/INO/termin2/DK306669:/Archive publisher mv archive.tar.xz /Archive
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
