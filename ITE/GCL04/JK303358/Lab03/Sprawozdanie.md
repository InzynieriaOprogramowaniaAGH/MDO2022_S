## Zadania do wykonania
### Wybór oprogramowania na zajęcia
* Znajdź repozytorium z kodem dowolnego oprogramowania, które:
	* dysponuje otwartą licencją
	* jest umieszczone wraz ze swoimi narzędziami Makefile tak, aby możliwe był uruchomienie w repozytorium czegoś na kształt ```make build``` oraz ```make test```. Środowisko Makefile jest dowolne. Może to być automake, meson, npm, maven, nuget, dotnet, msbuild...
	* Zawiera zdefiniowane i obecne w repozytorium testy, które można uruchomić np. jako jeden z "targetów" Makefile'a. Testy muszą jednoznacznie formułować swój raport końcowy (gdy są obecne, zazwyczaj taka jest praktyka)

	Do wykonania zadania wykorzystano repozytorium: https://github.com/EchoOfCasual/Hello-World-With-Tests-Maven.git	

* Sklonuj niniejsze repozytorium, przeprowadź build programu (doinstaluj wymagane zależności)

	Sklonowano repozytorium oraz zainstalowano maven i jave. Przeprowadzono build z uzyciem komendy ```mvn install```

	![maven install 1](Pictures/lab3/mvninstall1.png?raw=true)

	![maven install 2](Pictures/lab3/mvninstall2.png?raw=true)

* Uruchom testy jednostkowe dołączone do repozytorium

	Testy uruchomiono poleceniem ```mvn test```

	![mvn test](Pictures/lab3/mvntest3.png?raw=true)

### Przeprowadzenie buildu w kontenerze
1. Wykonaj kroki build i test wewnątrz wybranego kontenera bazowego. Tj. wybierz "wystarczający" kontener, np ```ubuntu``` dla aplikacji C lub ```node``` dla Node.js
	* uruchom kontener
	* podłącz do niego TTY celem rozpoczęcia interaktywnej pracy
	* zaopatrz kontener w wymagania wstępne (jeżeli proces budowania nie robi tego sam)

	Wybrano kontener ubuntu

	![docker images](Pictures/lab3/images4.png?raw=true)

	Uruchomiono kontener w trybie pracy interaktywnej nadaj mu nazwe lab3build (```sudo docker run --name lab3build -it ubuntu```), zainstalowano gita (```apt-get install git```), oraz maven (```apt-get install maven```) i jave (```apt-get install default-jdk```)

	![docker build and git installation](Pictures/lab3/dockerbuild5.png?raw=true)

	![maven installation in container](Pictures/lab3/dockermvn6.png?raw=true)

	![java installation in container](Pictures/lab3/dockerjava7.png?raw=true)

	* sklonuj repozytorium

	![git clone in container](Pictures/lab3/buildGitClone8.png?raw=true)

	* uruchom build

	![mvn install](Pictures/lab3/buildMvnInstall9.png?raw=true)

	* uruchom testy

	![mvn test](Pictures/lab3/buildMvnTest10.png?raw=true)

2. Stwórz dwa pliki Dockerfile automatyzujące kroki powyżej, z uwzględnieniem następujących kwestii
	* Kontener pierwszy ma przeprowadzać wszystkie kroki aż do builda

	![dockerfile build](Pictures/lab3/dockerfileBuild11.png?raw=true)

	![dockerfile build](Pictures/lab3/dockerfileBuild12.png?raw=true)

	* Kontener drugi ma bazować na pierwszym i wykonywać testy

	![dockerfile test](Pictures/lab3/dockerfileTest13.png?raw=true)

3. Wykaż, że kontener wdraża się i pracuje poprawnie. Pamiętaj o różnicy między obrazem a kontenerem. Co pracuje w takim kontenerze?

	Kontenery dzialaja poprawnie, zakonczyly sie kodem 0 czyli bez bledu.

	![containers](Pictures/lab3/containers14.png?raw=true)
