# Sprawozdanie Lab nr 1

## 1. Instalacja klienta git i kluczy SSH

Pracowałem na linuxie zainstalowanym bezpośrednio na moim PC. Git był zainstalowany już wcześniej.

```
sudo apt install git
```

![Git](7.png)

Ponieważ nie jest to maszyna wirtualna nie łączyłem się przez SSH, a jedynie korzystałem domyślnego emulatora terminalu.

## 2. Skolonowanie repozytorium

Utworzono dwa klucze SSH.

Pierwszy bez passphrase oraz z domyślną nazwą

![FirstKey](9.png)

oraz drugi zabezpieczony z nazwą `second_key`

![SecondKey](sec.png)

```
ssh-keygen -t ed25519 -C "kubask03@gmail.com"
```

Następnie uruchamiany został ssh agent oraz pierwszy klucz został dodany.

![SSHAgent](10.png)

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Klucz dodany do SSH agenta został, także dodany na stronie Githuba.

Na koniec repozytorium zostało sklonowane przy użyciu protokołu SSH.

![Clone](1.png)

```
git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git
```

## 3. Tworzenie gałęzi

Na wstępie przełączono się na gałąź `main`.

![CheckoutMain](2.png)

```
git checkout main
```

Następnie utworzono gałąź, która odgałęzia się od gałęzi mojej grupy.

![CheckoutGroup](pop.png)
![CheckoutMyBranch](4.png)


```
git checkout ITE-GCL04
git checkout -b JS400219
```

## 4. Praca na utworzonej gałęzi

Utworzono potrzebne katalogi

![Directories](5.png)

```
mkdir JS400219
cd JS400219/
mkdir Lab01
cd Lab01/
```

Utworzono commit zawierający wszystkie pliki, które wcześniej nie istniały na gałęzi z wiadomością `Init`

![Commit](11.png)

```
git add .
git commit -m "Init"
```

i wysłano zmiany do zdalnego źródła

![Push](12.png)

```
git push --set-upstream origin JS400219
```

Następnie spróbowano wciągnąć moją gałąź do gałęzi grupowej. W tym celu najpierw zmieniono aktualną gałąź na gałąź grupową (`ITE-GCL04`)

![CheckoutGroup](13.png)

```
git checkout ITE-GCL04
```

oraz wcalono moją gałąź

![Merge](14.png)

```
git merge JS400219
```

Wykonane operacje zostały udokumentowane oraz dodane w kolejnym commicie.

![Checkout](15.png)

![Push](16.png)

```
git checkout JS400219
git add .
git commit -m "Added 2 screenshots"
git push
```

