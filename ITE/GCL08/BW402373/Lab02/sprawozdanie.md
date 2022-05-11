# Sprawozdanie
## Laboratorium nr 2
1. Napisano hook sprawdzający poprawność dodawania commitów z odpowiednimi komentarzami. <br>
[!hook](hook.png)<br>
#!/bin/python3

import sys

messageFile = sys.argv[1]
file = open(messageFile, 'r')
message = file.read()

title = message.split("\n")[0]
content = message.split("\n")[2]

if title != "BW402373":
        print("Wrong commit title. It should contain your initials and index number.")
        exit(1)
if not (content.find("02") != -1 or content.find("2") != -1):
        print("Add exercise number to your commit message")
        exit(2)
else:
        print("Your commit is ready to go!")
        exit(0)
        
2. Działanie hook'a <br>
![hook_working](hook_works.png)
3. Zainstalowano usługę SSH <br>
![ssh](working_ssh.png)
4. Za pomocą SSH połączono się z maszyną wirtualną z poziomu Windowsa.<br>
![win-vm](ssh_connect.png)
5. Wysłanie zdjęcia z Windowsa na maszynę, potwierdzający poprawne połączenie<br>
![send_photo](send.png)
6. Zainstalowano środowisko dockerowe.<br>
![docker_install](docker.png)
7. Wykazanie działania środowiska dockerowego
- pobranie obrazu fedory<br>
![fedora_download](fedora.png)
- uruchomienie polecenia echo z fedory<br>
![fedora_comm](docker_run1.png)
- sprawdzenie uruchomionych kontenerów na dockerze<br>
![containers](docker_fedora.png)
8. Utworzenie konta na Docker Hub<br>
![hub](hub.png)
