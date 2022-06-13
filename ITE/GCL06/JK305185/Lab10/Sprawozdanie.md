# Sprawozdanie lab10
## Jędrzej Kurzępa IT GR06

### Ansible bez klucza ssh
1. Laboratorium zostało wykonane na dwóch uprzednio utworzonych oraz skonfigurowanych maszynach wirtualnych z systemem Fedora. Maszyny posiadały komponenty potrzebne do zbudowania oraz uruchomienia programów. 
2. Przetestowano działanie połączenie z drugą maszyną wirtualną poprzez komendę
   `ping 172.20.10.3`
Po pozytywnym wyniku połączenia wykonano następne kroki.
3. Zainstalowano Ansible.
`sudo dnf install ansible`
4. Stworzono plik konfiguracyjny ansible.cfg
```
[defaults]
inventory=inventory
host_key_checking=False
```
5. Stworzono plik inventory zawierający informacje o docelowych hostach.
```
[fedora]
172.20.10.3

[fedora:vars]
ansible_ssh_user=jedrzej
ansible_ssh_pass=kloaka150
```
6. Następnie wykonano ping do hosta, wykorzystując ansible przy użyciu następującej komendy.
   ` ansible fedora -m ping`
   ![fedora](1.png)
7. Utworzono playbook o nazwie `notebook.yaml`, z zawartością taką jak poniżej(utworzony notebook był uniwersalny dla metody bez klucza ssh oraz tej z kluczem ssh(klucz ssh wygenerowano wcześniej)): 
``` 
   ---

- name: deploy app
  hosts: fedora
  become: yes
  tasks:
    - name: install public keys
      ansible.posix.authorized_key:
        user: jedrzej
        state: present
        key: "{{  lookup('file', '/home/jedrzej/.ssh/id_rsa.pub') }}"
    - name: change sudoers
      ansible.builtin.lineinfile:
        path: /etc/sudoers
        state: present
        regexp: '^%sudo'
        line: '%sudo ALL=(ALL) NOPASSWD: ALL'
        validate: /usr/sbin/visudo -cf %s
    - name: download repository
      shell:
        cmd: rm -rf lab_ansible && git clone https://github.com/kurzepajedrzej/lab_ansible.git && cd lab_ansible && unzip publish_folder00b12e9.zip
        chdir: /home
    - name: run app
      shell:
        cmd: cmake . && make && cd bin && ./calculator.x
        chdir: /home/lab_ansible/publish_folder00b12e9/publish_folder
```
8. Objaśnienie notebooka: Na github w nowym repozytorium dodano paczkę .zip zawierającą odpowiednie pliki (wygenerowane przez Jenkinsa). W przedostatnim kroku pobierane i wypakowywany jest program oraz w ostatnim kroku jest uruchamiany. Na poniższym screenshocie widać pomyślne przejście wyszystkich tasków. 

![fedora2](2_1.png)

### Ansible z kluczem ssh

1. Aby wykonać ten krok, z uprzednio przygotowanym notebookiem (był uniwesalny ponieważ dwa pierwsze kroki odnosiły się do opcji z wykorzystaniem klucza ssh oraz usunięcia potrzeby używania sudo ponieważ przy połączeniu przy użyciu klucza nie używa się hasła)oraz wygenerowanym kluczem ssh, wystarczyło delikatenie zmodyfikować plik inventory(poniżej zmodyfikowany inventory).
```
[fedora]
172.20.10.3

[fedora:vars]
ansible_ssh_user=jedrzej
ansible_ssh_private_key_file=/home/jedrzej/.ssh/id_rsa
```

Wiersz zawierający hasło zastąpiono wierszem prowadzącym do ścieżki zawierającej klucz ssh. Poniżej wykonanie play booka 
![2](2_2.png)

