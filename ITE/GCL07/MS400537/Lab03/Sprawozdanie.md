1. Uruchamianie projektu

pobieranie kodu
`git clone git@github.com:vuejs/pinia.git`

pobieranie menedzera pakietu
`apt install yarn`

pobieranie dependency
`yarn install`

budowanie projektu
`yarn build`

testowanie projektu
`yarn test`

2. Uruchamianie projektu w containerze

pobranie wlasciwego obrazu
`docker pull ubuntu`

wlaczenie obrazu w trybie interaktywnym
`docker run --name builder_image -it ubuntu`

_wewnatrz obrazu_

aktualizacja
`apt-get install update`

pobranie niezbednych narzedzi
```
apt-get install git
apt-get install npm
apt-get install curl
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install yarn -y

npm install -g n
n stable
```

klonowanie projektu
`git clone https://github.com/vuejs/pinia.git`

budowanie projektu
```
cd pinia
yarn install
```
testowanie projektu
`yarn install`

3. uruchamianie dockerfile buildera
`docker build -t builder . -f Dockerfile-builder`

4. uruchamianie dockerfile testera
`docker build -t tester . -f Dockerfile-tester`
