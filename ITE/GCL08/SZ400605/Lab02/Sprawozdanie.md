# Szymon Piotr Zych 400605 Sprawozdanie_Lab02

## 1. Przygotowanie git hooków sprawdzających poprawność tytułu i treści commita

Utworzenie w folderze .git/hooks hooka o odpowiedniej nazwie

![HookCreate](./hook_create.png)

```
#!/bin/bash

ID="SZ400605"
LAB=".*(LAB)[0-9][0-9]*."

if ! [[ $(cat $1) == $ID* ]] ;then
    echo "Bad commit title, should be $ID"
    exit 1
fi

if ! [[ $(tail -1  $1) =~ $LAB]] ;then
    echo "Bad message, should contain LAB+LAB_ID for example LAB02"
    exit 1
fi

```

Aby hook mógł zadziałać musimy zmienić jego uprawnienia

![HookChmod](./hook_chmod.png)
![HookTest](./hook_test.png)

## 2. Instalacja środowiska dockerowego

![DockerInstallation](./docker_install.png)

![Neofetch](./neofetch.png)

## 3. Działanie środowiska

![DockerVer](./DockerVer.png)
![DockerUbuntu](./UbuntuDocker.png)

## 4. Załozenie konta na Docker Hub

![DockerHub](./DockerHub.png)
