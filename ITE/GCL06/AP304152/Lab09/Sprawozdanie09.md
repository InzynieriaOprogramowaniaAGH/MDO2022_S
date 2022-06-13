# SPRAWOZDANIE 09

## Przeprowadź instalację systemu Fedora w VM, skonfiguruj użytkowników, sieć, wybierz podstawowy zbiór oprogramowania, optymalnie bez GUI:

- Zastosowana kofiguracja:

![image](https://user-images.githubusercontent.com/72975469/171387284-ea74a4e7-d3ee-464d-8426-6d5c76a4ae6c.png)
- Wybór języka:

![image](https://user-images.githubusercontent.com/72975469/171387373-faf8979d-4e32-4654-8a89-dd1d47deeead.png)
- Włączanie konta root'a:

![image](https://user-images.githubusercontent.com/72975469/171388700-3d1de527-1ab7-43b9-96c4-488bec4edd13.png) 
- Utworzenie konta użytkownika:

![image](https://user-images.githubusercontent.com/72975469/171389837-833e47cc-d5ec-4661-9f54-f89801cd3f55.png)
- Wybór oprogramowania - minimalna instalacja:

![image](https://user-images.githubusercontent.com/72975469/171389695-937d6334-039c-4a46-b19e-4792a8132dce.png)
- Podsumowanie:

![image](https://user-images.githubusercontent.com/72975469/171388788-16f84aff-600f-4ad2-a37d-83dbaa6d8d3f.png)

## Przeprowadź drugą instalację systemu Fedora w VM - celem drugiego systemu będzie wyłącznie serwowanie repozytorium przez HTTP:

### System został sklonowany w VirtualBox:

![image](https://user-images.githubusercontent.com/72975469/172020827-b14fb0ad-bea6-437c-b42c-aec1a2432d09.png)

![image](https://user-images.githubusercontent.com/72975469/171429748-27998c28-6f96-4b1d-9012-266389712d45.png)
- Instalacja httpd:

![image](https://user-images.githubusercontent.com/72975469/171429891-a8d6ae2d-6f2e-480e-a873-b4cf09bd62fe.png)
- Konfiguracja firewall'a:

![image](https://user-images.githubusercontent.com/72975469/171430381-c26f8a06-4810-4b26-8cf8-18eaf71a122c.png)
- Uruchomienie serwera:

![image](https://user-images.githubusercontent.com/72975469/171431117-69db8c31-950e-44c2-a663-2f0a748b8bf7.png)
- Sprawdzenie statusu serwera:

![image](https://user-images.githubusercontent.com/72975469/171634349-f11885f1-096a-494e-8a8b-aef77515c156.png)
## Na zainstalowanym systemie wykonaj zbiór poleceń umożliwiających pobranie artefaktu:
- Artefakt wykorzystywany w tym zadaniu:

![image](https://user-images.githubusercontent.com/72975469/171635069-26081b06-b324-4df8-928d-47f60338c822.png)
- Przeniesienie artefaktu na serwer z pomocą programu Filezilla:

![image](https://user-images.githubusercontent.com/72975469/172015149-cfef57db-d391-4952-b39e-c383909ab991.png)
- Utworzenie odpowiednich folderów oraz przeniesienie artefaktu do folderu serwerowego:

![image](https://user-images.githubusercontent.com/72975469/172015473-74172655-2357-4f02-925b-8b6fcfdf4a4d.png)
- Wyświetlenie danych znajdujących się na serwerze przez przeglądarke:

![image](https://user-images.githubusercontent.com/72975469/172015448-32a1d96f-c434-43d3-8ccc-f4a3dd127bbe.png)
- Pobranie artefaktu poleceniem wget na innej maszynie wirtualnej:

![image](https://user-images.githubusercontent.com/72975469/172016420-246a6156-6c14-4655-a0de-3adb9dc2eb5b.png)

## Zlokalizuj plik odpowiedzi z instalacji:
- Przeniesienie pliku zawierającego konfigurację systemu:

![image](https://user-images.githubusercontent.com/72975469/172017483-aa4d1f0e-cff9-49d5-bbbc-780fc0a127b5.png)
- Przeniesienie pliku konfiguracyjnego przez program Filezilla:

![image](https://user-images.githubusercontent.com/72975469/172017513-f9b62ac6-05ed-4b5f-82fe-3e12b3b6494d.png)
- Umieszczenie pliku w repozytorium:

![image](https://user-images.githubusercontent.com/72975469/172018119-bbaae12f-da49-4c16-a7b0-af01a31c6070.png)

## Dodaj do pliku odpowiedzi niezbędne elementy:
- Zawartość pliku:

![image](https://user-images.githubusercontent.com/72975469/172018625-e05168b7-f055-456c-a87c-8d29b79d1716.png)
- Uzupełnienie pliku o niezbędne polecenia:

`%packages`

`@^minimal-environment`

`wget`

`%end`

- Zdefiniowanie repozytoria:

`url --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=x86_64 repo --name=updates --mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=x86_64`

- Proces pobierania artefaktu:

`%post`

`wget 192.168.8.177/Lab09/cytoscape-1.0.0.tgz`

`%end`

## Zainstaluj system z użyciem pliku odpowiedzi:
- Po uruchomieniu obrazu należu kliknąć klawisz Tab w celu przejścia do zaawansowanej konfiguracji, gdzie korzystamy z polecenia:

`vmlinuz initrd=initrd.img inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-36 rd.live.check quiet inst.ks=https://raw.githubusercontent.com/InzynieriaOprogramowaniaAGH/MDO2022_S/AP304152/ITE/GCL06/AP304152/Lab09/anaconda-ks.cfg`

![image](https://user-images.githubusercontent.com/72975469/172018959-45624fe3-80bc-46b7-8d7a-dd76ebe51c02.png)
- Instalacja:

![image](https://user-images.githubusercontent.com/72975469/172019468-5fd4ba7a-17cb-41a4-be24-b064e0df0b13.png)
- Konfiguracja:

![image](https://user-images.githubusercontent.com/72975469/172019780-73790f35-b854-4662-a235-1e1a1f81485c.png)
- Po instalacji należy wyłączyć maszynę, usunąć zamontowany obraz płyty i ponownie uruchomić maszynę, następnie nalezy się zalogować i sprawdzić czy plik zostal pobrany:

![image](https://user-images.githubusercontent.com/72975469/172020517-b2bbf304-858c-47c0-a4f9-725594c3aa68.png)

