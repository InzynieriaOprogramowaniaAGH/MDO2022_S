### Anna Godek
# Sprawozdanie 
# Laboratorium 1
[1] Klient Git oraz obsługa kluczy SSH zostały zainstalowane już wcześniej za pomocą komendy: 
```bash
		$ sudo apt install git
```

![gitSSH](gitSSH.png)

[2] Sklonowano repozytorium za pomocą HTTPS.
```bash
		$ git clone https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git
```

![gitCloneHTTPS](gitCloneHTTPS.png)

[3] Wygenerowano nowy klucz SSH.
```bash
		$ ssh-keygen -t ed25519 -f kluczyk.id
```

![key1](key1.png)

Wygenerowano również klucz SSH zabezpieczony hasłem
```bash
		$ ssh-keygen -t ed25519 -C annagodek@student.agh.edu.pl
```

![passwordKey](passwordKey.png)

Następnie skopiowano i dodano klucz publiczny do konta na githubie. 

![gitHubAdd](gitHubAdd.png)
![keyAdded](keyAdded.png)

Sprawdzono połączenie i sklonowano repozytorium z wykorzystaniem protokołu SSH.
```bash
		$ ssh -T git@github.com
		$ git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git
```

![connected](connected.png)
![cloneSSH](cloneSSH.png)

[4] Przełączono sie na gałąź main a następnie na gałąź swojej grupy.
```bash
		$ git checkout main
		$ git checkout INO-GCL01
```

![toMain](toMain.png)   
![toINO](toINO.png)

[5] Utworzono gałąź o nazwie AG401570.
```bash
		$ git checkout -b AG401570
```

![myOwnBranch](myOwnBranch.png)

[6] W katalogu wlaściwym dla grupy utworzono nowy katalog o nazwie AG401570 a w nim katalog Lab01.
![folders](folders.png)

Dodano do folderu sprawozdanie i stworzono commit.
```bash
		$ git commit -m "lab1"
```

![gitAddiCommit](gitAddiCommit.png)

Wysłano zmiany do zdalnego źródła.
```bash
		$ git push --set-upstream  origin AG401570
```

![merge](merge.png)