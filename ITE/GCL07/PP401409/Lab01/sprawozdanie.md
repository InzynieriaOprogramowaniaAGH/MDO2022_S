# SPRAWOZDANIE Lab01

0. ```ssh-keygen -o```
Utworzenie klucza ssh

![Screenshot](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/33a16f21c8f37e0e704c37d92ff623a8c6b43dde/ITE/GCL07/PP401409/Lab01/Screenshot00%20ssh%20keygen.png)

1.```git clone InzynieriaOprogramowaniaAGH/MDO2022_S```
Sklonowanie repozytorium, wykorzystałam do tego adres po ssh, ponieważ używam weryfikacji dwuetapowej na githubie.
![Screenshot](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/33a16f21c8f37e0e704c37d92ff623a8c6b43dde/ITE/GCL07/PP401409/Lab01/Screenshot01%20Git%20clone%20.png)

2. ```git branch PP401409 oraz git checkout PP401409 ```
Utworzenie a nastepnie przelaczenie sie na wlasny branch (inicjaly + numer indeksu)

```git branch```
Wyswietlenie wszystkich branchy

```mkdir PP401409 ```
utworzenie nowego folderu

```cat > sprawozdanie.txt```
Utworzenie pliku tekstowego

![Screenshot](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/33a16f21c8f37e0e704c37d92ff623a8c6b43dde/ITE/GCL07/PP401409/Lab01/Screenshot04%20Nowy%20branch%20i%20commit.png)

3. ```git status```
Sprawdzenie statusu plików

4. ```git commit -m"Twoja wiadomosc"```
Tworzenie zapisu do lokalnego repozytorium, flaga -m sluzy do nazwania commita

5. ```git push --set-upstream origin PP401409```
Polecenie wypycha na repozytorium zmiany,
![Screenshot](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/33a16f21c8f37e0e704c37d92ff623a8c6b43dde/ITE/GCL07/PP401409/Lab01/Screenshot03%20Push.png)

flaga --set-upstream origin PP401409 
wypychamy na brancha, którego jeszcze nie ma

6. ```git add . ```
Dodanie wszystkich plikow znajdujących się w aktualnej ścieżce do "kolejki" (do następnego commita) 

7. ```pull request```
![Screenshot](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/33a16f21c8f37e0e704c37d92ff623a8c6b43dde/ITE/GCL07/PP401409/Lab01/Screenshot05%20Pull%20request.png)

Poprawiony pull request
![](https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S/blob/33a16f21c8f37e0e704c37d92ff623a8c6b43dde/ITE/GCL07/PP401409/Lab01/Screenshot%20-%20pull%20request.png)
