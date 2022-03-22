# Szymon Kupka 
## Git, Branches, SSH
sklinowano  repozytorium za pomocą HTTPS
```bash
$ git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
```
![](./https.png)

Utworzono dwa klucze SSH, inne niż RSA, w tym  jeden zabezpieczony hasłem

-klucz bez hasła
```bash
$ ssh-keygen -t ed25519 -f klucz.id
```
![](./klucz1.png)
```bash
$ cat ./klucz.id.pub
```
![](./klucz1_2.png)


-klucz z hasłem
```bash
ssh-keygen -t ecdsa -f kluczyk2.id -C 'klucz z haslem'
```
![](./klucz1.png)
```bash
$ cat ./klucz2.id.pub
```
![](./klucz2_2.png)

Skonfigowano klucz SSH jako metodę dostępu do GitHuba

![](./github_klucz.png)


Sklonano repozytorium z wykorzystaniem protokołu SSH

```bash
$ git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git
```
![](./ssh_clone.png)

Przełączono się na gałąź main, a potem na gałąź grupy oraz utworzono gałąź o nazwie SK403205 
```bash
$ git checkout main
```
```bash
$ git checkout -b SK403205 origin/ITE-GCL07
```
![](./branch.png)

W katalogu grupy utworzono nowy katalog, także o nazwie SK403205
W nim także utworzono katalog: Lab01
![](./directory.png)


W nowym katalogu dodano pliki ze sprawozdaniem za pomocą `git add .`
![](./git_add.png)

Stworzono komit z komentarzem
![](./commit.png)

Zmieniono URL z HTTPS na SSH
Wysłano zmiany do zdalnego repozytorium za pomocą `git push`.
![](./push.png)





