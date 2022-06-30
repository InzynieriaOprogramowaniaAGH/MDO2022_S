# Sprawozdanie Lab02
# Szymon Rewilak

## Przebieg ćwiczenia
1. Edytowano plik commit-msg znajdujący się w folderze .git/hooks
Napisano skrypt, który sprawdza poprawność notatki dodawanej w commicie.
Aby można było wykonać commita, należy użyć poprawnej nazwy commita (SR401145) oraz poprawny numer laboratorium (LabN)

```
#!/bin/bash
index="SR401145"
lab=".*Lab[0-9]+.*"
title='head -n1 $1'

if ! [[ $(head -n1 $1 | cut -c1-8)  == "$index" ]]; then
	echo "Error - wrong ID"
	exit 1;
fi
if ! grep -E -w -o "$lab" "$1" ; then
	echo "Error - wrong lab number!"
	exit 1
fi

echo "Commit approved!"
exit 0;
```

![](screen/git-hook.png)

2. Przetestowano poprawne działanie hooka:

![](screen/hook-test.png)

# Środowisko dockerowe
Wykorzystywanym systemem operacyjnym jest Ubuntu, zatem nie była wykorzystywana maszyna wirtualna.

1. Instalacja dockera:
```
$ sudo apt install docker.io
```
![](screen/docker-install.png)

2. Przetestowano poprawne działanie dockera 

![](screen/docker-1.png)

3. Uruchomiono przykładowy obraz "hello world"
```
$ sudo docker run hello-world
```
![](screen/hello-world.png)

4. Pobrano obraz dystrybucji linuksowej i uruchomiono go:
```
$ sudo docker pull ubuntu:latest
$ sudo docker run -it ubuntu
```
![](screen/docker-ubuntu.png)

# Utworzenie konta na Docker Hub
Utworzono konto na Docker Hub:
![](screen/dockerhub.png)



