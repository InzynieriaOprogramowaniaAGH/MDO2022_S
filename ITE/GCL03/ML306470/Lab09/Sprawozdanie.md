## Zadania do wykonania
### Przygotowanie systemu pod uruchomienie
* Przeprowadź instalację systemu Fedora w VM, skonfiguruj użytkowników (użyj haseł, które można bezkarnie umieścić na GitHubie!), sieć, wybierz podstawowy zbiór oprogramowania, optymalnie bez GUI
	
	Instalacja:
	
	![](ScreenShots/LangSetting.png?raw=true)
	
	![](ScreenShots/Setting01.png?raw=true)
	
	![](ScreenShots/DiscSetting01.png?raw=true)
	
	![](ScreenShots/DiscSetting02.png?raw=true)
	
	![](ScreenShots/DiscSetting03.png?raw=true)
	
	![](ScreenShots/DiscSetting04.png?raw=true)
	
	![](ScreenShots/NetworkSetting.png?raw=true)
	
	![](ScreenShots/MinimalInstall.png?raw=true)
	
	![](ScreenShots/RootPass.png?raw=true)
	
	![](ScreenShots/UserVir1.png?raw=true)
	
	![](ScreenShots/KeyboardSettings.png?raw=true)
	
	![](ScreenShots/InstallComplete.png?raw=true)


* Przeprowadź drugą instalację systemu Fedora w VM - celem drugiego systemu będzie wyłącznie serwowanie repozytorium przez HTTP

	Instalacja drugiej wirtualnej maszyny z fedorą przebiegła podobnie jak poprzednia.
	
	Następnie został wyrany server HTTP Apache, pobrany, uruchomiony i sprawdzony następującymi komendami:
	```
	sudo dnf install httpd -y
	sudo systemctl start httpd.service
	sudo systemctl status httpd 
	
	```
	![](ScreenShots/InstallHTTPD.png?raw=true)
	
	![](ScreenShots/HTTPDStartAndCheck.png?raw=true)
	
	Ustawiono zaporę systemu:
	
	```
	sudo firewall-cmd --permanent --add-service=http
	sudo firewall-cmd --permanent --add-service=https
	sudo firewall-cmd --reload
	```
	
	![](ScreenShots/Firewallpng.png?raw=true)
	
	
	
	Następnie stworzono sieć nazwaną FedoraNetwork i ustawiono ją w obu maszynach w celu umożliwienia komunikacji między nimi.
	
	
	![](ScreenShots/CreateNetwork.png?raw=true)
	
	![](ScreenShots/InternalNetworkSetting.png?raw=true)
	
	
	

	
	
	

	

* Umieść artefakty z projektu na serwerze HTTP

	Ustawiono przekierowywanie portów (z hosta do maszyny) do obydwu maszyn odpowiednio na portach 5789 na 22 i 6789 na 22 w celu możliwości połączenia się przez ssh.
	
	
	![](ScreenShots/sshForwarding.png?raw=true)
	
	
	
	W celu możliwości wrzucenia przez użytkownika pliku jar do folderu var/www/http zmieniono prawa dostępu do niego z użyciem komendy ```chmod 777 html``` i przy użyciu narzędzia narzedzia WinSCP umieszczono plik w odpowiendnim miejscu maszyny z serwerem HTTP.

	![](ScreenShots/jarFilePlacedInHTMLFolder.png?raw=true)
	
	

	
	
	
* Na zainstalowanym systemie wykonaj zbiór poleceń umożliwiających pobranie artefaktu, zapisz polecenia

	Na maszynie bez serwera HTTPS zainstalowano narzędzie wget komendą ```sudo yum install wget -y```
	
	![](ScreenShots/wgetInstall.png?raw=true)
		
	
	
	Pobrano wcześniej przygotowany artefakt przy pomocy zainstalowanego narzędzia komendą ```wget 192.168.100.5/SimpleApp-1.0.0.jar```
	
	![](ScreenShots/DownloadArtifact.png?raw=true)

### Instalacja nienadzorowana
* Zlokalizuj plik odpowiedzi z instalacji

	Zlokalizowano plik odpowiedzi z instalacji, skopiowano go do folderu użytkownika komendą ```cp anaconda-ks.cfg ../home/maciek``` i przeniesiono na hosta z pomocą WinSCP w celu łatwej edycji.

	![](ScreenShots/InstallFileFoundAndCopied.png?raw=true)

* Dodaj do niego elementy odpowiedzialne za wszystkie potrzebne dependencje
* Zdefiniuj repozytoria (co najmniej OS i aktualizacje, najlepiej też depednecje, optymalnie także repozytorium z własnym oprogramowaniem)
```
# Repo
url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64
repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64
```
* Dodaj proces pobierania artefaktu (wybierz co najmniej jedno):
  * Jako czynność atomowa
  * Jako demon uruchamiany po starcie sieci @ boot
  * Jako podłączanie serwera w systemu plików w ramach udziału udostępnionego
  
  
  Zmieniono plik odpowiedzi z instalacji w następujący sposób
  
  ![](ScreenShots/EdittedAnaconda.png?raw=true)
  
  
### Infrastructure as a code
* Umieść plik odpowiedzi w repozytorium

	Umieszczono plik w repozytorium
	
	![](ScreenShots/gitAddAnaconda.png?raw=true)
	
	

* Połącz plik odpowiedzi z ISO instalacyjnym

	W celu połączenia odpowiedzi z ISO instalacyjnym utworzono nową maszynę Fedory i połączono ustawiono jej wcześniej stworzoną sieć.
	
	![](ScreenShots/gitAddAnaconda.png?raw=true)
	
	
	
	Następnie podczas instalacji kliknięto przycisk tab w celu uruchomienia zaawansowanych ustawień+
	
	
	![](ScreenShots/gitAddAnaconda.png?raw=true)
	
	
	
	Po zakończeniu procesu artefakt z powodzeniem został pobrany.
	
	![](ScreenShots/gitAddAnaconda.png?raw=true)

