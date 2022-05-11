Michał Zając - sprawozdanie DevOps z lab_01

> Zainstalowałem na maszynie wirtualnej OpenSSH, dzięki któremu mogłem łączyć się między komputerem a maszyną wirtualną. Pod spodem zrzut ekranu dokumentujący działającą usługę ssh.

![plot](./screeny/after_installing_ssh.png)

> Wygenerowałem następnie na wirtualce klucz ssh:

![plot](./screeny/keygen.png)

> Po wygenerowaniu klucza przypisałem go do konta na GitHubie:

![plot](./screeny/generated_key.png)

> Następnie za pomocą klienta PuTTy połączyłem się z maszyną wirtualną, korzystając z protokołu ssh:

![plot](./screeny/connection_successful.png)

> Po połączeniu z wirtualką sklonowałem repozytorium do nowego folderu:

![plot](./screeny/clone_repo.png)

> Zmieniłem working directory na nowo utworzony folder i za pomocą komendy git checkout przełączyłem się na brancha main, a później ITE-GCL08. W tym branchu utworzyłem nowego brancha MZ402779:

![plot](./screeny/folder_structure.png)

> W swoim osobistym branchu stworzyłem nowy folder o takiej samej nazwie jak mój branch, a w nim został stworzony folder Lab_01. Dodatkowo w tym folderze stworzyłem sprawko oraz folder na screenshoty:

![plot](./screeny/stworzenie_sprawka.png)

> Utworzono pull requesta:

![plot](./screeny/pull_request.png)
