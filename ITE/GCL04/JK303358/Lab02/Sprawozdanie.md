## Zadania do wykonania
1. Przygotuj git hook, który rozwiąże najczęstsze problemy z commitami
* hook sprawdzający, czy tytuł commita nazywa się ```<inicjały><numer indeksu>```
* hook sprawdzający, czy w treści commita pada numer labu, właściwy dla zadania

	Hook commit-msg:

	![hook](Pictures/lab2hook2.png?raw=true)

	Dzialanie:
	
	![hook](Pictures/lab2hook.png?raw=true)

2. Umieść hook w sprawozdaniu w taki sposób, aby dało się go przejrzeć

	```
	#!/bin/bash

	title=$(echo `head $1` | awk '{print $1;}')
	message=$(echo `head $1` | awk '{print $2;}')

	if ! [ $title == "JK303358" ]; then 	
		echo "Wrong title."							
		exit 1;								
	fi

	if ! [[ $message =~ .*"2".* ]]; then 	
		echo "Message doesnt contain lab number."							
		exit 1;								
	fi
	echo "Commit message OK!"
	```	

3. Rozpocznij przygotowanie środowiska Dockerowego
    * zapewnij dostęp do maszyny wirtualnej przez zdalny terminal (nie "przez okienko")

	Status serwera ssh na maszynie wirtualnej:
	![ssh status](Pictures/lab2ssh.png?raw=true)

	Polaczenie przez PowerShell:
	![powershell connection](Pictures/lab2ps.png?raw=true)

    * jeżeli nie jest stosowane VM (np. WSL, Mac, natywny linux), wykaż ten fakt **dokładnie**
    * zainstaluj środowisko dockerowe w stosowanym systemie operacyjnym

	![docker installation](Pictures/lab2docker.png?raw=true)

4. Działanie środowiska
    * wykaż, że środowisko dockerowe jest uruchomione i działa (z definicji)
	
	![docker working](Pictures/lab2dockerhw.png?raw=true)

    * wykaż działanie z sposób praktyczny (z własności):
      * pobierz obraz dystrybucji linuksowej i uruchom go

	  ![ubuntu image](Pictures/lab2docker_ubuntu.png?raw=true)
 
      * wyświetl jego numer wersji

	  ![ubuntu version](Pictures/lab2docker_version.png?raw=true)

5. Załóż konto na Docker Hub

	![dockerhub account](Pictures/lab2dockerhub.png?raw=true)

