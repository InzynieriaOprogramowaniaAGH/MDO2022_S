# Sprawozdanie Lab 03

Sławomir Kotula

IT, DevOps, grupa lab 4

Data: 28.03.2022


### Do przeprowadzenia zadania wykorzystano github testowego klienta irssi: https://github.com/irssi/irssi


# Na maszynie wirtualnej Linux Mint sklonowano repozytorium:
![cloning irssi](cloneIrssi.png)

# Doinstalowanie brakujących zależności potrzebnych do zbudowania aplikacji
### Brakujące zależności znaleziono przez wpisanie polecenia meson Build i sprawdzenie czego brakowało
## zainstalowano meson:
![installing meson](installMeson.png)
## bibliotekę glib:
![installing glib](installGlib.png)
## bibliotekę utf-8proc,
![installing utf8](installUtf8.png)
## oraz bibliotekę tinfo
![installing tinfo](installTinfo.png)

# Wywołanie polecenia meson Build
![meson build](mesonBuild1.png)
![meson build](mesonBuild2.png)
![meson build](mesonBuild3.png)
## Aplikacja jest teraz gotowa do zbudowania. Nie będzie zawierała wszystkich funkcjonalności, ale da się uruchomiić

# Zbudowanie Irssi
![building irssi](ninjaIrssi.png)
# Uruchomienie programu irssi
![running irssi](runIrssi.png)
# Uruchomienie testów irssi
![testing irssi](testIrssi.png)
## Udało się uruchomić aplikację irssi na maszynie wirtualnej Linux Mint. Następnie powtórzono te kroki z użyciem dockera i obrazu Ubuntu

# Uruchomienie Ubuntu z bashem
![docker run](dockerRun.png)

## Nowa maszyna jest nie ma gita, kompilatora gcc wymaganego do zbudowania aplikacji czy innych pakietów które trzeba doinstalować
# Instalacja gita (po wykonaniu apt update)
![install git](ubuntuInstallGit.png)

# Sklonowanie repozytorium
![cloning irssi](ubuntuCloneIrssi.png)

# Instalacja meson
![installing meson](ubuntuInstallMeson.png)

# Następnie doinstalowano następujące pakiety: gcc, glib, ssl(libssl-dev), utf8 i tinfo
![installing gcc](ubuntuInstallGcc.png)
![installing ssl](ubuntuInstallSSL.png)

# Meson build pokazuje, że można zbudować aplikację
![meson build](ubuntuMesonBuild1.png)
![meson build](ubuntuMesonBuild2.png)

# Testy działają
![meson test](ubuntuMesonTest.png)

# Aplikacja daje się uruchomić
![irssi run](ubuntuRunIrssi.png)

# Następnie utworzono Dockerfile który powtarza wykonane kroki i tworzy maszynę gotową do uruchomienia aplikacji
![DockerfileBuild](dockerfileBuild.png)

# Docker build tworzy obraz
![docker build](dockerBuildDockerfileBuild1.png)
![docker build](dockerBuildDockerfileBuild2.png)

# Uruchomienie i sprawdzenie działania kontenera
![docker working](dockerWorking.png)

# Powtórzenie kroków dla drugiego dockerfila uruchamiającego testy
![dockerfile test](dockerfileTest.png)
![docker build](dockerBuildDockerFileTest1.png)
![docker build](dockerBuildDockerFileTest2.png)

# Po stworzeniu obrazu z dockerfile można stworzyć kontener i w bashu ją uruchomić
![irssi run](irssiRunOnDocker.png)

# Docker images
![docker images](dockerImages.png)

# Docker ps
![docker ps](dockerPS.png)