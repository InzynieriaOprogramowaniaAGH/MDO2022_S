### Sprawozdanie  lab02

Do projektu zostały dodane 2 nowe hooki. W tym celu zmodyfikowany został plik commit-msg.sample gdzie został dodany skrypt sprawdzający commit message.


```
if !([[ $1 =~ ^DL299976 ]]); then
	echo "Error - incorrect commit name."
	exit 1
fi

if !([[ $1 =~ .*Lab[0-9][0-9]*. ]]); then
	echo "Error - incorrect commit name."
	exit 1
fi

```

Testy skryptu :

![alt text](lab02-7.png)

![alt text](lab02-8.png)

![alt text](lab02-9.png)

Następnie na maszynie wirualnej został zainstalowany docker.
![alt text](lab02-1.png)

Został pobrany obraz z najnowszą dystrybucją ubuntu.
![alt text](lab02-2.png)

![alt text](lab02-3.png)

Pobrany obraz został uruchomiony.
![alt text](lab02-4.png)

Ostatnik krokiem było założenie konta na stronie DockerHub.
![alt text](lab02-5.png)
