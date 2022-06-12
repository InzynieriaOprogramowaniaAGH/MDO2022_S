# Krzysztof Maurek #
## Inżynieria Obliczeniowa, gr. 1 ##
### Sprawozdanie 6 ###
Na początku zainstalowałem fedore. Stworzyłem przy tym uprawnienia administratorskie, zaznaczyłem możliwość połączenia poprzez SSH i stworzyłem jedno konto użytkownika.  
![](FedoraInstalacja.png)  
W kolejnym kroku połączyłem się z VirtualBoxem i pobrałem plik anaconda-ks.cfg na główny system.  
![](Zainstalowana.png)  
Następnie dodałem plik z repozytorium na hosting, a zmodyfikowany plik anaconda-ks.cfg na githuba.  
![](anaconda.png)  
Dalej uruchamiam nową maszyne wirtualną i przy instalacji podaje link do pliku anaconda znajdującego się na moim githubie
''inst.ks=https://tinyurl.com/ycks58ee''  
![](Instalacja.png)  
Poniżej zrzut ekranu pokazujący że system został zainstalowany  
![](goodinstalation.png)  
Zrzut ekranu z systemu pokazujący, że pliki programu znajdują się na systemie  
![](finish.png)  
Po drodze napotkałem mały problem, mianowicie po instalacji system uruchamiał się ponownie i znowu chciał się instalować. Udało się to naprawić usuwająć napęd optyczny z wirtualną fedorą.
