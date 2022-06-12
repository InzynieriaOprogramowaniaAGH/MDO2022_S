Kewin Tarnowski,
Informatyka Techniczna,
Gr. 8, nr albumu: 401975


Metodyki DevOps
Lab 12


# Przebieg ćwiczenia

- Zmieniono ilość replik na 4:

 ![](im/im1.png)

 ![](im/im2.png)

- Zbadanie stanu wdrożenia za pomocą polecenia rollout:

 ![](im/im3.png)

- Zmieniono ilość replik na 6:

 ![](im/im4.png)

 ![](im/im5.png)

- Ilość replik - 1:

 ![](im/im7.png)

- Ilość replik - 0:

 ![](im/im8.png)

 ![](im/im9.png)
 
- Stworzono Dockerfile z celem wyrzucenia błędu w kontenerze o nazwie 'wrongone'

 ![](im/im10.png)

- Zaktualizowano plik .yaml oraz wdrożono zmiany:

 ![](im/im11.png)

- Efekt:

 ![](im/im12.png)

- Cofnięto zmiany do poprzednio działającej wersji:

 ![](im/im13.png)

- Sprawdzono szczegóły - niestety w międzyczasie odpalałem wdrożenie na nowo z nowym rollbackiem i nie widać na załączonej historii wszystkich zmian replik:

 ![](im/im14.png)

- Stworzono skrypt sprawdzający poprawność wdrożenia, czyli czy zostało wykonane w mniej niż 60 sekund:
	```
	#!/bin/bash
	minikube kubectl -- apply -f hello-app-deployment2.yaml
	gtimeout 60 minikube kubectl -- rollout status deployment hello-app-deployment
	if [ "$?" -eq 0 ]
	then
		echo "poprawnie wdrożono"
	else
		echo "wdrożenie trwało więcej niż 60 sekund"
	fi

- Efekt: 

 ![](im/im15.png)
