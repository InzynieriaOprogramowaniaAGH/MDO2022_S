Sprawozdanie LAB01 Weronika Rusinek 403038

1. Instalacja Git i obsługa SSH: sudo apt install git
![plot](./DEVOPS1_screenshots/SSH_connection.png)
2. Klonowanie SSH: git clone git@github.com:InzynieriaOprogramowaniaAGH/MDO2022_S.git
![plot](./DEVOPS1_screenshots/SSH_clone.png)
3. Przełączanie między gałęziami: git checkout main, git checkout ITE-GCL07
4. Tworzenie nowej gałęzi: git branch WR40303
![plot](./DEVOPS1_screenshots/Branch+sprawozdanie.png)
5. 
  - tworzenie nowego katalogu: mkdir
  - dodawanie sprawozdania: touch
  - Sprawdzenie statusu, śledzenie plików: git status, git add . 
  - Tworzenie commita: git commit -m "nazwa commita"
  -  Wyciąganie brancha: gitt push orign WR403038
![plot](./DEVOPS1_screenshots/add_status.png)
![plot](./DEVOPS1_screenshots/Commit_push.png)
--------------- POPRAWKI KATALOGÓW -----------------------
Poprawki wykonano przy użyciu WSL, a nie tak jak poprzednio maszyny wirtualnej 
1. Wyszukanie poprzednio stworzonej gałęzi i zaimportowanie jej
![plot](./DEVOPS1_screenshots/edit.PNG)
2. Przeniesienie plików do odpowiedniego katalogu
![plot](./DEVOPS1_screenshots/move.PNG)
3. Commit poprawy katalogów: 
![plot](./DEVOPS1_screenshots/commit_poprawa.PNG)
4.Wyczyszczenie i commit dla poprzedniej lokalizacji plików
![plot](./DEVOPS1_screenshots/fix.PNG)
![plot](./DEVOPS1_screenshots/commit_fix.PNG)
6. Pull Request

